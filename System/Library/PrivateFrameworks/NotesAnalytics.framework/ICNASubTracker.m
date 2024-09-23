@implementation ICNASubTracker

- (ICNASubTracker)initWithName:(id)a3
{
  return -[ICNASubTracker initWithName:parentAATracker:](self, "initWithName:parentAATracker:", a3, 0);
}

- (ICNASubTracker)initWithName:(id)a3 parentTracker:(id)a4
{
  id v6;
  void *v7;
  ICNASubTracker *v8;

  v6 = a3;
  objc_msgSend(a4, "aaTracker");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ICNASubTracker initWithName:parentAATracker:](self, "initWithName:parentAATracker:", v6, v7);

  return v8;
}

- (ICNASubTracker)initWithName:(id)a3 parentAATracker:(id)a4
{
  id v7;
  id v8;
  ICNASubTracker *v9;
  ICNASubTracker *v10;
  void *v11;
  _QWORD v13[4];
  ICNASubTracker *v14;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)ICNASubTracker;
  v9 = -[ICNASubTracker init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_aaTrackerName, a3);
    +[ICNAController sharedController](ICNAController, "sharedController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __47__ICNASubTracker_initWithName_parentAATracker___block_invoke;
    v13[3] = &unk_1E771C520;
    v14 = v10;
    objc_msgSend(v11, "newAATrackerWithName:parentAATracker:completionBlock:", v7, v8, v13);

  }
  return v10;
}

uint64_t __47__ICNASubTracker_initWithName_parentAATracker___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAaTracker:", a2);
}

- (AATracker)aaTracker
{
  return (AATracker *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAaTracker:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)aaTrackerName
{
  return self->_aaTrackerName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aaTrackerName, 0);
  objc_storeStrong((id *)&self->_aaTracker, 0);
}

@end
