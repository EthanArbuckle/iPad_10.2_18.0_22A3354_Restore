@implementation INIntentExecutionResult

- (INIntentExecutionResult)initWithIntent:(id)a3 response:(id)a4
{
  id v7;
  id v8;
  INIntentExecutionResult *v9;
  INIntentExecutionResult *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)INIntentExecutionResult;
  v9 = -[INIntentExecutionResult init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_intent, a3);
    objc_storeStrong((id *)&v10->_intentResponse, a4);
  }

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[INIntent hash](self->_intent, "hash");
  return -[INIntentResponse hash](self->_intentResponse, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  INIntent *intent;
  INIntentResponse *intentResponse;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    intent = self->_intent;
    v8 = 0;
    if (intent == (INIntent *)v5[1] || -[INIntent isEqual:](intent, "isEqual:"))
    {
      intentResponse = self->_intentResponse;
      if (intentResponse == (INIntentResponse *)v5[2]
        || -[INIntentResponse isEqual:](intentResponse, "isEqual:"))
      {
        v8 = 1;
      }
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (INIntentExecutionResult)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  INIntentExecutionResult *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("intent"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("intentResponse"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (INIntentExecutionResult *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithIntent:response:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  INIntent *intent;
  id v5;

  intent = self->_intent;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", intent, CFSTR("intent"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_intentResponse, CFSTR("intentResponse"));

}

- (id)description
{
  return -[INIntentExecutionResult descriptionAtIndent:](self, "descriptionAtIndent:", 0);
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)INIntentExecutionResult;
  -[INIntentExecutionResult description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentExecutionResult _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  INIntent *intent;
  void *v4;
  INIntentResponse *intentResponse;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("intent");
  intent = self->_intent;
  v4 = intent;
  if (!intent)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9[1] = CFSTR("intentResponse");
  v10[0] = v4;
  intentResponse = self->_intentResponse;
  v6 = intentResponse;
  if (!intentResponse)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!intentResponse)
  {

    if (intent)
      return v7;
LABEL_9:

    return v7;
  }
  if (!intent)
    goto LABEL_9;
  return v7;
}

- (INIntent)intent
{
  return self->_intent;
}

- (INIntentResponse)intentResponse
{
  return self->_intentResponse;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentResponse, 0);
  objc_storeStrong((id *)&self->_intent, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
