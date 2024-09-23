@implementation SCNJSValueTmpImp

- (SCNVector4)toVector4
{
  double v3;
  float v4;
  double v5;
  float v6;
  double v7;
  float v8;
  double v9;
  float v10;
  float v11;
  float v12;
  float v13;
  SCNVector4 result;

  objc_msgSend((id)-[SCNJSValueTmpImp objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("x")), "toDouble");
  v4 = v3;
  objc_msgSend((id)-[SCNJSValueTmpImp objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("y")), "toDouble");
  v6 = v5;
  objc_msgSend((id)-[SCNJSValueTmpImp objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("z")), "toDouble");
  v8 = v7;
  objc_msgSend((id)-[SCNJSValueTmpImp objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("w")), "toDouble");
  v10 = v9;
  v11 = v4;
  v12 = v6;
  v13 = v8;
  result.w = v10;
  result.z = v13;
  result.y = v12;
  result.x = v11;
  return result;
}

+ (id)valueWithVector4:(SCNVector4)a3 inContext:(id)a4
{
  float w;
  float z;
  float y;
  double v9;
  double v10;
  double v11;
  _QWORD v13[4];
  _QWORD v14[5];

  w = a3.w;
  z = a3.z;
  y = a3.y;
  v14[4] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("x");
  v14[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", *(double *)&a3.x);
  v13[1] = CFSTR("y");
  *(float *)&v9 = y;
  v14[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
  v13[2] = CFSTR("z");
  *(float *)&v10 = z;
  v14[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v10);
  v13[3] = CFSTR("w");
  *(float *)&v11 = w;
  v14[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11);
  return (id)objc_msgSend(a1, "valueWithObject:inContext:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 4), a4);
}

- (SCNVector3)toVector3
{
  double v3;
  float v4;
  double v5;
  float v6;
  double v7;
  float v8;
  float v9;
  float v10;
  SCNVector3 result;

  objc_msgSend((id)-[SCNJSValueTmpImp objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("x")), "toDouble");
  v4 = v3;
  objc_msgSend((id)-[SCNJSValueTmpImp objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("y")), "toDouble");
  v6 = v5;
  objc_msgSend((id)-[SCNJSValueTmpImp objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("z")), "toDouble");
  v8 = v7;
  v9 = v4;
  v10 = v6;
  result.z = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

+ (id)valueWithVector3:(SCNVector3)a3 inContext:(id)a4
{
  float z;
  float y;
  double v8;
  double v9;
  _QWORD v11[3];
  _QWORD v12[4];

  z = a3.z;
  y = a3.y;
  v12[3] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("x");
  v12[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", *(double *)&a3.x);
  v11[1] = CFSTR("y");
  *(float *)&v8 = y;
  v12[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
  v11[2] = CFSTR("z");
  *(float *)&v9 = z;
  v12[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
  return (id)objc_msgSend(a1, "valueWithObject:inContext:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3), a4);
}

- (SCNMatrix4)toTransform3D
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  SCNMatrix4 *result;
  double v21;

  objc_msgSend((id)-[SCNJSValueTmpImp objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("m11")), "toDouble");
  *(float *)&v5 = v5;
  retstr->m11 = *(float *)&v5;
  objc_msgSend((id)-[SCNJSValueTmpImp objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("m12")), "toDouble");
  *(float *)&v6 = v6;
  retstr->m12 = *(float *)&v6;
  objc_msgSend((id)-[SCNJSValueTmpImp objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("m13")), "toDouble");
  *(float *)&v7 = v7;
  retstr->m13 = *(float *)&v7;
  objc_msgSend((id)-[SCNJSValueTmpImp objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("m14")), "toDouble");
  *(float *)&v8 = v8;
  retstr->m14 = *(float *)&v8;
  objc_msgSend((id)-[SCNJSValueTmpImp objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("m21")), "toDouble");
  *(float *)&v9 = v9;
  retstr->m21 = *(float *)&v9;
  objc_msgSend((id)-[SCNJSValueTmpImp objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("m22")), "toDouble");
  *(float *)&v10 = v10;
  retstr->m22 = *(float *)&v10;
  objc_msgSend((id)-[SCNJSValueTmpImp objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("m23")), "toDouble");
  *(float *)&v11 = v11;
  retstr->m23 = *(float *)&v11;
  objc_msgSend((id)-[SCNJSValueTmpImp objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("m24")), "toDouble");
  *(float *)&v12 = v12;
  retstr->m24 = *(float *)&v12;
  objc_msgSend((id)-[SCNJSValueTmpImp objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("m31")), "toDouble");
  *(float *)&v13 = v13;
  retstr->m31 = *(float *)&v13;
  objc_msgSend((id)-[SCNJSValueTmpImp objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("m32")), "toDouble");
  *(float *)&v14 = v14;
  retstr->m32 = *(float *)&v14;
  objc_msgSend((id)-[SCNJSValueTmpImp objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("m33")), "toDouble");
  *(float *)&v15 = v15;
  retstr->m33 = *(float *)&v15;
  objc_msgSend((id)-[SCNJSValueTmpImp objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("m34")), "toDouble");
  *(float *)&v16 = v16;
  retstr->m34 = *(float *)&v16;
  objc_msgSend((id)-[SCNJSValueTmpImp objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("m41")), "toDouble");
  *(float *)&v17 = v17;
  retstr->m41 = *(float *)&v17;
  objc_msgSend((id)-[SCNJSValueTmpImp objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("m42")), "toDouble");
  *(float *)&v18 = v18;
  retstr->m42 = *(float *)&v18;
  objc_msgSend((id)-[SCNJSValueTmpImp objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("m43")), "toDouble");
  *(float *)&v19 = v19;
  retstr->m43 = *(float *)&v19;
  result = (SCNMatrix4 *)objc_msgSend((id)-[SCNJSValueTmpImp objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("m44")), "toDouble");
  *(float *)&v21 = v21;
  retstr->m44 = *(float *)&v21;
  return result;
}

+ (id)valueWithTransform3D:(SCNMatrix4 *)a3 inContext:(id)a4
{
  double v4;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  _QWORD v24[16];
  _QWORD v25[17];

  v25[16] = *MEMORY[0x1E0C80C00];
  v24[0] = CFSTR("m11");
  *(float *)&v4 = a3->m11;
  v25[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v24[1] = CFSTR("m12");
  *(float *)&v8 = a3->m12;
  v25[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
  v24[2] = CFSTR("m13");
  *(float *)&v9 = a3->m13;
  v25[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
  v24[3] = CFSTR("m14");
  *(float *)&v10 = a3->m14;
  v25[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v10);
  v24[4] = CFSTR("m21");
  *(float *)&v11 = a3->m21;
  v25[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11);
  v24[5] = CFSTR("m22");
  *(float *)&v12 = a3->m22;
  v25[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v12);
  v24[6] = CFSTR("m23");
  *(float *)&v13 = a3->m23;
  v25[6] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v13);
  v24[7] = CFSTR("m24");
  *(float *)&v14 = a3->m24;
  v25[7] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v14);
  v24[8] = CFSTR("m31");
  *(float *)&v15 = a3->m31;
  v25[8] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v15);
  v24[9] = CFSTR("m32");
  *(float *)&v16 = a3->m32;
  v25[9] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v16);
  v24[10] = CFSTR("m33");
  *(float *)&v17 = a3->m33;
  v25[10] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v17);
  v24[11] = CFSTR("m34");
  *(float *)&v18 = a3->m34;
  v25[11] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v18);
  v24[12] = CFSTR("m41");
  *(float *)&v19 = a3->m41;
  v25[12] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v19);
  v24[13] = CFSTR("m42");
  *(float *)&v20 = a3->m42;
  v25[13] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v20);
  v24[14] = CFSTR("m43");
  *(float *)&v21 = a3->m43;
  v25[14] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v21);
  v24[15] = CFSTR("m44");
  *(float *)&v22 = a3->m44;
  v25[15] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v22);
  return (id)objc_msgSend(a1, "valueWithObject:inContext:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 16), a4);
}

@end
