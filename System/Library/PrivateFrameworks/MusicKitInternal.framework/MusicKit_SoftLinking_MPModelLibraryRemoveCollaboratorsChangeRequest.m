@implementation MusicKit_SoftLinking_MPModelLibraryRemoveCollaboratorsChangeRequest

- (MusicKit_SoftLinking_MPModelLibraryRemoveCollaboratorsChangeRequest)initWithPlaylist:(id)a3 socialProfileIDs:(id)a4
{
  id v6;
  id v7;
  MusicKit_SoftLinking_MPModelLibraryRemoveCollaboratorsChangeRequest *v8;
  void *v9;
  objc_class *v10;
  MPModelLibraryRemoveCollaboratorsChangeRequest *v11;
  MPModelLibraryRemoveCollaboratorsChangeRequest *underlyingRemoveCollaboratorsChangeRequest;
  MPModelLibraryRemoveCollaboratorsChangeRequest *v13;
  void *v14;
  objc_super v16;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MusicKit_SoftLinking_MPModelLibraryRemoveCollaboratorsChangeRequest;
  v8 = -[MusicKit_SoftLinking_MPModelLibraryRemoveCollaboratorsChangeRequest init](&v16, sel_init);
  if (v8)
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x2050000000;
    v9 = (void *)getMPModelLibraryRemoveCollaboratorsChangeRequestClass_softClass;
    v21 = getMPModelLibraryRemoveCollaboratorsChangeRequestClass_softClass;
    if (!getMPModelLibraryRemoveCollaboratorsChangeRequestClass_softClass)
    {
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __getMPModelLibraryRemoveCollaboratorsChangeRequestClass_block_invoke;
      v17[3] = &unk_1E9C05688;
      v17[4] = &v18;
      __getMPModelLibraryRemoveCollaboratorsChangeRequestClass_block_invoke((uint64_t)v17);
      v9 = (void *)v19[3];
    }
    v10 = objc_retainAutorelease(v9);
    _Block_object_dispose(&v18, 8);
    v11 = (MPModelLibraryRemoveCollaboratorsChangeRequest *)objc_alloc_init(v10);
    underlyingRemoveCollaboratorsChangeRequest = v8->_underlyingRemoveCollaboratorsChangeRequest;
    v8->_underlyingRemoveCollaboratorsChangeRequest = v11;

    v13 = v8->_underlyingRemoveCollaboratorsChangeRequest;
    objc_msgSend(v6, "_underlyingModelObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPModelLibraryRemoveCollaboratorsChangeRequest setCollaboration:](v13, "setCollaboration:", v14);

    -[MPModelLibraryRemoveCollaboratorsChangeRequest setSocialProfileIDsToRemove:](v8->_underlyingRemoveCollaboratorsChangeRequest, "setSocialProfileIDsToRemove:", v7);
  }

  return v8;
}

- (void)performWithCompletionHandler:(id)a3
{
  id v4;
  MPModelLibraryRemoveCollaboratorsChangeRequest *underlyingRemoveCollaboratorsChangeRequest;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  underlyingRemoveCollaboratorsChangeRequest = self->_underlyingRemoveCollaboratorsChangeRequest;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __100__MusicKit_SoftLinking_MPModelLibraryRemoveCollaboratorsChangeRequest_performWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E9C05870;
  v8 = v4;
  v6 = v4;
  -[MPModelLibraryRemoveCollaboratorsChangeRequest performWithResponseHandler:](underlyingRemoveCollaboratorsChangeRequest, "performWithResponseHandler:", v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingRemoveCollaboratorsChangeRequest, 0);
}

@end
