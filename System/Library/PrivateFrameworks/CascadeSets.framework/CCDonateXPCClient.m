@implementation CCDonateXPCClient

- (void)beginSetDonationWithItemType:(unsigned __int16)a3 fromDevice:(id)a4 encodedDescriptors:(id)a5 version:(unint64_t)a6 validity:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  unint64_t v24;
  unsigned __int16 v25;

  v14 = a4;
  v15 = a5;
  v16 = a7;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __108__CCDonateXPCClient_beginSetDonationWithItemType_fromDevice_encodedDescriptors_version_validity_completion___block_invoke;
  v20[3] = &unk_250990938;
  v25 = a3;
  v21 = v14;
  v22 = v15;
  v23 = v16;
  v24 = a6;
  v17 = v16;
  v18 = v15;
  v19 = v14;
  -[CCXPCClient serviceVersionRespondingRequest:completion:usingBlock:](self, "serviceVersionRespondingRequest:completion:usingBlock:", 0, a8, v20);

}

uint64_t __108__CCDonateXPCClient_beginSetDonationWithItemType_fromDevice_encodedDescriptors_version_validity_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "beginSetDonationWithItemType:fromDevice:encodedDescriptors:version:validity:completion:", *(unsigned __int16 *)(a1 + 64), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), a3);
}

- (CCDonateXPCClient)initWithClientId:(id)a3
{
  return -[CCXPCClient initWithRemoteObjectInterface:exportedInterface:serviceName:clientId:interruptionCode:invalidationCode:useCase:](self, "initWithRemoteObjectInterface:exportedInterface:serviceName:clientId:interruptionCode:invalidationCode:useCase:", &unk_25687F138, &unk_25687F1C0, CFSTR("com.apple.SetStoreUpdateService"), a3, 10, 9, *MEMORY[0x24BE0C068]);
}

uint64_t __66__CCDonateXPCClient_addItemsWithContents_metaContents_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "addItemsWithContents:metaContents:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a3);
}

- (void)addItemsWithContents:(id)a3 metaContents:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a3;
  v9 = a4;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __66__CCDonateXPCClient_addItemsWithContents_metaContents_completion___block_invoke;
  v12[3] = &unk_2509908C8;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[CCXPCClient serviceRequest:completion:usingBlock:](self, "serviceRequest:completion:usingBlock:", 1, a5, v12);

}

- (void)abortSetDonation
{
  -[CCXPCClient serviceRequest:completion:usingBlock:](self, "serviceRequest:completion:usingBlock:", 0, 0, &__block_literal_global_2);
}

uint64_t __37__CCDonateXPCClient_abortSetDonation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "abortSetDonation");
}

- (void)removeSourceItemIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __59__CCDonateXPCClient_removeSourceItemIdentifier_completion___block_invoke;
  v8[3] = &unk_2509908F0;
  v9 = v6;
  v7 = v6;
  -[CCXPCClient serviceRequest:completion:usingBlock:](self, "serviceRequest:completion:usingBlock:", 1, a4, v8);

}

uint64_t __59__CCDonateXPCClient_removeSourceItemIdentifier_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "removeSourceItemIdentifier:completion:", *(_QWORD *)(a1 + 32), a3);
}

- (void)mergeDelta:(id)a3 withDeltaMetadata:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a3;
  v9 = a4;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __61__CCDonateXPCClient_mergeDelta_withDeltaMetadata_completion___block_invoke;
  v12[3] = &unk_2509908C8;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[CCXPCClient serviceRequest:completion:usingBlock:](self, "serviceRequest:completion:usingBlock:", 1, a5, v12);

}

uint64_t __61__CCDonateXPCClient_mergeDelta_withDeltaMetadata_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "mergeDelta:withDeltaMetadata:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a3);
}

- (void)endSetDonationWithOptions:(unint64_t)a3 completion:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __58__CCDonateXPCClient_endSetDonationWithOptions_completion___block_invoke;
  v4[3] = &__block_descriptor_40_e45_v24__0__NSObject_CCDonateService__8___v__S_16l;
  v4[4] = a3;
  -[CCXPCClient serviceRequest:completion:usingBlock:](self, "serviceRequest:completion:usingBlock:", 1, a4, v4);
}

uint64_t __58__CCDonateXPCClient_endSetDonationWithOptions_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "endSetDonationWithOptions:completion:", *(_QWORD *)(a1 + 32), a3);
}

@end
