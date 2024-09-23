@implementation AMSStorefrontHeaderValueCreation

+ (void)storefrontHeaderValueForAccount:(ACAccount *)a3 bag:(AMSBagProtocol *)a4 mediaType:(NSString *)a5 allowFailedSuffixFetch:(BOOL)a6 completionHandler:(id)a7
{
  void *v12;
  uint64_t v13;
  ACAccount *v14;
  NSString *v15;

  v12 = _Block_copy(a7);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = a3;
  *(_QWORD *)(v13 + 24) = a4;
  *(_QWORD *)(v13 + 32) = a5;
  *(_BYTE *)(v13 + 40) = a6;
  *(_QWORD *)(v13 + 48) = v12;
  *(_QWORD *)(v13 + 56) = a1;
  v14 = a3;
  swift_unknownObjectRetain();
  v15 = a5;
  sub_18C869ACC((uint64_t)&unk_1EE056518, v13);
}

+ (id)combinedStorefrontFromStorefront:(id)a3 suffix:(id)a4 error:(id *)a5
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v6 = sub_18CEC181C();
  v8 = v7;
  if (a4)
  {
    v9 = sub_18CEC181C();
    a4 = v10;
  }
  else
  {
    v9 = 0;
  }
  static StorefrontHeaderValueCreation.combinedStorefront(fromStorefront:suffix:)(v6, v8, v9, (uint64_t)a4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v11 = (void *)sub_18CEC17F8();
  swift_bridgeObjectRelease();
  return v11;
}

- (AMSStorefrontHeaderValueCreation)init
{
  return (AMSStorefrontHeaderValueCreation *)StorefrontHeaderValueCreation.init()();
}

@end
