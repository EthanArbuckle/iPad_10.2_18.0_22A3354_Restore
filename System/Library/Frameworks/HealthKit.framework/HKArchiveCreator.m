@implementation HKArchiveCreator

uint64_t __70___HKArchiveCreator_archiveContentsOfDirectoryAtURL_archiveURL_error___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_closeArchiveWithError:");
  return 0;
}

uint64_t __52___HKArchiveCreator_addFileToArchive_pathInArchive___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  BOOL v4;
  uint64_t v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  v4 = 0;
  v5 = 0;
  v6 = (_QWORD *)MEMORY[0x1E0C85AD8];
  while (!v4)
  {
    v7 = (void *)MEMORY[0x19AEC7968]();
    objc_msgSend(*(id *)(a1 + 32), "readDataOfLength:", *v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");
    v4 = v9 == 0;
    if (v9)
    {
      v10 = objc_retainAutorelease(v8);
      v5 += objc_msgSend(v3, "writeData:ofLength:", objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"));
    }

    objc_autoreleasePoolPop(v7);
  }

  return v5;
}

uint64_t __52___HKArchiveCreator_addDataToArchive_pathInArchive___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  id v5;
  uint64_t v6;

  v4 = objc_retainAutorelease(*(id *)(a1 + 32));
  v5 = a2;
  v6 = objc_msgSend(v5, "writeData:ofLength:", objc_msgSend(v4, "bytes"), objc_msgSend(*(id *)(a1 + 32), "length"));

  return v6;
}

void __52___HKArchiveCreator_addFileToArchive_pathInArchive___block_invoke_cold_1(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_fault_impl(&dword_19A0E6000, log, OS_LOG_TYPE_FAULT, "%@: Reading from file failed: %@", buf, 0x16u);

}

@end
