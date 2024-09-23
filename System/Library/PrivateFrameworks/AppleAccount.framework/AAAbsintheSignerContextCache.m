@implementation AAAbsintheSignerContextCache

+ (id)cacheWithContext:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithContext:", v4);

  return v5;
}

- (AAAbsintheSignerContextCache)init
{
  -[AAAbsintheSignerContextCache doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (AAAbsintheSignerContextCache)initWithContext:(id)a3
{
  id v5;
  AAAbsintheSignerContextCache *v6;
  uint64_t v7;
  NSDate *creationDate;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AAAbsintheSignerContextCache;
  v6 = -[AAAbsintheSignerContextCache init](&v10, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = objc_claimAutoreleasedReturnValue();
    creationDate = v6->_creationDate;
    v6->_creationDate = (NSDate *)v7;

    objc_storeStrong((id *)&v6->_context, a3);
  }

  return v6;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (AAAbsintheContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
}

@end
