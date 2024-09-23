@implementation NTKFaceSnapshotRequest

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_face, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
}

- (NTKFaceSnapshotRequest)initWithFace:(id)a3 options:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  NTKFaceSnapshotRequest *v12;
  uint64_t v13;
  NSDate *creationDate;
  uint64_t v15;
  NSDictionary *options;
  uint64_t v17;
  id completion;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)NTKFaceSnapshotRequest;
  v12 = -[NTKFaceSnapshotRequest init](&v20, sel_init);
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = objc_claimAutoreleasedReturnValue();
    creationDate = v12->_creationDate;
    v12->_creationDate = (NSDate *)v13;

    objc_storeStrong((id *)&v12->_face, a3);
    v15 = objc_msgSend(v10, "copy");
    options = v12->_options;
    v12->_options = (NSDictionary *)v15;

    v17 = objc_msgSend(v11, "copy");
    completion = v12->_completion;
    v12->_completion = (id)v17;

  }
  return v12;
}

- (BOOL)isReady
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  char v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, _BYTE *);
  void *v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  -[NTKFaceSnapshotRequest face](self, "face");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __33__NTKFaceSnapshotRequest_isReady__block_invoke;
  v13 = &unk_1E6BCFCE8;
  v3 = v2;
  v14 = v3;
  v15 = &v16;
  objc_msgSend(v3, "enumerateComplicationSlotsWithBlock:", &v10);
  if (*((_BYTE *)v17 + 24))
  {
    objc_msgSend(v3, "device", v10, v11, v12, v13);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nrDeviceUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend((id)NTKFaceSnapshotterComplicationCollections, "objectForKey:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "hasLoaded");

    }
    else
    {
      v7 = 1;
    }
    v8 = v7 & NTKFaceSnapshotterCompanionAppLibraryLoaded;

  }
  else
  {
    v8 = 1;
  }

  _Block_object_dispose(&v16, 8);
  return v8;
}

void __33__NTKFaceSnapshotRequest_isReady__block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "complicationForSlot:", a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v5, "complicationType") == 31;
  *a3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);

}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NTKFace)face
{
  return self->_face;
}

- (NSDictionary)options
{
  return self->_options;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

@end
