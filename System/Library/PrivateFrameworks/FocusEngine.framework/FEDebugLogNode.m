@implementation FEDebugLogNode

uint64_t __113___FEDebugLogNode___genericAppendChildDescription_withPrefix_inheritedTreeStyle_recursionSelector_appendHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_isNode");
}

void __73___FEDebugLogNode__appendChildDescription_withPrefix_inheritedTreeStyle___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a2, "_stringRepresentation");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("%@%@"), v7, v8);

}

@end
