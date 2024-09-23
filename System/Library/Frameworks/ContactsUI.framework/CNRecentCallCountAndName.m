@implementation CNRecentCallCountAndName

- (NSString)speakableName
{
  return self->_speakableName;
}

- (unint64_t)callCount
{
  return self->_callCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speakableName, 0);
}

+ (id)instanceWithName:(id)a3 callCount:(unint64_t)a4
{
  __CFString *v5;
  CNRecentCallCountAndName *v6;
  CNRecentCallCountAndName *v7;
  __CFString *v8;

  v5 = (__CFString *)a3;
  v6 = objc_alloc_init(CNRecentCallCountAndName);
  v7 = v6;
  if (v5)
    v8 = v5;
  else
    v8 = &stru_1E20507A8;
  objc_storeStrong((id *)&v6->_speakableName, v8);

  v7->_callCount = a4;
  return v7;
}

@end
