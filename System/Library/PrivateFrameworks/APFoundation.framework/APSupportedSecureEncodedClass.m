@implementation APSupportedSecureEncodedClass

+ (void)initialize
{
  APUnfairLock *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;

  v2 = [APUnfairLock alloc];
  v5 = objc_msgSend_initWithOptions_(v2, v3, 1, v4);
  v6 = (void *)qword_1ED2BC958;
  qword_1ED2BC958 = v5;

  v7 = objc_alloc(MEMORY[0x1E0C99E60]);
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  v19 = objc_msgSend_initWithObjects_(v7, v17, v8, v18, v9, v10, v11, v12, v13, v14, v15, v16, 0);
  v20 = (void *)qword_1ED2BC988;
  qword_1ED2BC988 = v19;

}

+ (NSSet)classes
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend_lock((void *)qword_1ED2BC958, a2, v2, v3);
  v4 = (id)qword_1ED2BC988;
  objc_msgSend_unlock((void *)qword_1ED2BC958, v5, v6, v7);
  return (NSSet *)v4;
}

+ (void)addClasses:(id)a3
{
  void *v3;
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;

  v3 = (void *)qword_1ED2BC958;
  v4 = a3;
  objc_msgSend_lock(v3, v5, v6, v7);
  objc_msgSend_setByAddingObjectsFromSet_((void *)qword_1ED2BC988, v8, (uint64_t)v4, v9);
  v10 = objc_claimAutoreleasedReturnValue();

  v11 = (void *)qword_1ED2BC988;
  qword_1ED2BC988 = v10;

  objc_msgSend_unlock((void *)qword_1ED2BC958, v12, v13, v14);
}

@end
