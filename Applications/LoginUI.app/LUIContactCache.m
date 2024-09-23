@implementation LUIContactCache

+ (id)sharedInstance
{
  if (qword_100088CC0 != -1)
    dispatch_once(&qword_100088CC0, &stru_100068CA0);
  return (id)qword_100088CB8;
}

- (LUIContactCache)init
{
  LUIContactCache *v2;
  NSCache *v3;
  NSCache *userCache;
  NSCache *v5;
  NSCache *instructorCache;
  NSOperationQueue *v7;
  NSOperationQueue *operationQueue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)LUIContactCache;
  v2 = -[LUIContactCache init](&v10, "init");
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init((Class)NSCache);
    userCache = v2->_userCache;
    v2->_userCache = v3;

    v5 = (NSCache *)objc_alloc_init((Class)NSCache);
    instructorCache = v2->_instructorCache;
    v2->_instructorCache = v5;

    v7 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = v7;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_operationQueue, "setMaxConcurrentOperationCount:", 10);
  }
  return v2;
}

- (id)contactForUser:(id)a3 isInstructor:(BOOL)a4
{
  return -[LUIContactCache contactForUser:isInstructor:isTemporarySession:](self, "contactForUser:isInstructor:isTemporarySession:", a3, a4, 0);
}

- (id)contactForUser:(id)a3 isInstructor:(BOOL)a4 isTemporarySession:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  if (v6)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[LUIContactCache instructorCache](self, "instructorCache"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
  }
  else
  {
    if (v5)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[LUIContactCache contactWithGuestImage](self, "contactWithGuestImage"));
      goto LABEL_11;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[LUIContactCache userCache](self, "userCache"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "username"));
  }
  v12 = (void *)v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v10));

  if (!v11)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[LUIContactCache loadContactForUser:isInstructor:](self, "loadContactForUser:isInstructor:", v8, v6));
    if (v6)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[LUIContactCache instructorCache](self, "instructorCache"));
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[LUIContactCache userCache](self, "userCache"));
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "username"));
    }
    v15 = (void *)v14;
    objc_msgSend(v13, "setObject:forKey:", v11, v14);

  }
LABEL_11:

  return v11;
}

- (id)loadContactForUser:(id)a3 isInstructor:(BOOL)a4
{
  id v6;
  CNMutableContact *v7;
  void *v8;
  void *v9;
  CNMutableContact *v10;
  id v11;
  void *v12;
  void *v13;
  CNMutableContact *v14;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  LUIContactCache *v21;
  CNMutableContact *v22;
  BOOL v23;

  v6 = a3;
  v7 = objc_opt_new(CNMutableContact);
  -[CNMutableContact setContactType:](v7, "setContactType:", 0);
  if (!a4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "givenName"));
    -[CNMutableContact setGivenName:](v7, "setGivenName:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "familyName"));
    -[CNMutableContact setFamilyName:](v7, "setFamilyName:", v9);

  }
  v16 = _NSConcreteStackBlock;
  v17 = 3221225472;
  v18 = sub_100002BD0;
  v19 = &unk_100068CC8;
  v23 = a4;
  v20 = v6;
  v21 = self;
  v10 = v7;
  v22 = v10;
  v11 = v6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", &v16));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[LUIContactCache operationQueue](self, "operationQueue", v16, v17, v18, v19));
  objc_msgSend(v13, "addOperation:", v12);

  v14 = v10;
  return v14;
}

- (void)updateContactImageDataForUser:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LUIContactCache instructorCache](self, "instructorCache"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", v5));

  if (v6)
    -[LUIContactCache updateContactImageDataForUser:isInstructor:](self, "updateContactImageDataForUser:isInstructor:", v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "username"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[LUIContactCache userCache](self, "userCache"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "username"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v9));

    if (v10)
      -[LUIContactCache updateContactImageDataForUser:isInstructor:](self, "updateContactImageDataForUser:isInstructor:", v11, 0);
  }

}

