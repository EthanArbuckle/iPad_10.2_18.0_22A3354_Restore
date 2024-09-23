@implementation AAUploadBatchEventProcessor

- (AAUploadBatchEventProcessor)initWithClient:(id)a3 endpoint:(id)a4
{
  objc_class *ObjectType;
  uint64_t v8;
  id v9;
  id v10;
  AAUploadBatchEventProcessor *v11;
  uint64_t v12;
  uint64_t *v13;
  AAUploadBatchEventProcessor *v14;
  objc_super v16;

  ObjectType = (objc_class *)swift_getObjectType();
  v8 = qword_1ED1CE580;
  v9 = a3;
  swift_unknownObjectRetain_n();
  v10 = v9;
  v11 = self;
  if (v8 != -1)
    swift_once();
  v12 = _s12AppAnalytics25UploadBatchEventProcessorC6client8endpoint11contentType6configAcA6ClientC_AA08EndpointJ0_pAA07ContentJ0OAA0cdE6ConfigCtcfC_0(v10, a4, 0, (id)qword_1ED1CE4E0);
  v13 = (uint64_t *)((char *)v11 + OBJC_IVAR___AAUploadBatchEventProcessor_proxyEventProcessor);
  *v13 = v12;
  v13[1] = (uint64_t)&protocol witness table for UploadBatchEventProcessor;

  v16.receiver = v11;
  v16.super_class = ObjectType;
  v14 = -[AAUploadBatchEventProcessor init](&v16, sel_init);

  swift_unknownObjectRelease();
  return v14;
}

- (AAUploadBatchEventProcessor)initWithClient:(id)a3 endpoint:(id)a4 config:(id)a5
{
  objc_class *ObjectType;
  id v10;
  id v11;
  id v12;
  id v13;
  AAUploadBatchEventProcessor *v14;
  uint64_t v15;
  uint64_t *v16;
  AAUploadBatchEventProcessor *v17;
  objc_super v19;

  ObjectType = (objc_class *)swift_getObjectType();
  v10 = a3;
  swift_unknownObjectRetain_n();
  v11 = a5;
  v12 = v10;
  v13 = v11;
  v14 = self;
  v15 = _s12AppAnalytics25UploadBatchEventProcessorC6client8endpoint11contentType6configAcA6ClientC_AA08EndpointJ0_pAA07ContentJ0OAA0cdE6ConfigCtcfC_0(v12, a4, 0, v13);
  v16 = (uint64_t *)((char *)v14 + OBJC_IVAR___AAUploadBatchEventProcessor_proxyEventProcessor);
  *v16 = v15;
  v16[1] = (uint64_t)&protocol witness table for UploadBatchEventProcessor;

  v19.receiver = v14;
  v19.super_class = ObjectType;
  v17 = -[AAUploadBatchEventProcessor init](&v19, sel_init);

  swift_unknownObjectRelease();
  return v17;
}

- (AAUploadBatchEventProcessor)initWithClient:(id)a3 endpoint:(id)a4 contentType:(int64_t)a5 config:(id)a6
{
  objc_class *ObjectType;
  id v12;
  id v13;
  id v14;
  id v15;
  AAUploadBatchEventProcessor *v16;
  uint64_t v17;
  uint64_t *v18;
  AAUploadBatchEventProcessor *v19;
  objc_super v21;

  ObjectType = (objc_class *)swift_getObjectType();
  v12 = a3;
  swift_unknownObjectRetain_n();
  v13 = a6;
  v14 = v12;
  v15 = v13;
  v16 = self;
  v17 = _s12AppAnalytics25UploadBatchEventProcessorC6client8endpoint11contentType6configAcA6ClientC_AA08EndpointJ0_pAA07ContentJ0OAA0cdE6ConfigCtcfC_0(v14, a4, a5, v15);
  v18 = (uint64_t *)((char *)v16 + OBJC_IVAR___AAUploadBatchEventProcessor_proxyEventProcessor);
  *v18 = v17;
  v18[1] = (uint64_t)&protocol witness table for UploadBatchEventProcessor;

  v21.receiver = v16;
  v21.super_class = ObjectType;
  v19 = -[AAUploadBatchEventProcessor init](&v21, sel_init);

  swift_unknownObjectRelease();
  return v19;
}

- (void)processEvent:(id)a3
{
  sub_1A5F6470C();
  __break(1u);
}

- (AAUploadBatchEventProcessor)init
{
  AAUploadBatchEventProcessor *result;

  result = (AAUploadBatchEventProcessor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

@end
