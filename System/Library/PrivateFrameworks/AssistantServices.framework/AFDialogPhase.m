@implementation AFDialogPhase

- (id)_initWithType:(int64_t)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AFDialogPhase;
  result = -[AFDialogPhase init](&v5, sel_init);
  if (result)
    *((_QWORD *)result + 1) = a3;
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[AFDialogPhase _type](self, "_type"), CFSTR("AFDialogPhaseType"));

}

- (AFDialogPhase)initWithCoder:(id)a3
{
  id v4;
  AFDialogPhase *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)AFDialogPhase;
  v5 = -[AFDialogPhase init](&v7, sel_init);
  if (v5)
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("AFDialogPhaseType"));

  return v5;
}

- (BOOL)isEqualToDialogPhase:(id)a3
{
  id v4;
  int64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = -[AFDialogPhase _type](self, "_type");
  v6 = objc_msgSend(v4, "_type");

  return v5 == v6;
}

- (NSString)aceDialogPhaseValue
{
  int64_t v3;
  id v4;
  id *v5;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v3 = -[AFDialogPhase _type](self, "_type") - 1;
  v4 = 0;
  v5 = (id *)MEMORY[0x1E0D89208];
  switch(v3)
  {
    case 0:
      goto LABEL_11;
    case 1:
      v5 = (id *)MEMORY[0x1E0D89240];
      goto LABEL_11;
    case 2:
      v5 = (id *)MEMORY[0x1E0D89248];
      goto LABEL_11;
    case 3:
      v5 = (id *)MEMORY[0x1E0D89218];
      goto LABEL_11;
    case 4:
      v5 = (id *)MEMORY[0x1E0D89250];
      goto LABEL_11;
    case 5:
      v5 = (id *)MEMORY[0x1E0D89228];
      goto LABEL_11;
    case 6:
      v5 = (id *)MEMORY[0x1E0D89220];
      goto LABEL_11;
    case 7:
      v5 = (id *)MEMORY[0x1E0D89238];
      goto LABEL_11;
    case 8:
      v5 = (id *)MEMORY[0x1E0D89230];
      goto LABEL_11;
    case 9:
      v5 = (id *)MEMORY[0x1E0D89210];
LABEL_11:
      v4 = *v5;
      break;
    case 10:
      return (NSString *)v4;
    default:
      v7 = (void *)MEMORY[0x1E0C99DA0];
      v8 = *MEMORY[0x1E0C99768];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected value for _type: %ld"), -[AFDialogPhase _type](self, "_type"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
      v10 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v10);
  }
  return (NSString *)v4;
}

- (BOOL)replacesPreviousSnippetContents
{
  unint64_t v2;

  v2 = -[AFDialogPhase _type](self, "_type");
  return (v2 < 8) & (0xB0u >> v2);
}

- (BOOL)isTemporary
{
  unint64_t v2;

  v2 = -[AFDialogPhase _type](self, "_type");
  return (v2 < 9) & (0x14Eu >> v2);
}

- (BOOL)isExpository
{
  return (unint64_t)(-[AFDialogPhase _type](self, "_type") - 1) < 3;
}

- (BOOL)isConfirmationDialogPhase
{
  return -[AFDialogPhase _type](self, "_type") == 6;
}

- (BOOL)isReflectionDialogPhase
{
  return -[AFDialogPhase _type](self, "_type") == 2;
}

- (BOOL)isClarificationDialogPhase
{
  return -[AFDialogPhase _type](self, "_type") == 4;
}

- (BOOL)isConfirmedDialogPhase
{
  return -[AFDialogPhase _type](self, "_type") == 9;
}

- (BOOL)isCancelledDialogPhase
{
  return -[AFDialogPhase _type](self, "_type") == 10;
}

- (BOOL)isUserRequestDialogPhase
{
  return -[AFDialogPhase _type](self, "_type") == 11;
}

- (BOOL)isErrorDialogPhase
{
  return -[AFDialogPhase _type](self, "_type") == 8;
}

- (BOOL)isCompletionDialogPhase
{
  return -[AFDialogPhase _type](self, "_type") == 7;
}

- (BOOL)isSummaryDialogPhase
{
  return -[AFDialogPhase _type](self, "_type") == 5;
}

