@implementation GKActivity

uint64_t __22__GKActivity_execute___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)named:(id)a3 execute:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  +[GKActivity named:](GKActivity, "named:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "execute:", v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_parent, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)execute:(id)a3
{
  id v4;
  NSObject *activity;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  activity = self->_activity;
  if (!activity)
  {
    -[GKActivity createActivity](self, "createActivity");
    activity = self->_activity;
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __22__GKActivity_execute___block_invoke;
  block[3] = &unk_1E75B1520;
  v8 = v4;
  v6 = v4;
  os_activity_apply(activity, block);

}

- (void)createActivity
{
  os_activity_t v3;

  v3 = _os_activity_create(&dword_1BCDE3000, -[NSString UTF8String](self->_name, "UTF8String"), (os_activity_t)self->_parent, (os_activity_flag_t)self->_mode);
  -[GKActivity setActivity:](self, "setActivity:", v3);

}

- (void)setActivity:(id)a3
{
  objc_storeStrong((id *)&self->_activity, a3);
}

+ (id)named:(id)a3
{
  id v3;
  GKActivity *v4;
  GKActivity *v5;

  v3 = a3;
  v4 = [GKActivity alloc];
  v5 = -[GKActivity initWithName:parent:mode:](v4, "initWithName:parent:mode:", v3, MEMORY[0x1E0C80FC8], 2);

  return v5;
}

- (GKActivity)initWithName:(id)a3 parent:(id)a4 mode:(unsigned int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  GKActivity *v10;
  GKActivity *v11;
  objc_super v13;

  v5 = *(_QWORD *)&a5;
  v8 = a3;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)GKActivity;
  v10 = -[GKActivity init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    -[GKActivity setName:](v10, "setName:", v8);
    -[GKActivity setParent:](v11, "setParent:", v9);
    -[GKActivity setMode:](v11, "setMode:", v5);
  }

  return v11;
}

- (void)setParent:(id)a3
{
  objc_storeStrong((id *)&self->_parent, a3);
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (void)setMode:(unsigned int)a3
{
  self->_mode = a3;
}

+ (id)detachedNamed:(id)a3
{
  id v3;
  GKActivity *v4;
  GKActivity *v5;

  v3 = a3;
  v4 = [GKActivity alloc];
  v5 = -[GKActivity initWithName:parent:mode:](v4, "initWithName:parent:mode:", v3, MEMORY[0x1E0C80FC8], 1);

  return v5;
}

+ (id)currentOrNewNamed:(id)a3
{
  id v3;
  GKActivity *v4;
  GKActivity *v5;

  v3 = a3;
  v4 = [GKActivity alloc];
  v5 = -[GKActivity initWithName:parent:mode:](v4, "initWithName:parent:mode:", v3, MEMORY[0x1E0C80FC8], 2);

  return v5;
}

- (id)childNamed:(id)a3
{
  id v4;
  GKActivity *v5;

  v4 = a3;
  if (!self->_activity)
    -[GKActivity createActivity](self, "createActivity");
  v5 = -[GKActivity initWithName:parent:mode:]([GKActivity alloc], "initWithName:parent:mode:", v4, self->_activity, 0);

  return v5;
}

- (void)childNamed:(id)a3 execute:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[GKActivity childNamed:](self, "childNamed:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "execute:", v6);

}

- (id)renamed:(id)a3
{
  -[GKActivity setName:](self, "setName:", a3);
  return self;
}

- (NSString)name
{
  return self->_name;
}

- (unsigned)mode
{
  return self->_mode;
}

- (OS_os_activity)parent
{
  return self->_parent;
}

- (OS_os_activity)activity
{
  return self->_activity;
}

@end
