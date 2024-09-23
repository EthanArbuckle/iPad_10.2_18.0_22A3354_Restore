@implementation CNPRUISIncomingCallSnapshotDefinition

- (CNPRUISIncomingCallSnapshotDefinition)initWithWrappedDefinition:(id)a3
{
  id v5;
  CNPRUISIncomingCallSnapshotDefinition *v6;
  CNPRUISIncomingCallSnapshotDefinition *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNPRUISIncomingCallSnapshotDefinition;
  v6 = -[CNPRUISIncomingCallSnapshotDefinition init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_wrappedDefinition, a3);

  return v7;
}

- (id)levelSets
{
  void *v2;
  void *v3;

  -[PRUISIncomingCallSnapshotDefinition levelSets](self->_wrappedDefinition, "levelSets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_cn_map:", &__block_literal_global_262);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (PRUISIncomingCallSnapshotDefinition)wrappedDefinition
{
  return self->_wrappedDefinition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappedDefinition, 0);
}

CNPRPosterLevelSet *__50__CNPRUISIncomingCallSnapshotDefinition_levelSets__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  CNPRPosterLevelSet *v3;

  v2 = a2;
  v3 = -[CNPRPosterLevelSet initWithWrappedLevelSet:]([CNPRPosterLevelSet alloc], "initWithWrappedLevelSet:", v2);

  return v3;
}

+ (id)compositeSnapshotDefinitionWithContext:(id)a3 attachmentIdentifiers:(id)a4
{
  Class (__cdecl *v6)();
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = (Class (__cdecl *)())getPRUISIncomingCallSnapshotDefinitionClass[0];
  v7 = a4;
  v8 = a3;
  v9 = objc_alloc(v6());
  getPRPosterSnapshotDefinitionIdentifierIncomingCallComposite[0]();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "wrappedIncomingCallPosterContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(v9, "initWithBaseIdentifier:context:attachmentUniqueIdentifiers:", v10, v11, v7);
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithWrappedDefinition:", v12);

  return v13;
}

+ (id)contentsAndObscurableContentSnapshotDefinitionWithContext:(id)a3 attachmentIdentifiers:(id)a4
{
  Class (__cdecl *v6)();
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = (Class (__cdecl *)())getPRUISIncomingCallSnapshotDefinitionClass[0];
  v7 = a4;
  v8 = a3;
  v9 = objc_alloc(v6());
  getPRPosterSnapshotDefinitionIdentifierIncomingCallPosterContentsWithObscurableContentView[0]();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "wrappedIncomingCallPosterContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(v9, "initWithBaseIdentifier:context:attachmentUniqueIdentifiers:", v10, v11, v7);
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithWrappedDefinition:", v12);

  return v13;
}

+ (id)contentsAndOverlayContentSnapshotDefinitionWithContext:(id)a3 attachmentIdentifiers:(id)a4
{
  Class (__cdecl *v6)();
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = (Class (__cdecl *)())getPRUISIncomingCallSnapshotDefinitionClass[0];
  v7 = a4;
  v8 = a3;
  v9 = objc_alloc(v6());
  getPRPosterSnapshotDefinitionIdentifierIncomingCallPosterContentsWithOverlay[0]();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "wrappedIncomingCallPosterContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(v9, "initWithBaseIdentifier:context:attachmentUniqueIdentifiers:", v10, v11, v7);
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithWrappedDefinition:", v12);

  return v13;
}

+ (id)contentsOnlySnapshotDefinitionWithContext:(id)a3 attachmentIdentifiers:(id)a4
{
  Class (__cdecl *v6)();
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = (Class (__cdecl *)())getPRUISIncomingCallSnapshotDefinitionClass[0];
  v7 = a4;
  v8 = a3;
  v9 = objc_alloc(v6());
  getPRPosterSnapshotDefinitionIdentifierIncomingCallPosterContentsOnly[0]();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "wrappedIncomingCallPosterContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(v9, "initWithBaseIdentifier:context:attachmentUniqueIdentifiers:", v10, v11, v7);
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithWrappedDefinition:", v12);

  return v13;
}

@end
