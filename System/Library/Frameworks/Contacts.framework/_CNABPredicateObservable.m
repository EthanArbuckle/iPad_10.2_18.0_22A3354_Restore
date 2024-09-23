@implementation _CNABPredicateObservable

+ (id)observableWithPredicates:(int)a3 sortOrdering:(uint64_t)a4 options:(uint64_t)a5 addressBook:(void *)a6 environment:
{
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;

  v10 = a6;
  v11 = a2;
  v12 = objc_opt_self();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __98___CNABPredicateObservable_observableWithPredicates_sortOrdering_options_addressBook_environment___block_invoke;
  v19[3] = &unk_1E29FD638;
  v24 = a3;
  v22 = a4;
  v23 = a5;
  v20 = v10;
  v21 = v12;
  v13 = v10;
  objc_msgSend(v11, "_cn_map:", v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0D13AE8];
  objc_msgSend(v13, "schedulerProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "merge:schedulerProvider:", v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)initWithPredicate:(int)a3 sortOrdering:(void *)a4 options:(const void *)a5 addressBook:(void *)a6 environment:
{
  id v12;
  id v13;
  CFTypeRef v14;
  id v15;
  id v16;
  objc_super v18;

  v12 = a2;
  v13 = a6;
  if (a1)
  {
    v18.receiver = a1;
    v18.super_class = (Class)_CNABPredicateObservable;
    a1 = (id *)objc_msgSendSuper2(&v18, sel_init);
    if (a1)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_storeStrong(a1 + 4, a2);
      *((_DWORD *)a1 + 6) = a3;
      if (a5)
        v14 = CFRetain(a5);
      else
        v14 = 0;
      a1[2] = (id)v14;
      v15 = objc_alloc_init(MEMORY[0x1E0D139B8]);
      v16 = a1[7];
      a1[7] = v15;

      a1[5] = a4;
      objc_storeStrong(a1 + 6, a6);
    }
  }

  return a1;
}

- (void)dealloc
{
  void *addressBook;
  objc_super v4;

  addressBook = self->_addressBook;
  if (addressBook)
    CFRelease(addressBook);
  v4.receiver = self;
  v4.super_class = (Class)_CNABPredicateObservable;
  -[_CNABPredicateObservable dealloc](&v4, sel_dealloc);
}

- (id)subscribe:(id)a3
{
  id v4;
  ABPredicate *predicate;
  CNContactsEnvironment *environment;
  void *v7;
  CNContactsEnvironment *v8;
  CNContactsEnvironment *v9;
  void *v10;
  ABPredicate *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  CNCancelationToken *cancelationToken;
  CNCancelationToken *v17;
  CNCancelationToken *v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *);
  void *v23;
  id v24;
  _CNABPredicateObservable *v25;

  v4 = a3;
  if (self)
    predicate = self->_predicate;
  else
    predicate = 0;
  if (predicate)
  {
    -[_CNABPredicateObservable setObserver:]((uint64_t)self, v4);
    if (self)
      environment = self->_environment;
    else
      environment = 0;
    -[CNContactsEnvironment schedulerProvider](environment, "schedulerProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      v8 = self->_environment;
    else
      v8 = 0;
    v9 = v8;
    -[CNContactsEnvironment abPredicateRunner](v9, "abPredicateRunner");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (self)
      v11 = self->_predicate;
    else
      v11 = 0;
    -[ABPredicate querySerializationIdentifier](v11, "querySerializationIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[_CNABPredicateObservable schedulerForIdentifier:provider:]((uint64_t)_CNABPredicateObservable, v12, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __38___CNABPredicateObservable_subscribe___block_invoke;
    v23 = &unk_1E29FD660;
    v24 = v10;
    v25 = self;
    v14 = v10;
    objc_msgSend(v13, "performCancelableBlock:", &v20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      cancelationToken = self->_cancelationToken;
    else
      cancelationToken = 0;
    -[CNCancelationToken addCancelable:](cancelationToken, "addCancelable:", v15, v20, v21, v22, v23);

  }
  else
  {
    +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 400, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "observerDidFailWithError:", v7);
  }

  if (self)
    v17 = self->_cancelationToken;
  else
    v17 = 0;
  v18 = v17;

  return v18;
}

- (void)setObserver:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 64), a2);
}

