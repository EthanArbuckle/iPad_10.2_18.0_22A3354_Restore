@implementation EARSpeechRecognition

void __73___EARSpeechRecognition_splitRecognitionWithPotentialCommandRecognition___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v5 = a2;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__2;
  v16 = __Block_byref_object_dispose__2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73___EARSpeechRecognition_splitRecognitionWithPotentialCommandRecognition___block_invoke_2;
  v7[3] = &unk_1E5D46EC0;
  v11 = *(_BYTE *)(a1 + 56);
  v6 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v10 = a3;
  v8 = v6;
  v9 = &v12;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v13[5]);

  _Block_object_dispose(&v12, 8);
}

void __73___EARSpeechRecognition_splitRecognitionWithPotentialCommandRecognition___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *, uint64_t);
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v3 = a2;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__2;
  v21 = __Block_byref_object_dispose__2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v22 = (id)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __73___EARSpeechRecognition_splitRecognitionWithPotentialCommandRecognition___block_invoke_3;
  v10 = &unk_1E5D46E98;
  v16 = *(_BYTE *)(a1 + 64);
  v4 = *(_QWORD *)(a1 + 32);
  v14 = &v17;
  v11 = v4;
  v5 = v3;
  v6 = *(_QWORD *)(a1 + 56);
  v12 = v5;
  v15 = v6;
  v13 = *(id *)(a1 + 40);
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", &v7);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v18[5], v7, v8, v9, v10, v11);

  _Block_object_dispose(&v17, 8);
}

void __73___EARSpeechRecognition_splitRecognitionWithPotentialCommandRecognition___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  id v15;
  const char *v16;
  size_t v17;
  _QWORD *v18;
  _OWORD v19[17];

  v5 = a2;
  v6 = v5;
  if (*(_BYTE *)(a1 + 72))
  {
    if ((objc_msgSend(v5, "appendedAutoPunctuation") & 1) == 0
      && (objc_msgSend(v6, "prependedAutoPunctuation") & 1) == 0)
    {
      goto LABEL_4;
    }
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 64);
    if (v9 != objc_msgSend(*(id *)(a1 + 48), "count") - 1)
    {
      v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v8, "copy");
      objc_msgSend(v12, "addObject:", v13);

      goto LABEL_12;
    }
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count")
      || (objc_msgSend(v6, "appendedAutoPunctuation") & 1) == 0
      && !objc_msgSend(v6, "prependedAutoPunctuation")
      || (v10 = *(void **)(*(_QWORD *)(a1 + 32) + 32),
          objc_msgSend(v6, "tokenName"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          LOBYTE(v10) = objc_msgSend(v10, "containsObject:", v11),
          v11,
          (v10 & 1) != 0))
    {
LABEL_4:
      v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      objc_msgSend(*(id *)(a1 + 32), "adjustSpaceForTokens:currTokenIndex:endsOfSentencePunctuations:isPotentialCommandRecognition:", *(_QWORD *)(a1 + 40), a3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), *(unsigned __int8 *)(a1 + 72));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v8);
LABEL_12:

      goto LABEL_13;
    }
    if (quasar::gLogLevel >= 5)
    {
      memset(v19, 0, sizeof(v19));
      kaldi::KaldiWarnMessage::KaldiWarnMessage((kaldi::KaldiWarnMessage *)v19);
      v14 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v19, (uint64_t)"Deleting punctuation: ", 22);
      objc_msgSend(v6, "tokenName");
      v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v16 = (const char *)objc_msgSend(v15, "UTF8String");
      v17 = strlen(v16);
      v18 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v14, (uint64_t)v16, v17);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)" from potentialPrecedingRecognition", 35);

      quasar::QuasarDebugMessage::~QuasarDebugMessage((quasar::QuasarDebugMessage *)v19);
    }
  }
LABEL_13:

}

@end