- (void)updateContactImageDataForUser:(id)a3 isInstructor:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void **v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id v18;

  v4 = a4;
  v6 = a3;
  if (v6)
  {
    if (v4)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[LUIContactCache instructorCache](self, "instructorCache"));
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[LUIContactCache userCache](self, "userCache"));
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "username"));
    }
    v9 = (void *)v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v8));

    if (v10)
    {
      v13 = _NSConcreteStackBlock;
      v14 = 3221225472;
      v15 = sub_100002F20;
      v16 = &unk_100068C30;
      v17 = v6;
      v18 = v10;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", &v13));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[LUIContactCache operationQueue](self, "operationQueue", v13, v14, v15, v16));
      objc_msgSend(v12, "addOperation:", v11);

    }
  }

}

- (void)deleteContactCache
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[LUIContactCache userCache](self, "userCache"));
  objc_msgSend(v2, "removeAllObjects");

}

- (id)contactWithGroupImage
{
  void *v3;
  id v4;
  void *v5;
  UIImage *v6;
  NSData *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LUIContactCache groupImageContact](self, "groupImageContact"));

  if (!v3)
  {
    v4 = objc_alloc_init((Class)CNMutableContact);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("ClassSilhouette")));
    v6 = (UIImage *)objc_claimAutoreleasedReturnValue(-[LUIContactCache _monogramImageFromTemplateImage:](self, "_monogramImageFromTemplateImage:", v5));
    v7 = UIImagePNGRepresentation(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    objc_msgSend(v4, "setImageData:", v8);

    -[LUIContactCache setGroupImageContact:](self, "setGroupImageContact:", v4);
  }
  return -[LUIContactCache groupImageContact](self, "groupImageContact");
}

- (id)contactWithGuestImage
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  UIImage *v8;
  NSData *v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LUIContactCache guestImageContact](self, "guestImageContact"));

  if (!v3)
  {
    v4 = objc_alloc_init((Class)CNMutableContact);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("GUEST"), &stru_100069EB8, 0));
    objc_msgSend(v4, "setGivenName:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("BigGuest")));
    v8 = (UIImage *)objc_claimAutoreleasedReturnValue(-[LUIContactCache _monogramImageFromTemplateImage:](self, "_monogramImageFromTemplateImage:", v7));
    v9 = UIImagePNGRepresentation(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    objc_msgSend(v4, "setImageData:", v10);

    -[LUIContactCache setGuestImageContact:](self, "setGuestImageContact:", v4);
  }
  return -[LUIContactCache guestImageContact](self, "guestImageContact");
}

- (id)_monogramImageFromTemplateImage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[LUIImageCache sharedInstance](LUIImageCache, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "monogramGroupImageColor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tintedImageFromImage:color:", v3, v6));

  return v7;
}

- (void)clearGroupAndGuestImageContact
{
  CNContact *groupImageContact;
  CNContact *guestImageContact;

  groupImageContact = self->_groupImageContact;
  self->_groupImageContact = 0;

  guestImageContact = self->_guestImageContact;
  self->_guestImageContact = 0;

}

- (NSCache)userCache
{
  return self->_userCache;
}

- (void)setUserCache:(id)a3
{
  objc_storeStrong((id *)&self->_userCache, a3);
}

- (NSCache)instructorCache
{
  return self->_instructorCache;
}

- (void)setInstructorCache:(id)a3
{
  objc_storeStrong((id *)&self->_instructorCache, a3);
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_operationQueue, a3);
}

- (CNContact)groupImageContact
{
  return self->_groupImageContact;
}

- (void)setGroupImageContact:(id)a3
{
  objc_storeStrong((id *)&self->_groupImageContact, a3);
}

- (CNContact)guestImageContact
{
  return self->_guestImageContact;
}

- (void)setGuestImageContact:(id)a3
{
  objc_storeStrong((id *)&self->_guestImageContact, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guestImageContact, 0);
  objc_storeStrong((id *)&self->_groupImageContact, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_instructorCache, 0);
  objc_storeStrong((id *)&self->_userCache, 0);
}

@end
