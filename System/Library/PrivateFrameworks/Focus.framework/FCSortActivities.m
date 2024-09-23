@implementation FCSortActivities

uint64_t ___FCSortActivities_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "_dndMode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "semanticType");

  if ((unint64_t)(v3 - 1) > 4)
    return 3;
  else
    return qword_213CACAF0[v3 - 1];
}

@end
