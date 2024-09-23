@implementation WFGenerateImageFilesFromGIF

void __WFGenerateImageFilesFromGIF_block_invoke(uint64_t a1)
{
  size_t v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFURL *v6;
  void *v7;
  __CFString *v8;
  CGImageDestination *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  size_t Count;
  id v16;

  Count = CGImageSourceGetCount(*(CGImageSourceRef *)(a1 + 56));
  v16 = (id)objc_opt_new();
  if (Count)
  {
    v2 = 0;
    v14 = *MEMORY[0x24BDF8438];
    do
    {
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        break;
      objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", v14);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%lu"), *(_QWORD *)(a1 + 32), v2 + 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      +[WFFileRepresentation proposedFilenameForFile:ofType:](WFFileRepresentation, "proposedFilenameForFile:ofType:", v4, v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      +[WFTemporaryFileManager createTemporaryFileWithFilename:](WFTemporaryFileManager, "createTemporaryFileWithFilename:", v5);
      v6 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "utType");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "identifier");
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v9 = CGImageDestinationCreateWithURL(v6, v8, 1uLL, 0);

      CGImageDestinationAddImageFromSource(v9, *(CGImageSourceRef *)(a1 + 56), v2, 0);
      CGImageDestinationFinalize(v9);
      CFRelease(v9);
      +[WFFileRepresentation fileWithURL:options:ofType:proposedFilename:](WFFileRepresentation, "fileWithURL:options:ofType:proposedFilename:", v6, 1, v3, v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObject:", v10);

      ++v2;
    }
    while (Count != v2);
  }
  CFRelease(*(CFTypeRef *)(a1 + 56));
  v12 = a1 + 40;
  v11 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v12 + 8) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "userCancelledError");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v11 + 16))(v11, 0, v13);

  }
  else
  {
    (*(void (**)(uint64_t, id, _QWORD))(v11 + 16))(v11, v16, 0);
  }

}

uint64_t __WFGenerateImageFilesFromGIF_block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

@end
