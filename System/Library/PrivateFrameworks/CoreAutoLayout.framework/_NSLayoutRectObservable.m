@implementation _NSLayoutRectObservable

+ (id)observableForRect:(id)a3 inItem:(id)a4
{
  return -[_NSLayoutRectObservable initWithRect:inLayoutItem:]([_NSLayoutRectObservable alloc], a3, (uint64_t)a4);
}

- (_QWORD)initWithRect:(uint64_t)a3 inLayoutItem:
{
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[5];
  _QWORD v13[6];
  objc_super v14;

  if (!a1)
    return 0;
  v14.receiver = a1;
  v14.super_class = (Class)_NSLayoutRectObservable;
  v5 = objc_msgSendSuper2(&v14, sel_init);
  if (v5)
  {
    v5[6] = objc_msgSend(a2, "copy");
    v5[7] = a3;
    v13[0] = 0;
    v13[1] = v13;
    v13[2] = 0x3052000000;
    v13[3] = __Block_byref_object_copy_;
    v13[4] = __Block_byref_object_dispose_;
    v13[5] = v5;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __53___NSLayoutRectObservable_initWithRect_inLayoutItem___block_invoke;
    v12[3] = &unk_1E4A48560;
    v12[4] = v13;
    v6 = (void *)objc_msgSend(v12, "copy");
    v7 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "leadingAnchor"), "observableValueInItem:", a3), "addObserverBlock:", v6);
    v8 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "topAnchor"), "observableValueInItem:", a3), "addObserverBlock:", v6);
    v9 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "widthAnchor"), "observableValueInItem:", a3), "addObserverBlock:", v6);
    v10 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "heightAnchor"), "observableValueInItem:", a3), "addObserverBlock:", v6);

    v5[5] = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v7, v8, v9, v10, 0);
    _Block_object_dispose(v13, 8);
  }
  return v5;
}

- (void)_reflectUpdatedRect:(uint64_t)a1
{
  id v2;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 48), "valueInItem:", *(_QWORD *)(a1 + 56));
    v2 = (id)objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:");
    objc_msgSend((id)a1, "receiveObservedValue:", v2);

  }
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_NSLayoutRectObservable;
  -[NSObservationSource dealloc](&v3, sel_dealloc);
}

@end
