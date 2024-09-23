@implementation NMICTK2TextView

+ (id)createTextViewWithNote:(id)a3 size:(CGSize)a4
{
  double height;
  double width;
  objc_class *v6;
  id v7;
  void *v8;

  height = a4.height;
  width = a4.width;
  v6 = (objc_class *)MEMORY[0x24BE6DD00];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithNote:size:insideSystemPaper:linkDelegate:insideSiriSnippet:", v7, 0, 0, 1, width, height);

  return v8;
}

@end
