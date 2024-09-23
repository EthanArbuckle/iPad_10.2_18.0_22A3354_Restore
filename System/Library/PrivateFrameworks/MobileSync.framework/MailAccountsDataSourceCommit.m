@implementation MailAccountsDataSourceCommit

uint64_t __MailAccountsDataSourceCommit_block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[4];

  v1 = *(void **)(*(_QWORD *)(a1 + 48) + 176);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __MailAccountsDataSourceCommit_block_invoke_2;
  v3[3] = &unk_24F645ED0;
  return objc_msgSend(v1, "saveVerifiedAccount:withCompletionHandler:", *(_QWORD *)(a1 + 32), v3);
}

void __MailAccountsDataSourceCommit_block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    if (DLShouldLog())
      goto LABEL_5;
  }
  else if (DLShouldLog())
  {
LABEL_5:
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    _DLLog();
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __MailAccountsDataSourceCommit_block_invoke_3(uint64_t a1)
{
  if (DLShouldLog())
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    _DLLog();
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
