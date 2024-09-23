@implementation OfflineLabSessionTaskDelegate#1inBankConnectWebServiceClient.uploadOfflineLabData(for:)

- (void)URLSession:()for: task:didCompleteWithError:
{
  id v8;
  id v9;
  _TtCFC10FinanceKit27BankConnectWebServiceClient20uploadOfflineLabDataFzZT3forVS_43BankConnectWebServiceOfflineLabItemsRequest_T_L_29OfflineLabSessionTaskDelegate *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = a5;
  sub_2335BF2F0(v9, a5);

}

- (void)URLSession:()for: task:needNewBodyStream:
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
  NSURLSessionTask *v18;
  _TtCFC10FinanceKit27BankConnectWebServiceClient20uploadOfflineLabDataFzZT3forVS_43BankConnectWebServiceOfflineLabItemsRequest_T_L_29OfflineLabSessionTaskDelegate *v19;
  uint64_t v20;

  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254247060);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_23361E534();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_2560574B8;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_2560574C0;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_2336055F8((uint64_t)v11, (uint64_t)&unk_25604C750, (uint64_t)v16);
  swift_release();
}

- (_TtCFC10FinanceKit27BankConnectWebServiceClient20uploadOfflineLabDataFzZT3forVS_43BankConnectWebServiceOfflineLabItemsRequest_T_L_29OfflineLabSessionTaskDelegate)init
{
  _TtCFC10FinanceKit27BankConnectWebServiceClient20uploadOfflineLabDataFzZT3forVS_43BankConnectWebServiceOfflineLabItemsRequest_T_L_29OfflineLabSessionTaskDelegate *result;

  result = (_TtCFC10FinanceKit27BankConnectWebServiceClient20uploadOfflineLabDataFzZT3forVS_43BankConnectWebServiceOfflineLabItemsRequest_T_L_29OfflineLabSessionTaskDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCFC10FinanceKit27BankConnectWebServiceClient20uploadOfflineLabDataFzZT3forVS_43BankConnectWebServiceOfflineLabItemsRequest_T_L_29OfflineLabSessionTaskDelegate_inputStream));
  v3 = (char *)self
     + OBJC_IVAR____TtCFC10FinanceKit27BankConnectWebServiceClient20uploadOfflineLabDataFzZT3forVS_43BankConnectWebServiceOfflineLabItemsRequest_T_L_29OfflineLabSessionTaskDelegate_continuation;
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2560574D0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
