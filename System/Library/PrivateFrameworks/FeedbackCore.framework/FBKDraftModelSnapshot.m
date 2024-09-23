@implementation FBKDraftModelSnapshot

- (FBKDraftModelSnapshot)initWithQuestionGroups:(id)a3 questions:(id)a4 deviceDiagnostics:(id)a5
{
  id v9;
  id v10;
  id v11;
  FBKDraftModelSnapshot *v12;
  FBKDraftModelSnapshot *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSArray *devices;
  uint64_t v27;
  NSDictionary *deviceIdToAttachments;
  FBKDraftModelSnapshot *v30;
  id v31;
  id v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  objc_super v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v38.receiver = self;
  v38.super_class = (Class)FBKDraftModelSnapshot;
  v12 = -[FBKDraftModelSnapshot init](&v38, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_questionGroups, a3);
    objc_storeStrong((id *)&v13->_questionGroupIdToQuestions, a4);
    v33 = (void *)objc_opt_new();
    v14 = (void *)objc_opt_new();
    if (v11)
    {
      v30 = v13;
      v31 = v10;
      v32 = v9;
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      objc_msgSend(v11, "generateSnapshotIdentifiersTrackingLastDevice:", 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v35;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v35 != v18)
              objc_enumerationMutation(v15);
            v20 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
            objc_msgSend(v11, "maybeDeviceWithIdentifier:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if (v21)
            {
              objc_msgSend(v33, "addObject:", v21);
              objc_msgSend(v21, "identifier");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = (void *)objc_opt_new();
              objc_msgSend(v14, "setObject:forKeyedSubscript:", v23, v22);
            }
            else
            {
              objc_msgSend(v11, "maybeAttachmentWithIdentifier:", v20);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "deviceUUID");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "objectForKeyedSubscript:", v23);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "addObject:", v22);

            }
          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
        }
        while (v17);
      }

      v10 = v31;
      v9 = v32;
      v13 = v30;
    }
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v33);
    v25 = objc_claimAutoreleasedReturnValue();
    devices = v13->_devices;
    v13->_devices = (NSArray *)v25;

    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v14);
    v27 = objc_claimAutoreleasedReturnValue();
    deviceIdToAttachments = v13->_deviceIdToAttachments;
    v13->_deviceIdToAttachments = (NSDictionary *)v27;

  }
  return v13;
}

- (NSArray)questionGroups
{
  return self->_questionGroups;
}

- (void)setQuestionGroups:(id)a3
{
  objc_storeStrong((id *)&self->_questionGroups, a3);
}

- (NSDictionary)questionGroupIdToQuestions
{
  return self->_questionGroupIdToQuestions;
}

- (void)setQuestionGroupIdToQuestions:(id)a3
{
  objc_storeStrong((id *)&self->_questionGroupIdToQuestions, a3);
}

- (NSArray)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
  objc_storeStrong((id *)&self->_devices, a3);
}

- (NSDictionary)deviceIdToAttachments
{
  return self->_deviceIdToAttachments;
}

- (void)setDeviceIdToAttachments:(id)a3
{
  objc_storeStrong((id *)&self->_deviceIdToAttachments, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceIdToAttachments, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_questionGroupIdToQuestions, 0);
  objc_storeStrong((id *)&self->_questionGroups, 0);
}

- (BOOL)hasAnyDevices
{
  FBKDraftModelSnapshot *v2;
  NSArray *v3;
  unint64_t v4;
  uint64_t v5;

  v2 = self;
  v3 = -[FBKDraftModelSnapshot devices](v2, sel_devices);
  sub_21DA3BF58(0, &qword_255399B70);
  v4 = sub_21DAC496C();

  if (v4 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_21DAC4DBC();

    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);

  }
  swift_bridgeObjectRelease();
  return v5 > 0;
}

- (NSArray)allQuestions
{
  FBKDraftModelSnapshot *v2;
  NSDictionary *v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  v3 = -[FBKDraftModelSnapshot questionGroupIdToQuestions](v2, sel_questionGroupIdToQuestions);
  sub_21DA3BF58(0, &qword_255398F18);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25539AD28);
  sub_21DA6EECC();
  v4 = sub_21DAC47EC();

  sub_21DAB4148(v4);
  swift_bridgeObjectRelease();
  sub_21DA3BF58(0, &qword_255399360);
  v5 = (void *)sub_21DAC4960();
  swift_bridgeObjectRelease();
  return (NSArray *)v5;
}

- (NSArray)allAttachments
{
  FBKDraftModelSnapshot *v2;
  NSDictionary *v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  v3 = -[FBKDraftModelSnapshot deviceIdToAttachments](v2, sel_deviceIdToAttachments);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25539AD30);
  v4 = sub_21DAC47EC();

  sub_21DAB42B4(v4);
  swift_bridgeObjectRelease();
  sub_21DA3BF58(0, (unint64_t *)&unk_255399230);
  v5 = (void *)sub_21DAC4960();
  swift_bridgeObjectRelease();
  return (NSArray *)v5;
}

- (NSArray)sections
{
  return (NSArray *)sub_21DAB50F0(self, (uint64_t)a2, (void (*)(void))sub_21DAB4768, &qword_25539AD40);
}

- (id)rowsForSection:(id)a3
{
  id v4;
  FBKDraftModelSnapshot *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  sub_21DAB4A80(v4);

  sub_21DA3BF58(0, &qword_25539AD38);
  v6 = (void *)sub_21DAC4960();
  swift_bridgeObjectRelease();
  return v6;
}

@end