- (BOOL)isAcknowledgementDialogPhase
{
  return -[AFDialogPhase _type](self, "_type") == 1;
}

- (BOOL)isPossiblyPartOfMultiTurnRequest
{
  unint64_t v2;

  v2 = -[AFDialogPhase _type](self, "_type");
  return (v2 < 0xC) & (0x850u >> v2);
}

- (int)UEIUUFRReadyDialogPhase
{
  int64_t v2;

  v2 = -[AFDialogPhase _type](self, "_type");
  if ((unint64_t)(v2 - 1) >= 0xB)
    LODWORD(v2) = 0;
  return v2;
}

- (id)description
{
  void *v3;
  BOOL v4;
  const __CFString *v5;
  void *v6;
  BOOL v7;
  void *v8;
  BOOL v9;
  void *v10;
  BOOL v11;
  void *v12;
  BOOL v13;
  void *v14;
  BOOL v15;
  void *v16;
  BOOL v17;
  void *v18;
  BOOL v19;
  void *v20;
  BOOL v21;
  void *v22;
  BOOL v23;
  void *v24;
  _BOOL4 v25;

  +[AFDialogPhase acknowledgementDialogPhase](AFDialogPhase, "acknowledgementDialogPhase");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[AFDialogPhase isEqualToDialogPhase:](self, "isEqualToDialogPhase:", v3);

  if (v4)
  {
    v5 = CFSTR("acknowledgementDialogPhase");
  }
  else
  {
    +[AFDialogPhase reflectionDialogPhase](AFDialogPhase, "reflectionDialogPhase");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[AFDialogPhase isEqualToDialogPhase:](self, "isEqualToDialogPhase:", v6);

    if (v7)
    {
      v5 = CFSTR("reflectionDialogPhase");
    }
    else
    {
      +[AFDialogPhase statusDialogPhase](AFDialogPhase, "statusDialogPhase");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[AFDialogPhase isEqualToDialogPhase:](self, "isEqualToDialogPhase:", v8);

      if (v9)
      {
        v5 = CFSTR("statusDialogPhase");
      }
      else
      {
        +[AFDialogPhase clarificationDialogPhase](AFDialogPhase, "clarificationDialogPhase");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = -[AFDialogPhase isEqualToDialogPhase:](self, "isEqualToDialogPhase:", v10);

        if (v11)
        {
          v5 = CFSTR("clarificationDialogPhase");
        }
        else
        {
          +[AFDialogPhase summaryDialogPhase](AFDialogPhase, "summaryDialogPhase");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = -[AFDialogPhase isEqualToDialogPhase:](self, "isEqualToDialogPhase:", v12);

          if (v13)
          {
            v5 = CFSTR("summaryDialogPhase");
          }
          else
          {
            +[AFDialogPhase confirmationDialogPhase](AFDialogPhase, "confirmationDialogPhase");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = -[AFDialogPhase isEqualToDialogPhase:](self, "isEqualToDialogPhase:", v14);

            if (v15)
            {
              v5 = CFSTR("confirmationDialogPhase");
            }
            else
            {
              +[AFDialogPhase completionDialogPhase](AFDialogPhase, "completionDialogPhase");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = -[AFDialogPhase isEqualToDialogPhase:](self, "isEqualToDialogPhase:", v16);

              if (v17)
              {
                v5 = CFSTR("completionDialogPhase");
              }
              else
              {
                +[AFDialogPhase errorDialogPhase](AFDialogPhase, "errorDialogPhase");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                v19 = -[AFDialogPhase isEqualToDialogPhase:](self, "isEqualToDialogPhase:", v18);

                if (v19)
                {
                  v5 = CFSTR("errorDialogPhase");
                }
                else
                {
                  +[AFDialogPhase confirmedDialogPhase](AFDialogPhase, "confirmedDialogPhase");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  v21 = -[AFDialogPhase isEqualToDialogPhase:](self, "isEqualToDialogPhase:", v20);

                  if (v21)
                  {
                    v5 = CFSTR("confirmedDialogPhase");
                  }
                  else
                  {
                    +[AFDialogPhase cancelledDialogPhase](AFDialogPhase, "cancelledDialogPhase");
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    v23 = -[AFDialogPhase isEqualToDialogPhase:](self, "isEqualToDialogPhase:", v22);

                    if (v23)
                    {
                      v5 = CFSTR("cancelledDialogPhase");
                    }
                    else
                    {
                      +[AFDialogPhase userRequestDialogPhase](AFDialogPhase, "userRequestDialogPhase");
                      v24 = (void *)objc_claimAutoreleasedReturnValue();
                      v25 = -[AFDialogPhase isEqualToDialogPhase:](self, "isEqualToDialogPhase:", v24);

                      if (v25)
                        v5 = CFSTR("userRequestDialogPhase");
                      else
                        v5 = CFSTR("unknown dialogPhase");
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %@>"), objc_opt_class(), v5);
}

- (BOOL)isEqual:(id)a3
{
  AFDialogPhase *v4;
  BOOL v5;

  v4 = (AFDialogPhase *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[AFDialogPhase isEqualToDialogPhase:](self, "isEqualToDialogPhase:", v4);
  }

  return v5;
}

- (int64_t)_type
{
  return self->_type;
}

+ (id)dialogPhaseForAceDialogPhase:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D89208]))
  {
    +[AFDialogPhase acknowledgementDialogPhase](AFDialogPhase, "acknowledgementDialogPhase");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D89240]))
  {
    +[AFDialogPhase reflectionDialogPhase](AFDialogPhase, "reflectionDialogPhase");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D89248]))
  {
    +[AFDialogPhase statusDialogPhase](AFDialogPhase, "statusDialogPhase");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D89218]))
  {
    +[AFDialogPhase clarificationDialogPhase](AFDialogPhase, "clarificationDialogPhase");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D89250]))
  {
    +[AFDialogPhase summaryDialogPhase](AFDialogPhase, "summaryDialogPhase");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D89228]))
  {
    +[AFDialogPhase confirmationDialogPhase](AFDialogPhase, "confirmationDialogPhase");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D89220]))
  {
    +[AFDialogPhase completionDialogPhase](AFDialogPhase, "completionDialogPhase");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D89238]))
  {
    +[AFDialogPhase errorDialogPhase](AFDialogPhase, "errorDialogPhase");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D89230]))
  {
    +[AFDialogPhase confirmedDialogPhase](AFDialogPhase, "confirmedDialogPhase");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D89210]))
    {
      v5 = 0;
      goto LABEL_22;
    }
    +[AFDialogPhase cancelledDialogPhase](AFDialogPhase, "cancelledDialogPhase");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;
