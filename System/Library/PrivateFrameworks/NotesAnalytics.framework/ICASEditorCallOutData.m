@implementation ICASEditorCallOutData

- (ICASEditorCallOutData)initWithCollabActivityContextPath:(id)a3 startState:(id)a4 endState:(id)a5
{
  id v9;
  id v10;
  id v11;
  ICASEditorCallOutData *v12;
  ICASEditorCallOutData *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ICASEditorCallOutData;
  v12 = -[ICASEditorCallOutData init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_collabActivityContextPath, a3);
    objc_storeStrong((id *)&v13->_startState, a4);
    objc_storeStrong((id *)&v13->_endState, a5);
  }

  return v13;
}

+ (NSString)dataName
{
  return (NSString *)CFSTR("EditorCallOutData");
}

- (id)toDict
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v14[0] = CFSTR("collabActivityContextPath");
  -[ICASEditorCallOutData collabActivityContextPath](self, "collabActivityContextPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[ICASEditorCallOutData collabActivityContextPath](self, "collabActivityContextPath");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v15[0] = v4;
  v14[1] = CFSTR("startState");
  -[ICASEditorCallOutData startState](self, "startState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[ICASEditorCallOutData startState](self, "startState");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = objc_opt_new();
  }
  v8 = (void *)v7;
  v15[1] = v7;
  v14[2] = CFSTR("endState");
  -[ICASEditorCallOutData endState](self, "endState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[ICASEditorCallOutData endState](self, "endState");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = objc_opt_new();
  }
  v11 = (void *)v10;
  v15[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (ICASCollabActivityContextPath)collabActivityContextPath
{
  return self->_collabActivityContextPath;
}

- (ICASStartState)startState
{
  return self->_startState;
}

- (ICASEndState)endState
{
  return self->_endState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endState, 0);
  objc_storeStrong((id *)&self->_startState, 0);
  objc_storeStrong((id *)&self->_collabActivityContextPath, 0);
}

@end
