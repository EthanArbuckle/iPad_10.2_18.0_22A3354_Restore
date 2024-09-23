@implementation FARequestConfigurator

void __74__FARequestConfigurator_FamilyCircleUI__requestForContext_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (v10)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16B0]), "initWithURL:", v10);
    objc_msgSend(v6, "setHTTPMethod:", CFSTR("POST"));
    v7 = *(_QWORD *)(a1 + 32);
    v8 = (void *)objc_msgSend(v6, "copy");
    (*(void (**)(uint64_t, void *, id))(v7 + 16))(v7, v8, v5);

  }
  else
  {
    v9 = *(_QWORD *)(a1 + 32);
    if (v5)
    {
      (*(void (**)(uint64_t, _QWORD, id))(v9 + 16))(v9, 0, v5);
      goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x24BDD1540], "fa_familyErrorWithCode:", -1008);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v6);
  }

LABEL_6:
}

void __66__FARequestConfigurator_FamilyCircleUI___urlEndpointForEventType___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[16];
  _QWORD v18[17];

  v18[16] = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BE309F0];
  v17[0] = CFSTR("FACircleEventTypeInitiate");
  v17[1] = CFSTR("FACircleEventTypeAcceptInvitation");
  v1 = *MEMORY[0x24BE30988];
  v18[0] = v0;
  v18[1] = v1;
  v2 = *MEMORY[0x24BE30A10];
  v17[2] = CFSTR("FACircleEventTypeAcceptInvitationFromMessages");
  v17[3] = CFSTR("FACircleEventTypeManageCircle");
  v3 = *MEMORY[0x24BE309E0];
  v18[2] = v2;
  v18[3] = v3;
  v4 = *MEMORY[0x24BE30998];
  v17[4] = CFSTR("FACircleEventTypeAddFamilyMember");
  v17[5] = CFSTR("FACircleEventTypeAddFamilyMemberV3");
  v5 = *MEMORY[0x24BE309A0];
  v18[4] = v4;
  v18[5] = v5;
  v6 = *MEMORY[0x24BE309F8];
  v17[6] = CFSTR("FACircleEventTypeInviteViaMessages");
  v17[7] = CFSTR("FACircleEventTypeGetFamilyInvitationsUI");
  v7 = *MEMORY[0x24BE309E8];
  v18[6] = v6;
  v18[7] = v7;
  v8 = *MEMORY[0x24BE30990];
  v17[8] = CFSTR("FACircleEventTypeAddMemberInline");
  v17[9] = CFSTR("FACircleEventTypeFamilyRepair");
  v9 = *MEMORY[0x24BE309D8];
  v18[8] = v8;
  v18[9] = v9;
  v10 = *MEMORY[0x24BE309C8];
  v17[10] = CFSTR("FACircleEventTypeFamilyPicker");
  v17[11] = CFSTR("FACircleEventTypeMercuryJourney");
  v11 = *MEMORY[0x24BE30A00];
  v18[10] = v10;
  v18[11] = v11;
  v12 = *MEMORY[0x24BE309C0];
  v17[12] = CFSTR("FACircleEventTypeViewMemberDetail");
  v17[13] = CFSTR("FACircleEventTypeAddRemoteGuardian");
  v13 = *MEMORY[0x24BE309A8];
  v18[12] = v12;
  v18[13] = v13;
  v17[14] = CFSTR("FACircleEventTypeShowPrivacySafetyUI");
  v17[15] = CFSTR("FACircleEventTypeFamilyPrivacyDisclosureUI");
  v14 = *MEMORY[0x24BE309D0];
  v18[14] = *MEMORY[0x24BE30A18];
  v18[15] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 16);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)_urlEndpointForEventType__eventTypeToEndpointMap;
  _urlEndpointForEventType__eventTypeToEndpointMap = v15;

}

@end
