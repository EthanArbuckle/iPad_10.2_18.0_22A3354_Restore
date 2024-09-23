@implementation ARFaceAnchor(DebugOutput)

- (uint64_t)description
{
  void *v2;
  const __CFString *v3;
  float v4;
  double v5;
  float v6;
  double v7;
  float v8;

  v2 = (void *)MEMORY[0x24BDD17C8];
  if (objc_msgSend(a1, "isTracked"))
    v3 = CFSTR("YES");
  else
    v3 = CFSTR("NO");
  objc_msgSend(a1, "transform");
  v5 = v4;
  objc_msgSend(a1, "transform");
  v7 = v6;
  objc_msgSend(a1, "transform");
  return objc_msgSend(v2, "stringWithFormat:", CFSTR("face anchor: isTracked=%@, position=(%f,%f,%f)"), v3, *(_QWORD *)&v5, *(_QWORD *)&v7, v8);
}

@end
