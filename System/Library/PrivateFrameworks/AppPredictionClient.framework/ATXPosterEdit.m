@implementation ATXPosterEdit

- (ATXPosterEdit)initWithLockscreenId:(id)a3 entryPoint:(id)a4 newlyCreated:(BOOL)a5 secondsSinceLastEdit:(int64_t)a6
{
  uint64_t v7;

  BYTE4(v7) = 0;
  LODWORD(v7) = 0;
  return -[ATXPosterEdit initWithLockscreenId:entryPoint:newlyCreated:secondsSinceLastEdit:outcome:userChangedColor:userChangedFont:userChangedNumberingSystem:userChangedPosterContent:userChangedWidgets:didLockscreenHaveWidgetsBeforeEdit:duration:](self, "initWithLockscreenId:entryPoint:newlyCreated:secondsSinceLastEdit:outcome:userChangedColor:userChangedFont:userChangedNumberingSystem:userChangedPosterContent:userChangedWidgets:didLockscreenHaveWidgetsBeforeEdit:duration:", a3, a4, a5, a6, CFSTR("unknown"), 0, v7, -1);
}

- (ATXPosterEdit)initWithLockscreenId:(id)a3 entryPoint:(id)a4 newlyCreated:(BOOL)a5 secondsSinceLastEdit:(int64_t)a6 outcome:(id)a7 userChangedColor:(BOOL)a8 userChangedFont:(BOOL)a9 userChangedNumberingSystem:(BOOL)a10 userChangedPosterContent:(BOOL)a11 userChangedWidgets:(BOOL)a12 didLockscreenHaveWidgetsBeforeEdit:(BOOL)a13 duration:(unint64_t)a14
{
  id v20;
  id v21;
  id v22;
  ATXPosterEdit *v23;
  uint64_t v24;
  NSString *lockscreenId;
  uint64_t v26;
  NSString *entryPoint;
  uint64_t v28;
  NSString *outcome;
  objc_super v31;

  v20 = a3;
  v21 = a4;
  v22 = a7;
  v31.receiver = self;
  v31.super_class = (Class)ATXPosterEdit;
  v23 = -[ATXPosterEdit init](&v31, sel_init);
  if (v23)
  {
    v24 = objc_msgSend(v20, "copy");
    lockscreenId = v23->_lockscreenId;
    v23->_lockscreenId = (NSString *)v24;

    v26 = objc_msgSend(v21, "copy");
    entryPoint = v23->_entryPoint;
    v23->_entryPoint = (NSString *)v26;

    v23->_newlyCreated = a5;
    v23->_secondsSinceLastEdit = a6;
    v28 = objc_msgSend(v22, "copy");
    outcome = v23->_outcome;
    v23->_outcome = (NSString *)v28;

    v23->_userChangedColor = a8;
    v23->_userChangedFont = a9;
    v23->_userChangedNumberingSystem = a10;
    v23->_userChangedPosterContent = a11;
    v23->_userChangedWidgets = a12;
    v23->_didLockscreenHaveWidgetsBeforeEdit = a13;
    v23->_duration = a14;
  }

  return v23;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXPosterEdit)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  char v7;
  char v8;
  char v9;
  char v10;
  char v11;
  uint64_t v12;
  ATXPosterEdit *v13;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  void *v18;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lockscreenId"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("entryPoint"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("newlyCreated"));
  v16 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("secondsSinceLastEdit"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("outcome"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("userChangedColor"));
  v7 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("userChangedFont"));
  v8 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("userChangedNumberingSystem"));
  v9 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("userChangedPosterContent"));
  v10 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("userChangedWidgets"));
  v11 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("didLockscreenHaveWidgetsBeforeEdit"));
  v12 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("duration"));

  BYTE4(v15) = v11;
  BYTE3(v15) = v10;
  BYTE2(v15) = v9;
  BYTE1(v15) = v8;
  LOBYTE(v15) = v7;
  v13 = -[ATXPosterEdit initWithLockscreenId:entryPoint:newlyCreated:secondsSinceLastEdit:outcome:userChangedColor:userChangedFont:userChangedNumberingSystem:userChangedPosterContent:userChangedWidgets:didLockscreenHaveWidgetsBeforeEdit:duration:](self, "initWithLockscreenId:entryPoint:newlyCreated:secondsSinceLastEdit:outcome:userChangedColor:userChangedFont:userChangedNumberingSystem:userChangedPosterContent:userChangedWidgets:didLockscreenHaveWidgetsBeforeEdit:duration:", v18, v4, v17, v16, v5, v6, v15, v12);

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[ATXPosterEdit lockscreenId](self, "lockscreenId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("lockscreenId"));

  -[ATXPosterEdit entryPoint](self, "entryPoint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("entryPoint"));

  objc_msgSend(v7, "encodeBool:forKey:", -[ATXPosterEdit isNewlyCreated](self, "isNewlyCreated"), CFSTR("newlyCreated"));
  objc_msgSend(v7, "encodeInteger:forKey:", -[ATXPosterEdit secondsSinceLastEdit](self, "secondsSinceLastEdit"), CFSTR("secondsSinceLastEdit"));
  -[ATXPosterEdit outcome](self, "outcome");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("outcome"));

  objc_msgSend(v7, "encodeBool:forKey:", -[ATXPosterEdit userChangedColor](self, "userChangedColor"), CFSTR("userChangedColor"));
  objc_msgSend(v7, "encodeBool:forKey:", -[ATXPosterEdit userChangedFont](self, "userChangedFont"), CFSTR("userChangedFont"));
  objc_msgSend(v7, "encodeBool:forKey:", -[ATXPosterEdit userChangedNumberingSystem](self, "userChangedNumberingSystem"), CFSTR("userChangedNumberingSystem"));
  objc_msgSend(v7, "encodeBool:forKey:", -[ATXPosterEdit userChangedPosterContent](self, "userChangedPosterContent"), CFSTR("userChangedPosterContent"));
  objc_msgSend(v7, "encodeBool:forKey:", -[ATXPosterEdit userChangedWidgets](self, "userChangedWidgets"), CFSTR("userChangedWidgets"));
  objc_msgSend(v7, "encodeBool:forKey:", -[ATXPosterEdit didLockscreenHaveWidgetsBeforeEdit](self, "didLockscreenHaveWidgetsBeforeEdit"), CFSTR("didLockscreenHaveWidgetsBeforeEdit"));
  objc_msgSend(v7, "encodeInteger:forKey:", -[ATXPosterEdit duration](self, "duration"), CFSTR("duration"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  ATXPosterEdit *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BOOL v8;
  BOOL v9;
  BOOL v10;
  BOOL v11;
  ATXPosterEdit *v12;
  uint64_t v14;
  uint64_t v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;

  v3 = self;
  -[ATXPosterEdit lockscreenId](v3, "lockscreenId");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v19, "copy");
  -[ATXPosterEdit entryPoint](v3, "entryPoint");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v18, "copy");
  v16 = -[ATXPosterEdit isNewlyCreated](v3, "isNewlyCreated");
  v15 = -[ATXPosterEdit secondsSinceLastEdit](v3, "secondsSinceLastEdit");
  -[ATXPosterEdit outcome](v3, "outcome");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  v7 = -[ATXPosterEdit userChangedColor](v3, "userChangedColor");
  v8 = -[ATXPosterEdit userChangedFont](v3, "userChangedFont");
  v9 = -[ATXPosterEdit userChangedNumberingSystem](v3, "userChangedNumberingSystem");
  v10 = -[ATXPosterEdit userChangedPosterContent](v3, "userChangedPosterContent");
  v11 = -[ATXPosterEdit userChangedWidgets](v3, "userChangedWidgets");
  BYTE4(v14) = -[ATXPosterEdit didLockscreenHaveWidgetsBeforeEdit](v3, "didLockscreenHaveWidgetsBeforeEdit");
  BYTE3(v14) = v11;
  BYTE2(v14) = v10;
  BYTE1(v14) = v9;
  LOBYTE(v14) = v8;
  v12 = -[ATXPosterEdit initWithLockscreenId:entryPoint:newlyCreated:secondsSinceLastEdit:outcome:userChangedColor:userChangedFont:userChangedNumberingSystem:userChangedPosterContent:userChangedWidgets:didLockscreenHaveWidgetsBeforeEdit:duration:](v3, "initWithLockscreenId:entryPoint:newlyCreated:secondsSinceLastEdit:outcome:userChangedColor:userChangedFont:userChangedNumberingSystem:userChangedPosterContent:userChangedWidgets:didLockscreenHaveWidgetsBeforeEdit:duration:", v17, v4, v16, v15, v6, v7, v14, -[ATXPosterEdit duration](v3, "duration"));

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  ATXPosterEdit *v4;
  ATXPosterEdit *v5;
  BOOL v6;

  v4 = (ATXPosterEdit *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXPosterEdit isEqualToATXPosterEdit:](self, "isEqualToATXPosterEdit:", v5);

  return v6;
}

