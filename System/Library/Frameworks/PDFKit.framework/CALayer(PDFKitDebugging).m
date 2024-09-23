@implementation CALayer(PDFKitDebugging)

- (id)PDFKitDumpToFile
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  objc_class *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;

  v2 = (void *)CAEncodeLayerTree();
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    NSTemporaryDirectory();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v3, "processName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v3, "processIdentifier");
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "systemUptime");
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@-%d-%@-%p-layer-%ld.caar"), v6, v7, v9, a1, (unint64_t)(v10 * 100000.0));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingPathComponent:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v2, "writeToFile:atomically:", v12, 1);
    NSLog(CFSTR("layer tree dumped to: %@"), v12);

  }
  else
  {
    NSLog(CFSTR("no layer tree to dump..."));
    v12 = 0;
  }

  return v12;
}

@end
