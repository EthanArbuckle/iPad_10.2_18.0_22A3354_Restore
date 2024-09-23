@implementation NSCoder(NearbyInteraction)

- (void)encodeVector3:()NearbyInteraction forKey:
{
  id v5;
  void *v6;
  __n128 v7;

  v7 = a2;
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v7, 16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "encodeObject:forKey:", v6, v5, *(_OWORD *)&v7);

}

- (__n128)decodeVector3ForKey:()NearbyInteraction
{
  id v4;
  id v5;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;

  v4 = a3;
  objc_msgSend(a1, "decodeObjectOfClass:forKey:", objc_opt_class(), v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v5, "length") <= 0xF)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "simd_float3 GetVector3FromNSData(NSData *__strong)");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("NINearbyObject.mm"), 663, CFSTR("NSData must contain enough bytes for simd_float3"));

  }
  DWORD2(v10) = 0;
  *(_QWORD *)&v10 = 0;
  objc_msgSend(v5, "getBytes:length:", &v10, 16);
  v9 = v10;

  return (__n128)v9;
}

- (void)encodeQuat:()NearbyInteraction forKey:
{
  id v5;
  void *v6;
  __n128 v7;

  v7 = a2;
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v7, 16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "encodeObject:forKey:", v6, v5, *(_OWORD *)&v7);

}

- (__n128)decodeQuatForKey:()NearbyInteraction
{
  id v4;
  id v5;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;

  v4 = a3;
  objc_msgSend(a1, "decodeObjectOfClass:forKey:", objc_opt_class(), v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v5, "length") <= 0xF)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "simd_quatf GetQuaternionFromNSData(NSData *__strong)");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("NINearbyObject.mm"), 670, CFSTR("NSData must contain enough bytes for simd_quatf"));

  }
  objc_msgSend(v5, "getBytes:length:", &v10, 16);

  v9 = v10;
  return (__n128)v9;
}

- (void)encodeMatrix4x4:()NearbyInteraction forKey:
{
  id v8;
  void *v9;
  __n128 v10;
  __n128 v11;
  __n128 v12;
  __n128 v13;

  v10 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v8 = a7;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v10, 64);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "encodeObject:forKey:", v9, v8, *(_OWORD *)&v10, *(_OWORD *)&v11, *(_OWORD *)&v12, *(_OWORD *)&v13);

}

- (__n128)decodeMatrix4x4ForKey:()NearbyInteraction
{
  id v4;
  id v5;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;

  v4 = a3;
  if (objc_msgSend(a1, "containsValueForKey:", v4))
  {
    objc_msgSend(a1, "decodeObjectOfClass:forKey:", objc_opt_class(), v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v5, "length") <= 0x3F)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "simd_float4x4 GetMatrix4x4FromNSData(NSData *__strong)");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("NIVisionSupport.mm"), 111, CFSTR("NSData must contain enough bytes for simd_float4x4"));

    }
    objc_msgSend(v5, "getBytes:length:", &v10, 64);

    v9 = v10;
  }
  else
  {
    v9 = *MEMORY[0x1E0C83FF0];
  }

  return (__n128)v9;
}

@end