LABEL_22:

  return v5;
}

+ (id)acknowledgementDialogPhase
{
  return (id)objc_msgSend(a1, "_dialogPhaseWithType:", 1);
}

+ (id)reflectionDialogPhase
{
  return (id)objc_msgSend(a1, "_dialogPhaseWithType:", 2);
}

+ (id)statusDialogPhase
{
  return (id)objc_msgSend(a1, "_dialogPhaseWithType:", 3);
}

+ (id)clarificationDialogPhase
{
  return (id)objc_msgSend(a1, "_dialogPhaseWithType:", 4);
}

+ (id)summaryDialogPhase
{
  return (id)objc_msgSend(a1, "_dialogPhaseWithType:", 5);
}

+ (id)confirmationDialogPhase
{
  return (id)objc_msgSend(a1, "_dialogPhaseWithType:", 6);
}

+ (id)completionDialogPhase
{
  return (id)objc_msgSend(a1, "_dialogPhaseWithType:", 7);
}

+ (id)errorDialogPhase
{
  return (id)objc_msgSend(a1, "_dialogPhaseWithType:", 8);
}

+ (id)confirmedDialogPhase
{
  return (id)objc_msgSend(a1, "_dialogPhaseWithType:", 9);
}

+ (id)cancelledDialogPhase
{
  return (id)objc_msgSend(a1, "_dialogPhaseWithType:", 10);
}

+ (id)userRequestDialogPhase
{
  return (id)objc_msgSend(a1, "_dialogPhaseWithType:", 11);
}

+ (id)_dialogPhaseWithType:(int64_t)a3
{
  return -[AFDialogPhase _initWithType:]([AFDialogPhase alloc], "_initWithType:", a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
