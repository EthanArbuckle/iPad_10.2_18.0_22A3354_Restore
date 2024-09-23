@implementation NSMutableArray(IC)

- (void)ic_addNonNilObject:()IC
{
  if (a3)
    return (void *)objc_msgSend(a1, "addObject:");
  return a1;
}

- (void)ic_addObjectsFromNonNilArray:()IC
{
  if (a3)
    return (void *)objc_msgSend(a1, "addObjectsFromArray:");
  return a1;
}

+ (id)ic_arrayFromNonNilObject:()IC
{
  void *v1;
  void *v2;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&off_1F040B9B8;
  objc_msgSendSuper2(&v4, sel_ic_arrayFromNonNilObject_);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  return v2;
}

- (void)ic_insertNonNilObject:()IC atIndex:
{
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  if ((a4 & 0x8000000000000000) != 0)
  {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[NSMutableArray(IC) ic_insertNonNilObject:atIndex:]", 1, 0, CFSTR("Trying to insert object in mutableArray at negative index %ld"), a4, v7);
    goto LABEL_8;
  }
  if (objc_msgSend(a1, "count") < a4)
  {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[NSMutableArray(IC) ic_insertNonNilObject:atIndex:]", 1, 0, CFSTR("Trying to insert object in mutableArray at index (%ld) greater than count (%ld)"), a4, objc_msgSend(a1, "count"));
LABEL_8:
    v6 = v8;
    goto LABEL_9;
  }
  v6 = v8;
  if (v8)
  {
    objc_msgSend(a1, "insertObject:atIndex:", v8, a4);
    goto LABEL_8;
  }
LABEL_9:

}

@end
