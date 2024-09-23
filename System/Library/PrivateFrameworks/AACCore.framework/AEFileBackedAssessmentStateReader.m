@implementation AEFileBackedAssessmentStateReader

- (void)dealloc
{
  objc_super v3;

  -[AEFileBackedAssessmentStateReader endObserving]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)AEFileBackedAssessmentStateReader;
  -[AEFileBackedAssessmentStateReader dealloc](&v3, sel_dealloc);
}

- (void)endObserving
{
  void *v2;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 48), "invalidate");
    v2 = *(void **)(a1 + 48);
    *(_QWORD *)(a1 + 48) = 0;

  }
}

- (AEFileBackedAssessmentStateReader)initWithSystemNotificationPrimitives:(id)a3 fileSystemPrimitives:(id)a4 assessmentFileURL:(id)a5 queue:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  AEFileBackedAssessmentStateReader *v15;
  AEFileBackedAssessmentStateReader *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)AEFileBackedAssessmentStateReader;
  v15 = -[AEFileBackedAssessmentStateReader init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_systemNotificationPrimitives, a3);
    objc_storeStrong((id *)&v16->_fileSystemPrimitives, a4);
    objc_storeStrong((id *)&v16->_assessmentFileURL, a5);
    objc_storeStrong((id *)&v16->_queue, a6);
  }
  -[AEFileBackedAssessmentStateReader beginObserving]((id *)&v16->super.isa);
  -[AEFileBackedAssessmentStateReader updateForLatestAssessmentState](v16);

  return v16;
}

- (void)beginObserving
{
  id v2;
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id location;

  if (val)
  {
    objc_initWeak(&location, val);
    v2 = val[3];
    v3 = val[5];
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __51__AEFileBackedAssessmentStateReader_beginObserving__block_invoke;
    v6[3] = &unk_24FA21A70;
    objc_copyWeak(&v7, &location);
    objc_msgSend(v2, "observeAssessmentStateChangeOnQueue:withHandler:", v3, v6);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = val[6];
    val[6] = (id)v4;

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

- (void)updateForLatestAssessmentState
{
  void *v1;
  int v2;

  if (result)
  {
    v1 = result;
    v2 = objc_msgSend(result, "isActive");
    result = (void *)-[AEFileBackedAssessmentStateReader isAssessmentStateActive]((uint64_t)v1);
    if (v2 != (_DWORD)result)
      return (void *)objc_msgSend(v1, "setActive:", result);
  }
  return result;
}

void __51__AEFileBackedAssessmentStateReader_beginObserving__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[AEFileBackedAssessmentStateReader updateForLatestAssessmentState](WeakRetained);

}

- (uint64_t)isAssessmentStateActive
{
  uint64_t v1;
  id v2;
  uint64_t v3;

  if (result)
  {
    v1 = *(_QWORD *)(result + 16);
    v2 = *(id *)(result + 32);
    v3 = objc_msgSend(v2, "fileExistsAtURL:", v1);

    return v3;
  }
  return result;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateChangeNotificationObservation, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_fileSystemPrimitives, 0);
  objc_storeStrong((id *)&self->_systemNotificationPrimitives, 0);
  objc_storeStrong((id *)&self->_assessmentFileURL, 0);
}

@end
