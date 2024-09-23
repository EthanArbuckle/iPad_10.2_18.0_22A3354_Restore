@implementation NSDictionary(SCNAdditions)

- (float)SCNVector3Value
{
  float v2;
  float v3;

  objc_msgSend((id)objc_msgSend(a1, "valueForKey:", CFSTR("x")), "floatValue");
  v3 = v2;
  objc_msgSend((id)objc_msgSend(a1, "valueForKey:", CFSTR("y")), "floatValue");
  objc_msgSend((id)objc_msgSend(a1, "valueForKey:", CFSTR("z")), "floatValue");
  return v3;
}

- (float)SCNVector4Value
{
  float v2;
  float v3;

  objc_msgSend((id)objc_msgSend(a1, "valueForKey:", CFSTR("x")), "floatValue");
  v3 = v2;
  objc_msgSend((id)objc_msgSend(a1, "valueForKey:", CFSTR("y")), "floatValue");
  objc_msgSend((id)objc_msgSend(a1, "valueForKey:", CFSTR("z")), "floatValue");
  objc_msgSend((id)objc_msgSend(a1, "valueForKey:", CFSTR("w")), "floatValue");
  return v3;
}

- (uint64_t)SCNMatrix4Value
{
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  uint64_t result;
  int v20;

  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  objc_msgSend((id)objc_msgSend(a1, "valueForKey:", CFSTR("m11")), "floatValue");
  *(_DWORD *)a2 = v4;
  objc_msgSend((id)objc_msgSend(a1, "valueForKey:", CFSTR("m12")), "floatValue");
  *(_DWORD *)(a2 + 4) = v5;
  objc_msgSend((id)objc_msgSend(a1, "valueForKey:", CFSTR("m13")), "floatValue");
  *(_DWORD *)(a2 + 8) = v6;
  objc_msgSend((id)objc_msgSend(a1, "valueForKey:", CFSTR("m14")), "floatValue");
  *(_DWORD *)(a2 + 12) = v7;
  objc_msgSend((id)objc_msgSend(a1, "valueForKey:", CFSTR("m21")), "floatValue");
  *(_DWORD *)(a2 + 16) = v8;
  objc_msgSend((id)objc_msgSend(a1, "valueForKey:", CFSTR("m22")), "floatValue");
  *(_DWORD *)(a2 + 20) = v9;
  objc_msgSend((id)objc_msgSend(a1, "valueForKey:", CFSTR("m23")), "floatValue");
  *(_DWORD *)(a2 + 24) = v10;
  objc_msgSend((id)objc_msgSend(a1, "valueForKey:", CFSTR("m24")), "floatValue");
  *(_DWORD *)(a2 + 28) = v11;
  objc_msgSend((id)objc_msgSend(a1, "valueForKey:", CFSTR("m31")), "floatValue");
  *(_DWORD *)(a2 + 32) = v12;
  objc_msgSend((id)objc_msgSend(a1, "valueForKey:", CFSTR("m32")), "floatValue");
  *(_DWORD *)(a2 + 36) = v13;
  objc_msgSend((id)objc_msgSend(a1, "valueForKey:", CFSTR("m33")), "floatValue");
  *(_DWORD *)(a2 + 40) = v14;
  objc_msgSend((id)objc_msgSend(a1, "valueForKey:", CFSTR("m34")), "floatValue");
  *(_DWORD *)(a2 + 44) = v15;
  objc_msgSend((id)objc_msgSend(a1, "valueForKey:", CFSTR("m41")), "floatValue");
  *(_DWORD *)(a2 + 48) = v16;
  objc_msgSend((id)objc_msgSend(a1, "valueForKey:", CFSTR("m42")), "floatValue");
  *(_DWORD *)(a2 + 52) = v17;
  objc_msgSend((id)objc_msgSend(a1, "valueForKey:", CFSTR("m43")), "floatValue");
  *(_DWORD *)(a2 + 56) = v18;
  result = objc_msgSend((id)objc_msgSend(a1, "valueForKey:", CFSTR("m44")), "floatValue");
  *(_DWORD *)(a2 + 60) = v20;
  return result;
}

@end
