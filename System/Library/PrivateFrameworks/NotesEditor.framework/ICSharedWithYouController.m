@implementation ICSharedWithYouController

+ (ICSharedWithYouController)sharedController
{
  ICSharedWithYouController *v2;
  void *v3;
  ICSharedWithYouController *v4;

  v2 = [ICSharedWithYouController alloc];
  +[ICSharedWithYouControllerInternal sharedController](ICSharedWithYouControllerInternal, "sharedController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ICSharedWithYouController initWithController:](v2, "initWithController:", v3);

  return v4;
}

- (ICSharedWithYouController)initWithController:(id)a3
{
  id v5;
  ICSharedWithYouController *v6;
  ICSharedWithYouController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICSharedWithYouController;
  v6 = -[ICSharedWithYouController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_controller, a3);

  return v7;
}

- (NSManagedObjectContext)managedObjectContext
{
  void *v2;
  void *v3;

  -[ICSharedWithYouController controller](self, "controller");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSManagedObjectContext *)v3;
}

- (void)setManagedObjectContext:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ICSharedWithYouController controller](self, "controller");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setManagedObjectContext:", v4);

}

- (id)highlightForURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (a3)
  {
    v4 = a3;
    -[ICSharedWithYouController controller](self, "controller");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "highlightForURL:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)fetchShareMetadataWithURLs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[ICSharedWithYouController controller](self, "controller");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchShareMetadataWithURLs:completion:", v7, v6);

}

- (void)userAcceptedInvitationWithShareMetadata:(id)a3 associatedObjectID:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[ICSharedWithYouController controller](self, "controller");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "userAcceptedInvitationWithShareMetadata:associatedObjectID:", v7, v6);

}

- (ICSharedWithYouControllerInternal)controller
{
  return self->_controller;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controller, 0);
}

@end
