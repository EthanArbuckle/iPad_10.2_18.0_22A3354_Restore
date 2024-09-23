@implementation NSArray(SCNAdditions)

+ (uint64_t)SCN_arrayWithSimdMatrix4:()SCNAdditions
{
  double v4;
  double v5;
  double v6;
  double v7;
  _QWORD v13[17];

  v13[16] = *MEMORY[0x1E0C80C00];
  v13[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
  HIDWORD(v4) = a1.n128_u32[1];
  LODWORD(v4) = a1.n128_u32[1];
  v13[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v13[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a1.n128_u32[1], a1.n128_u32[2])));
  v13[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a1.n128_u32[1], a1.n128_u32[3])));
  v13[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", a2.n128_f64[0]);
  HIDWORD(v5) = a2.n128_u32[1];
  LODWORD(v5) = a2.n128_u32[1];
  v13[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v13[6] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a2.n128_u32[1], a2.n128_u32[2])));
  v13[7] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a2.n128_u32[1], a2.n128_u32[3])));
  v13[8] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", a3.n128_f64[0]);
  HIDWORD(v6) = a3.n128_u32[1];
  LODWORD(v6) = a3.n128_u32[1];
  v13[9] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
  v13[10] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a3.n128_u32[1], a3.n128_u32[2])));
  v13[11] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a3.n128_u32[1], a3.n128_u32[3])));
  v13[12] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", a4.n128_f64[0]);
  HIDWORD(v7) = a4.n128_u32[1];
  LODWORD(v7) = a4.n128_u32[1];
  v13[13] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7);
  v13[14] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a4.n128_u32[1], a4.n128_u32[2])));
  v13[15] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a4.n128_u32[1], a4.n128_u32[3])));
  return objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 16);
}

- (__n128)SCN_simdMatrix4Value
{
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  __int128 v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  __int128 v11;

  if ((unint64_t)objc_msgSend(a1, "count") > 0xF)
  {
    objc_msgSend((id)objc_msgSend(a1, "objectAtIndexedSubscript:", 0), "floatValue");
    v10 = v3;
    objc_msgSend((id)objc_msgSend(a1, "objectAtIndexedSubscript:", 1), "floatValue");
    v9 = v4;
    objc_msgSend((id)objc_msgSend(a1, "objectAtIndexedSubscript:", 2), "floatValue");
    v8 = v5;
    objc_msgSend((id)objc_msgSend(a1, "objectAtIndexedSubscript:", 3), "floatValue");
    *(_QWORD *)&v6 = __PAIR64__(v9, v10);
    *((_QWORD *)&v6 + 1) = __PAIR64__(v7, v8);
    v11 = v6;
    objc_msgSend((id)objc_msgSend(a1, "objectAtIndexedSubscript:", 4), "floatValue");
    objc_msgSend((id)objc_msgSend(a1, "objectAtIndexedSubscript:", 5), "floatValue");
    objc_msgSend((id)objc_msgSend(a1, "objectAtIndexedSubscript:", 6), "floatValue");
    objc_msgSend((id)objc_msgSend(a1, "objectAtIndexedSubscript:", 7), "floatValue");
    objc_msgSend((id)objc_msgSend(a1, "objectAtIndexedSubscript:", 8), "floatValue");
    objc_msgSend((id)objc_msgSend(a1, "objectAtIndexedSubscript:", 9), "floatValue");
    objc_msgSend((id)objc_msgSend(a1, "objectAtIndexedSubscript:", 10), "floatValue");
    objc_msgSend((id)objc_msgSend(a1, "objectAtIndexedSubscript:", 11), "floatValue");
    objc_msgSend((id)objc_msgSend(a1, "objectAtIndexedSubscript:", 12), "floatValue");
    objc_msgSend((id)objc_msgSend(a1, "objectAtIndexedSubscript:", 13), "floatValue");
    objc_msgSend((id)objc_msgSend(a1, "objectAtIndexedSubscript:", 14), "floatValue");
    objc_msgSend((id)objc_msgSend(a1, "objectAtIndexedSubscript:", 15), "floatValue");
    return (__n128)v11;
  }
  else
  {
    return *(__n128 *)MEMORY[0x1E0C83FF0];
  }
}

@end
