@implementation MKFCKHomePerson

- (BOOL)importIntoLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  objc_super v20;

  v8 = a3;
  v9 = a5;
  v20.receiver = self;
  v20.super_class = (Class)MKFCKHomePerson;
  v10 = -[MKFCKPerson importIntoLocalModel:updatedProperties:context:](&v20, sel_importIntoLocalModel_updatedProperties_context_, v8, a4, v9);
  if (v10)
  {
    -[MKFCKHomePerson home](self, "home");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fetchLocalModelWithContext:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v8, "home");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = HMFEqualObjects();

      if ((v14 & 1) == 0)
        objc_msgSend(v8, "setHome:", v12);
      -[MKFCKHomePerson linkedPhotosPerson](self, "linkedPhotosPerson");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "fetchLocalModelWithContext:", v9);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "linkedPhotosPerson");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = HMFEqualObjects();

      if ((v18 & 1) == 0)
        objc_msgSend(v8, "setLinkedPhotosPerson:", v16);

    }
  }

  return v10;
}

- (BOOL)exportFromLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  char v24;
  objc_super v26;

  v8 = a3;
  v9 = a5;
  v26.receiver = self;
  v26.super_class = (Class)MKFCKHomePerson;
  v10 = -[MKFCKPerson exportFromLocalModel:updatedProperties:context:](&v26, sel_exportFromLocalModel_updatedProperties_context_, v8, a4, v9);
  if (v10)
  {
    objc_msgSend(v8, "home");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[MKFCKModel fetchWithLocalModel:context:](MKFCKHome, "fetchWithLocalModel:context:", v11, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
LABEL_14:

      goto LABEL_15;
    }
    -[MKFCKHomePerson home](self, "home");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqual:", v12);

    if ((v14 & 1) == 0)
      -[MKFCKHomePerson setHome:](self, "setHome:", v12);
    objc_msgSend(v8, "linkedPhotosPerson");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      objc_msgSend(v15, "user");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isOwner");

      if (v18)
      {
        +[MKFCKModel fetchWithLocalModel:context:](MKFCKPhotosPerson, "fetchWithLocalModel:context:", v16, v9);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          -[MKFCKHomePerson linkedPhotosPerson](self, "linkedPhotosPerson");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = HMFEqualObjects();

          if ((v21 & 1) == 0)
            -[MKFCKHomePerson setLinkedPhotosPerson:](self, "setLinkedPhotosPerson:", v19);
        }
        goto LABEL_12;
      }
      -[MKFCKHomePerson linkedSharedPhotosPersonModelID](self, "linkedSharedPhotosPersonModelID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "modelID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = HMFEqualObjects();

      if ((v24 & 1) == 0)
      {
        objc_msgSend(v16, "modelID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[MKFCKHomePerson setLinkedSharedPhotosPersonModelID:](self, "setLinkedSharedPhotosPersonModelID:", v19);
LABEL_12:

      }
    }

    goto LABEL_14;
  }
LABEL_15:

  return v10;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("MKFCKHomePerson"));
}

@end
