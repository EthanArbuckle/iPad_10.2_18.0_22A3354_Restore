@implementation HDOntologyDownloadTask

id __63___HDOntologyDownloadTask_downloadShardsForEntries_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  v4 = -[_HDOntologyShardDownloadTask initForEntry:downloader:session:group:]([_HDOntologyShardDownloadTask alloc], "initForEntry:downloader:session:group:", v3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(_QWORD *)(a1 + 40));

  objc_msgSend(v4, "resume");
  return v4;
}

void __63___HDOntologyDownloadTask_downloadShardsForEntries_completion___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_taskError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v2 == 0);

}

BOOL __37___HDOntologyDownloadTask__taskError__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

@end
