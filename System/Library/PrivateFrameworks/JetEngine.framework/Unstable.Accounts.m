@implementation Unstable.Accounts

- (void)accountCookiesDidChange:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;

  v4 = sub_19CFDEA74();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4, v6);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_19CFDEA50();
  v9 = *(void **)self->accountsLock;
  swift_retain();
  objc_msgSend(v9, sel_lock);
  v10 = objc_msgSend(*(id *)self->backingStore, sel_ams_activeiTunesAccount);
  v11 = *(void **)self->unlockedActiveiTunesAccount;
  *(_QWORD *)self->unlockedActiveiTunesAccount = v10;

  objc_msgSend(v9, sel_unlock);
  swift_release();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

- (void)accountStoreDidChange:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;

  v3 = sub_19CFDEA74();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3, v5);
  v7 = (char *)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_19CFDEA50();
  swift_retain();
  sub_19CEDA060();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
}

@end
