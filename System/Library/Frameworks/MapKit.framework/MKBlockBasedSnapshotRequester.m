@implementation MKBlockBasedSnapshotRequester

+ (id)snapshotRequesterWitHandler:(id)a3
{
  id v3;
  MKBlockBasedSnapshotRequester *v4;

  v3 = a3;
  v4 = objc_alloc_init(MKBlockBasedSnapshotRequester);
  -[MKBlockBasedSnapshotRequester setHandler:](v4, "setHandler:", v3);

  return v4;
}

- (void)mapSnapshotCreator:(id)a3 didCreateSnapshot:(id)a4 attributionString:(id)a5 context:(id)a6
{
  id v8;
  id v9;
  void (**v10)(id, id, id);

  v8 = a5;
  v9 = a4;
  -[MKBlockBasedSnapshotRequester handler](self, "handler");
  v10 = (void (**)(id, id, id))objc_claimAutoreleasedReturnValue();
  v10[2](v10, v9, v8);

}

- (id)handler
{
  return self->handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->handler, 0);
}

@end
