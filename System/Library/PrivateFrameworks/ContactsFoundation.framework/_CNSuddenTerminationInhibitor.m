@implementation _CNSuddenTerminationInhibitor

- (_CNSuddenTerminationInhibitor)init
{
  void *v3;
  _CNSuddenTerminationInhibitor *v4;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_CNSuddenTerminationInhibitor initWithProcessInfo:](self, "initWithProcessInfo:", v3);

  return v4;
}

- (_CNSuddenTerminationInhibitor)initWithProcessInfo:(id)a3
{
  id v5;
  _CNSuddenTerminationInhibitor *v6;
  _CNSuddenTerminationInhibitor *v7;
  _CNSuddenTerminationInhibitor *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CNSuddenTerminationInhibitor;
  v6 = -[_CNSuddenTerminationInhibitor init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_processInfo, a3);
    v8 = v7;
  }

  return v7;
}

- (void)start
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)_CNSuddenTerminationInhibitor;
  -[CNInhibitor start](&v2, sel_start);
}

- (void)stop
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)_CNSuddenTerminationInhibitor;
  -[CNInhibitor stop](&v2, sel_stop);
}

- (NSProcessInfo)processInfo
{
  return self->_processInfo;
}

- (void)setProcessInfo:(id)a3
{
  objc_storeStrong((id *)&self->_processInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processInfo, 0);
}

@end
