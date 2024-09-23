@implementation PKPaymentAuthorizationDataModel

void __86__PKPaymentAuthorizationDataModel_NanoPassKit__npkSetPassAndPaymentApplicationForAID___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  __int128 v12;
  uint64_t v13;

  v6 = a2;
  objc_msgSend(v6, "deviceInAppPaymentApplications");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __86__PKPaymentAuthorizationDataModel_NanoPassKit__npkSetPassAndPaymentApplicationForAID___block_invoke_2;
  v9[3] = &unk_24CFE96A8;
  v10 = *(id *)(a1 + 32);
  v11 = v6;
  v12 = *(_OWORD *)(a1 + 40);
  v13 = a4;
  v8 = v6;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v9);

}

void __86__PKPaymentAuthorizationDataModel_NanoPassKit__npkSetPassAndPaymentApplicationForAID___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  objc_msgSend(a2, "applicationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(id *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 40), "devicePrimaryInAppPaymentApplication");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    *a3 = 1;
    **(_BYTE **)(a1 + 64) = 1;
  }
}

uint64_t __80__PKPaymentAuthorizationDataModel_NanoPassKit___hasNonPeerPaymentAcceptedPasses__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isPeerPaymentPass") ^ 1;
}

@end
