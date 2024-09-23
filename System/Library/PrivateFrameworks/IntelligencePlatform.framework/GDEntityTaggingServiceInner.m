@implementation GDEntityTaggingServiceInner

- (GDEntityTaggingServiceInner)initWithEtConfig:(id)a3 error:(id *)a4
{
  id v5;

  v5 = a3;
  return (GDEntityTaggingServiceInner *)PersonEntityTaggingService.init(etConfig:)(a3);
}

- (void)personEntityTagsFor:(NSString *)a3 options:(GDPersonEntityTaggingOptionsInner *)a4 completionHandler:(id)a5
{
  sub_1AE62DFA8(self, (int)a2, a3, a4, a5, (uint64_t)&unk_1E5DCE7C8, (uint64_t)&unk_1EED9EA60);
}

- (void)peopleEntityTagsFor:(NSArray *)a3 options:(GDPersonEntityTaggingOptionsInner *)a4 completionHandler:(id)a5
{
  sub_1AE62DFA8(self, (int)a2, a3, a4, a5, (uint64_t)&unk_1E5DCE7A0, (uint64_t)&unk_1EED9EA50);
}

- (void)entitiesForTagWithGdEntityTagType:(int64_t)a3 options:(GDPersonEntityTaggingOptionsInner *)a4 completionHandler:(id)a5
{
  void *v8;
  _QWORD *v9;
  GDPersonEntityTaggingOptionsInner *v10;
  GDEntityTaggingServiceInner *v11;

  v8 = _Block_copy(a5);
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  v10 = a4;
  v11 = self;
  sub_1AE62C930((uint64_t)&unk_1EED9EA40, (uint64_t)v9);
}

- (void)personEntitiesFor:(NSArray *)a3 options:(GDPersonEntityTaggingOptionsInner *)a4 completionHandler:(id)a5
{
  sub_1AE62DFA8(self, (int)a2, a3, a4, a5, (uint64_t)&unk_1E5DCE750, (uint64_t)&unk_1EED9EA30);
}

+ (id)tagNameWithGdTag:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  static PersonEntityTaggingService.tagName(gdTag:)(a3, (uint64_t)a2, a3, v3, v4, v5, v6, v7);
  v8 = (void *)sub_1AE925E18();
  swift_bridgeObjectRelease();
  return v8;
}

+ (int64_t)gdTagTypeWithName:(id)a3
{
  int64_t v3;
  int64_t v4;

  sub_1AE925E3C();
  static PersonEntityTaggingService.gdTagType(name:)();
  v4 = v3;
  swift_bridgeObjectRelease();
  return v4;
}

+ (int64_t)checkServiceState
{
  return static PersonEntityTaggingService.checkServiceState()();
}

- (void)recordStatefulFeedbackWithFeedback:(GDPersonEntityTaggingStatefulFeedback *)a3 error:(id)a4
{
  void *v6;
  _QWORD *v7;
  GDPersonEntityTaggingStatefulFeedback *v8;
  GDEntityTaggingServiceInner *v9;

  v6 = _Block_copy(a4);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  v9 = self;
  sub_1AE62C930((uint64_t)&unk_1EED9EA20, (uint64_t)v7);
}

- (void)recordDirectFeedbackWithGradedTrue:(GDPersonEntityTagDirectFeedbackSet *)a3 gradedFalse:(GDPersonEntityTagDirectFeedbackSet *)a4 ignored:(GDPersonEntityTagDirectFeedbackSet *)a5 neverPresented:(GDPersonEntityTagDirectFeedbackSet *)a6 error:(id)a7
{
  void *v12;
  _QWORD *v13;
  GDPersonEntityTagDirectFeedbackSet *v14;
  GDPersonEntityTagDirectFeedbackSet *v15;
  GDPersonEntityTagDirectFeedbackSet *v16;
  GDPersonEntityTagDirectFeedbackSet *v17;
  GDEntityTaggingServiceInner *v18;

  v12 = _Block_copy(a7);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = a5;
  v13[5] = a6;
  v13[6] = v12;
  v13[7] = self;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = self;
  sub_1AE62C930((uint64_t)&unk_1EED9E9E0, (uint64_t)v13);
}

- (GDEntityTaggingServiceInner)init
{
  PersonEntityTaggingService.init()();
}

- (void).cxx_destruct
{
  swift_release();

}

@end
