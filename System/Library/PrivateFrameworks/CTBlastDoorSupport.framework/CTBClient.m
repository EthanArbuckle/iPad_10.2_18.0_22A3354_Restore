@implementation CTBClient

- (CTBClient)init
{
  AutoBugCaptureHelper *v3;
  CTBClient *v4;

  v3 = objc_alloc_init(AutoBugCaptureHelper);
  v4 = -[CTBClient initWithAutoBugCaptureHelper:](self, "initWithAutoBugCaptureHelper:", v3);

  return v4;
}

- (CTBClient)initWithAutoBugCaptureHelper:(id)a3
{
  id v5;
  CTBClient *v6;
  CTBClient *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTBClient;
  v6 = -[CTBClient init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_autoBugCaptureHelper, a3);

  return v7;
}

- (AutoBugCaptureProtocol)autoBugCaptureHelper
{
  return self->_autoBugCaptureHelper;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoBugCaptureHelper, 0);
}

- (id)unpackProvisioningXMLData:(id)a3 error:(id *)a4
{
  return sub_2375C2F94(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, unint64_t))sub_2375C1920);
}

- (id)unpackBootstrappingInfoXMLData:(id)a3 error:(id *)a4
{
  return sub_2375C2F94(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, unint64_t))sub_2375C1A80);
}

- (id)unpackCPIMMessageData:(id)a3 error:(id *)a4
{
  return sub_2375C2F94(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, unint64_t))sub_2375C1CAC);
}

- (id)unpackFileTransferDescriptorXMLData:(id)a3 error:(id *)a4
{
  return sub_2375C2F94(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, unint64_t))sub_2375C1E34);
}

- (id)unpackGeoPushLocationXMLData:(id)a3 error:(id *)a4
{
  id v5;
  CTBClient *v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  GeoPushLocation v22;

  v5 = a3;
  v6 = self;
  v7 = sub_2375EAA24();
  v9 = v8;

  v10 = sub_2375EACF4();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (v12 + 15) & 0xFFFFFFFFFFFFFFF0;
  sub_2375BDB78(v9, (__int128 *)((char *)&v19 - v13));
  *(_QWORD *)&v19 = &v19;
  MEMORY[0x24BDAC7A8](v14);
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))((char *)&v19 - v13, (char *)&v19 - v13, v10);
  v22.fLatitude = sub_2375D9500((uint64_t)&v19 - v13);
  ctb::bridging::makeOptional(v22, (uint64_t)&v20);
  v19 = v20;
  v15 = v21;
  v16 = objc_allocWithZone((Class)CTBGeoPushLocationWrapper);
  v21 = v15;
  v20 = v19;
  v17 = objc_msgSend(v16, sel_initWithWrapped_, &v20);
  (*(void (**)(char *, uint64_t))(v11 + 8))((char *)&v19 - v13, v10);

  sub_2375C3068(v7, (unint64_t)v9);
  return v17;
}

- (id)unpackIMDNXMLData:(id)a3 error:(id *)a4
{
  return sub_2375C2F94(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, unint64_t))sub_2375C2184);
}

- (id)unpackSIPConferenceInfoXMLData:(id)a3 error:(id *)a4
{
  return sub_2375C2F94(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, unint64_t))sub_2375C2488);
}

- (id)unpackSIPResourceListsXMLData:(id)a3 error:(id *)a4
{
  return sub_2375C2F94(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, unint64_t))sub_2375C25E8);
}

- (id)unpackCPMGroupManagementXMLData:(id)a3 error:(id *)a4
{
  return sub_2375C2F94(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, unint64_t))sub_2375C274C);
}

- (id)unpackIMCompositionIndicationXMLData:(id)a3 error:(id *)a4
{
  return sub_2375C2F94(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, unint64_t))sub_2375C28A0);
}

- (id)unpackChatBotMessageJSONData:(id)a3 error:(id *)a4
{
  return sub_2375C2F94(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, unint64_t))sub_2375C29F4);
}

- (id)unpackChatBotRenderInformationJSONData:(id)a3 error:(id *)a4
{
  return sub_2375C2F94(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, unint64_t))sub_2375C2B7C);
}

- (id)unpackClientAuthenticityRequestXMLData:(id)a3 error:(id *)a4
{
  return sub_2375C2F94(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, unint64_t))sub_2375C2CDC);
}

- (id)unpackIMRevokeXMLData:(id)a3 error:(id *)a4
{
  return sub_2375C2F94(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, unint64_t))sub_2375C2E40);
}

@end
