@implementation IssuerDirectoryDownloadTaskManager.URLSessionNoCustomCertVerificationDelegate

- (void)URLSession:(NSURLSession *)a3 didReceiveChallenge:(NSURLAuthenticationChallenge *)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  NSURLSession *v17;
  NSURLAuthenticationChallenge *v18;
  _TtCC19HealthRecordsDaemon34IssuerDirectoryDownloadTaskManagerP33_7AB94515F5C396F1FDF73A0A6286A3E442URLSessionNoCustomCertVerificationDelegate *v19;
  uint64_t v20;

  sub_21FA2D1A0(0, (unint64_t *)&qword_255540CF0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6990], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v20 - v10;
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_21FC5B844();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_255540D00;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_255541460;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_21FADF7C8((uint64_t)v11, (uint64_t)&unk_255540D10, (uint64_t)v16);
  swift_release();
}

- (_TtCC19HealthRecordsDaemon34IssuerDirectoryDownloadTaskManagerP33_7AB94515F5C396F1FDF73A0A6286A3E442URLSessionNoCustomCertVerificationDelegate)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for IssuerDirectoryDownloadTaskManager.URLSessionNoCustomCertVerificationDelegate();
  return -[IssuerDirectoryDownloadTaskManager.URLSessionNoCustomCertVerificationDelegate init](&v3, sel_init);
}

@end