- (BOOL)isEqualToATXPosterEdit:(id)a3
{
  id *v4;
  NSString *lockscreenId;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  char v9;
  NSString *entryPoint;
  NSString *v11;
  NSString *v12;
  NSString *v13;
  char v14;
  int newlyCreated;
  int64_t secondsSinceLastEdit;
  NSString *outcome;
  NSString *v18;
  NSString *v19;
  NSString *v20;
  char v21;
  int userChangedColor;
  int userChangedFont;
  int userChangedNumberingSystem;
  int userChangedPosterContent;
  int userChangedWidgets;
  int didLockscreenHaveWidgetsBeforeEdit;
  int64_t duration;
  BOOL v29;

  v4 = (id *)a3;
  lockscreenId = self->_lockscreenId;
  v6 = (NSString *)v4[2];
  if (lockscreenId == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = lockscreenId;
    v9 = -[NSString isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
    {
LABEL_22:
      v29 = 0;
      goto LABEL_23;
    }
  }
  entryPoint = self->_entryPoint;
  v11 = (NSString *)v4[3];
  if (entryPoint == v11)
  {

  }
  else
  {
    v12 = v11;
    v13 = entryPoint;
    v14 = -[NSString isEqual:](v13, "isEqual:", v12);

    if ((v14 & 1) == 0)
      goto LABEL_22;
  }
  newlyCreated = self->_newlyCreated;
  if (newlyCreated != objc_msgSend(v4, "isNewlyCreated"))
    goto LABEL_22;
  secondsSinceLastEdit = self->_secondsSinceLastEdit;
  if (secondsSinceLastEdit != objc_msgSend(v4, "secondsSinceLastEdit"))
    goto LABEL_22;
  outcome = self->_outcome;
  v18 = (NSString *)v4[5];
  if (outcome == v18)
  {

  }
  else
  {
    v19 = v18;
    v20 = outcome;
    v21 = -[NSString isEqual:](v20, "isEqual:", v19);

    if ((v21 & 1) == 0)
      goto LABEL_22;
  }
  userChangedColor = self->_userChangedColor;
  if (userChangedColor != objc_msgSend(v4, "userChangedColor"))
    goto LABEL_22;
  userChangedFont = self->_userChangedFont;
  if (userChangedFont != objc_msgSend(v4, "userChangedFont"))
    goto LABEL_22;
  userChangedNumberingSystem = self->_userChangedNumberingSystem;
  if (userChangedNumberingSystem != objc_msgSend(v4, "userChangedNumberingSystem"))
    goto LABEL_22;
  userChangedPosterContent = self->_userChangedPosterContent;
  if (userChangedPosterContent != objc_msgSend(v4, "userChangedPosterContent"))
    goto LABEL_22;
  userChangedWidgets = self->_userChangedWidgets;
  if (userChangedWidgets != objc_msgSend(v4, "userChangedWidgets"))
    goto LABEL_22;
  didLockscreenHaveWidgetsBeforeEdit = self->_didLockscreenHaveWidgetsBeforeEdit;
  if (didLockscreenHaveWidgetsBeforeEdit != objc_msgSend(v4, "didLockscreenHaveWidgetsBeforeEdit"))
    goto LABEL_22;
  duration = self->_duration;
  v29 = duration == objc_msgSend(v4, "duration");
LABEL_23:

  return v29;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  -[ATXPosterEdit lockscreenId](self, "lockscreenId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[ATXPosterEdit entryPoint](self, "entryPoint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") - v4 + 32 * v4;

  v7 = 31 * v6 + -[ATXPosterEdit isNewlyCreated](self, "isNewlyCreated");
  v8 = -[ATXPosterEdit secondsSinceLastEdit](self, "secondsSinceLastEdit") - v7 + 32 * v7;
  -[ATXPosterEdit outcome](self, "outcome");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash") - v8 + 32 * v8;

  v11 = 31 * (31 * v10 + -[ATXPosterEdit userChangedColor](self, "userChangedColor"));
  v12 = 31 * (v11 + -[ATXPosterEdit userChangedFont](self, "userChangedFont"));
  v13 = 31 * (v12 + -[ATXPosterEdit userChangedNumberingSystem](self, "userChangedNumberingSystem"));
  v14 = 31 * (v13 + -[ATXPosterEdit userChangedPosterContent](self, "userChangedPosterContent"));
  v15 = 31 * (v14 + -[ATXPosterEdit userChangedWidgets](self, "userChangedWidgets"));
  v16 = v15 + -[ATXPosterEdit didLockscreenHaveWidgetsBeforeEdit](self, "didLockscreenHaveWidgetsBeforeEdit");
  return -[ATXPosterEdit duration](self, "duration") - v16 + 32 * v16;
}

- (NSString)lockscreenId
{
  return self->_lockscreenId;
}

- (NSString)entryPoint
{
  return self->_entryPoint;
}

- (BOOL)isNewlyCreated
{
  return self->_newlyCreated;
}

- (int64_t)secondsSinceLastEdit
{
  return self->_secondsSinceLastEdit;
}

- (NSString)outcome
{
  return self->_outcome;
}

- (int64_t)duration
{
  return self->_duration;
}

- (BOOL)userChangedColor
{
  return self->_userChangedColor;
}

- (BOOL)userChangedFont
{
  return self->_userChangedFont;
}

- (BOOL)userChangedNumberingSystem
{
  return self->_userChangedNumberingSystem;
}

- (BOOL)userChangedPosterContent
{
  return self->_userChangedPosterContent;
}

- (BOOL)userChangedWidgets
{
  return self->_userChangedWidgets;
}

- (BOOL)didLockscreenHaveWidgetsBeforeEdit
{
  return self->_didLockscreenHaveWidgetsBeforeEdit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outcome, 0);
  objc_storeStrong((id *)&self->_entryPoint, 0);
  objc_storeStrong((id *)&self->_lockscreenId, 0);
}

@end