+ (id)schedulerForIdentifier:(void *)a3 provider:
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t v13;

  v4 = a2;
  v5 = a3;
  v6 = objc_opt_self();
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13848] + 16))())
  {
    objc_msgSend(v5, "backgroundSchedulerWithQualityOfService:", 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (schedulerForIdentifier_provider__cn_once_token_0 != -1)
      dispatch_once(&schedulerForIdentifier_provider__cn_once_token_0, &__block_literal_global_114);
    v8 = (void *)schedulerForIdentifier_provider__cn_once_object_0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __60___CNABPredicateObservable_schedulerForIdentifier_provider___block_invoke_2;
    v11[3] = &unk_1E29FD688;
    v13 = v6;
    v12 = v5;
    v9 = v8;
    objc_msgSend(v9, "objectForKey:onCacheMiss:", v4, v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

+ (id)makeSerialFetchSchedulerUsingSchedulerProvider:(uint64_t)a1
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  objc_opt_self();
  v3 = (void *)objc_msgSend(v2, "newSerialSchedulerWithName:", CFSTR("com.apple.contacts.seralized.predicate"));

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D13B38]), "initWithScheduler:qualityOfService:", v3, 4);
  return v4;
}

- (BOOL)predicateShouldContinue:(id)a3
{
  if (self)
    self = (_CNABPredicateObservable *)self->_cancelationToken;
  return -[_CNABPredicateObservable isCanceled](self, "isCanceled", a3) ^ 1;
}

- (BOOL)predicateShouldContinue:(id)a3 afterFindingRecord:(void *)a4
{
  return -[_CNABPredicateObservable predicateShouldContinue:afterFindingRecord:metadata:](self, "predicateShouldContinue:afterFindingRecord:metadata:", a3, a4, 0);
}

- (BOOL)predicateShouldContinue:(id)a3 afterFindingRecord:(void *)a4 metadata:(id)a5
{
  id v8;
  id v9;
  CNCancelationToken *v10;
  CNCancelationToken *cancelationToken;
  id v12;
  void *v13;
  void *v14;
  char v15;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (a4)
  {
    v10 = self ? self->_cancelationToken : 0;
    if ((-[CNCancelationToken isCanceled](v10, "isCanceled") & 1) == 0)
    {
      if (v9)
      {
        v12 = v9;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v12 = (id)objc_claimAutoreleasedReturnValue();
      }
      v13 = v12;
      v17[0] = a4;
      v17[1] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNObserver observerDidReceiveResult:](self->_observer, "observerDidReceiveResult:", v14);

      goto LABEL_11;
    }
  }
  if (self)
  {
LABEL_11:
    cancelationToken = self->_cancelationToken;
    goto LABEL_12;
  }
  cancelationToken = 0;
LABEL_12:
  v15 = -[CNCancelationToken isCanceled](cancelationToken, "isCanceled");

  return v15 ^ 1;
}

- (BOOL)predicateShouldContinue:(id)a3 afterFindingRecord:(void *)a4 moreComing:(BOOL)a5
{
  CNCancelationToken *cancelationToken;

  if (!-[_CNABPredicateObservable predicateShouldContinue:afterFindingRecord:](self, "predicateShouldContinue:afterFindingRecord:", a3, a4)|| a5)
  {
    if (!self)
    {
      cancelationToken = 0;
      return -[CNCancelationToken isCanceled](cancelationToken, "isCanceled") ^ 1;
    }
  }
  else
  {
    -[CNObserver observerDidComplete](self->_observer, "observerDidComplete");
  }
  cancelationToken = self->_cancelationToken;
  return -[CNCancelationToken isCanceled](cancelationToken, "isCanceled") ^ 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observer, 0);
  objc_storeStrong((id *)&self->_cancelationToken, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
}

@end
