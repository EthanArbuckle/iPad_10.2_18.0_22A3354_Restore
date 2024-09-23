@implementation UIDataSourceSnapshotter

uint64_t __51___UIDataSourceSnapshotter_snapshotterForSnapshot___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2 == -1)
    return objc_msgSend(v2, "numberOfSections");
  else
    return objc_msgSend(v2, "numberOfItemsInSection:", a2);
}

@end
