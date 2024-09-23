@implementation AMSBagCache

- (id)bagWithIdentifier:(id)a3 accountProviderIdentity:(id)a4 accountMediaType:(id)a5 orCreateUsingBlock:(id)a6
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  AMSBagCache *v16;
  id v17;

  v8 = _Block_copy(a6);
  v9 = sub_18CEC181C();
  v11 = v10;
  v12 = sub_18CEC181C();
  v14 = v13;
  _Block_copy(v8);
  v15 = a5;
  v16 = self;
  v17 = sub_18C93F134(v9, v11, v12, v14, (uint64_t)a5, (uint64_t)v16, (uint64_t (**)(_QWORD))v8);
  _Block_release(v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v17;
}

- (AMSBagCache)init
{
  return (AMSBagCache *)BagCache.init()();
}

- (void)removeAll
{
  AMSBagCache *v2;

  v2 = self;
  BagCache.removeAll()();

}

- (void).cxx_destruct
{
  swift_release();
}

@end
