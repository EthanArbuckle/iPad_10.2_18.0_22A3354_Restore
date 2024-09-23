@implementation CNKCallParticipantLabelDescriptorFactory

- (id)organizationNameProvider
{
  uint64_t v2;
  void *v3;
  _QWORD v5[6];

  v5[4] = static CallParticipantLabelDescriptor.organizationNameProvider.getter(self, a2);
  v5[5] = v2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 1107296256;
  v5[2] = thunk for @escaping @callee_guaranteed (@guaranteed TUCall) -> (@owned String?);
  v5[3] = &block_descriptor_77;
  v3 = _Block_copy(v5);
  swift_release();
  return v3;
}

- (void)setOrganizationNameProvider:(id)a3
{
  void *v4;
  uint64_t v5;
  CNKCallParticipantLabelDescriptorFactory *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  static CallParticipantLabelDescriptor.organizationNameProvider.setter(partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned TUCall) -> (@autoreleased NSString?), v5);

}

- (id)makeLabel
{
  CNKCallParticipantLabelDescriptorFactory *v2;
  id v3;

  v2 = self;
  v3 = CNKCallParticipantLabelDescriptorFactory.makeLabel()();

  return v3;
}

- (id)makeLabelWithString:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  CNKCallParticipantLabelDescriptorFactory *v7;
  void *v8;
  void *v9;

  if (a3)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  CNKCallParticipantLabelDescriptorFactory.makeLabel(using:)(v4, v6);
  v9 = v8;

  swift_bridgeObjectRelease();
  return v9;
}

- (id)makeLabelWithString:(id)a3 secondaryString:(id)a4 layoutState:(int64_t)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CNKCallParticipantLabelDescriptorFactory *v10;
  id v11;

  if (!a3)
  {
    v7 = 0;
    v9 = 0;
    if (!a4)
      goto LABEL_5;
    goto LABEL_3;
  }
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v9 = v8;
  if (a4)
LABEL_3:
    static String._unconditionallyBridgeFromObjectiveC(_:)();
LABEL_5:
  v10 = self;
  v11 = CNKCallParticipantLabelDescriptorFactory.makeLabel(using:secondaryString:layoutState:)(v7, v9);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v11;
}

- (id)labelDescriptorWithStringsForCall:(id)a3 callCount:(int64_t)a4 alertAvailable:(BOOL)a5 allowsDuration:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  CNKCallParticipantLabelDescriptorFactory *v11;
  void *v12;
  void *v13;

  v6 = a6;
  v10 = a3;
  v11 = self;
  CNKCallParticipantLabelDescriptorFactory.labelDescriptor(call:callCount:alertAvailable:allowsDuration:)(v10, a4, a5, v6);
  v13 = v12;

  return v13;
}

- (id)labelDescriptorWithStringsForCall:(id)a3 callCount:(int64_t)a4 callCenter:(id)a5 alertAvailable:(BOOL)a6 allowsDuration:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  id v13;
  CNKCallParticipantLabelDescriptorFactory *v14;
  void *v15;
  void *v16;

  v7 = a7;
  v12 = a3;
  v13 = a5;
  v14 = self;
  CNKCallParticipantLabelDescriptorFactory.labelDescriptor(call:callCount:callCenter:alertAvailable:allowsDuration:)(v12, a4, v13, a6, v7);
  v16 = v15;

  return v16;
}

- (CNKCallParticipantLabelDescriptorFactory)init
{
  return (CNKCallParticipantLabelDescriptorFactory *)CNKCallParticipantLabelDescriptorFactory.init()();
}

@end
