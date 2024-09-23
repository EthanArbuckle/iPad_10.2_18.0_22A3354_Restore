@implementation NTKDate

+ (id)faceDateWithTimeIntervalSinceNow:(double)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(a1, "faceDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateWithTimeInterval:sinceDate:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
