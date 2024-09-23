@implementation NULivePhotoRenderClient

- (NULivePhotoRenderClient)initWithName:(id)a3 responseQueue:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NULivePhotoRenderClient;
  return -[NURenderClient initWithName:responseQueue:](&v5, sel_initWithName_responseQueue_, a3, a4);
}

- (void)submitGenericRequest:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v10 = a3;
  -[NURenderClient responseQueue](self, "responseQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setResponseQueue:", v7);

  -[NURenderClient priority](self, "priority");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPriority:", v8);

  -[NURenderClient renderContext](self, "renderContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRenderContext:", v9);

  objc_msgSend(v10, "setShouldCoalesceUpdates:", -[NURenderClient shouldCoalesceUpdates](self, "shouldCoalesceUpdates"));
  objc_msgSend(v10, "submit:", v6);

}

@end
