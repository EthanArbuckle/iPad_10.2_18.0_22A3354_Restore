@implementation NSArray

id __75__NSArray_SGStructuredEventDissector__sg_deepCopyWithoutEmptySchemaObjects__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v2, "sg_isEmptySchemaObject") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v2, "sg_deepCopyWithoutEmptySchemaObjects");
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = v2;
    }
    v3 = v4;
  }

  return v3;
}

@end
