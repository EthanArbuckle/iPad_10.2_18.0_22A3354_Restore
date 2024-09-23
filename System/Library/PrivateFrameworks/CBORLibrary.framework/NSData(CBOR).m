@implementation NSData(CBOR)

+ (uint64_t)dataWithCBOR:()CBOR
{
  return objc_msgSend(a1, "dataWithCBOR:encodingKeyOrder:", a3, 0);
}

+ (id)dataWithCBOR:()CBOR encodingKeyOrder:
{
  id v5;
  void *v6;
  unint64_t v7;
  id v8;
  unint64_t v9;
  __int128 *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  unsigned int v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  __int128 *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  _QWORD *v31;
  void *v32;
  uint64_t v33;
  id v34;
  void *v35;
  char *v36;
  void *v37;
  uint64_t v38;
  int v39;
  char v40;
  unint64_t v41;
  id v42;
  uint64_t v43;
  unsigned int v44;
  unsigned int v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t i;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t j;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t k;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  id v78;
  id v79;
  _QWORD v80[5];
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  char v85;
  _QWORD v86[18];

  v86[16] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(v5, "tag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0x24BDBC000uLL;
  if (v6)
  {
    objc_msgSend(v5, "tag");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v9 = objc_msgSend(v8, "unsignedLongLongValue");

    if (HIDWORD(v9))
    {
      LOBYTE(v81) = -37;
      v86[0] = bswap64(v9);
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithCapacity:", 9);
      objc_msgSend(v6, "appendBytes:length:", &v81, 1);
      v10 = (__int128 *)v86;
      v11 = v6;
      v12 = 8;
    }
    else if (v9 < 0x10000)
    {
      if (v9 < 0x100)
      {
        if (v9 > 0x17)
        {
          LOBYTE(v81) = -40;
          LOBYTE(v86[0]) = v9;
          v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithCapacity:", 2);
          objc_msgSend(v6, "appendBytes:length:", &v81, 1);
          v10 = (__int128 *)v86;
          v11 = v6;
        }
        else
        {
          LOBYTE(v81) = v9 - 64;
          v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithCapacity:", 1);
          v6 = v11;
          v10 = &v81;
        }
        v12 = 1;
      }
      else
      {
        LOBYTE(v81) = -39;
        LOWORD(v86[0]) = bswap32(v9) >> 16;
        v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithCapacity:", 3);
        objc_msgSend(v6, "appendBytes:length:", &v81, 1);
        v10 = (__int128 *)v86;
        v11 = v6;
        v12 = 2;
      }
    }
    else
    {
      LOBYTE(v81) = -38;
      LODWORD(v86[0]) = bswap32(v9);
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithCapacity:", 5);
      objc_msgSend(v6, "appendBytes:length:", &v81, 1);
      v10 = (__int128 *)v86;
      v11 = v6;
      v12 = 4;
    }
    objc_msgSend(v11, "appendBytes:length:", v10, v12);

  }
  switch(objc_msgSend(v5, "type"))
  {
    case 0:
      v22 = objc_msgSend(v5, "unsignedLongLongValue");
      objc_opt_self();
      if (HIDWORD(v22))
      {
        LOBYTE(v81) = 27;
        v23 = bswap64(v22);
        goto LABEL_31;
      }
      if (v22 >= 0x10000)
      {
        LOBYTE(v81) = 26;
        v44 = bswap32(v22);
        goto LABEL_56;
      }
      if (v22 >= 0x100)
      {
        LOBYTE(v81) = 25;
        v45 = bswap32(v22);
        goto LABEL_67;
      }
      if (v22 <= 0x17)
      {
        LOBYTE(v81) = v22;
        goto LABEL_76;
      }
      LOBYTE(v81) = 24;
      LOBYTE(v86[0]) = v22;
      goto LABEL_83;
    case 1:
      v24 = objc_msgSend(v5, "longLongValue");
      objc_opt_self();
      v25 = ~v24;
      if (v24 > 0xFFFFFFFEFFFFFFFFLL)
      {
        if (v24 > 0xFFFFFFFFFFFEFFFFLL)
        {
          if (v24 > 0xFFFFFFFFFFFFFEFFLL)
          {
            if (v24 < 0xFFFFFFFFFFFFFFE8)
            {
              LOBYTE(v81) = 56;
              LOBYTE(v86[0]) = ~(_BYTE)v24;
LABEL_83:
              v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithCapacity:", 2);
              objc_msgSend(v16, "appendBytes:length:", &v81, 1);
              v26 = (__int128 *)v86;
              v27 = v16;
            }
            else
            {
              LOBYTE(v81) = 31 - v24;
LABEL_76:
              v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithCapacity:", 1);
              v16 = v27;
              v26 = &v81;
            }
            v28 = 1;
          }
          else
          {
            LOBYTE(v81) = 57;
            v45 = bswap32(v25);
LABEL_67:
            LOWORD(v86[0]) = HIWORD(v45);
            v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithCapacity:", 3);
            objc_msgSend(v16, "appendBytes:length:", &v81, 1);
            v26 = (__int128 *)v86;
            v27 = v16;
            v28 = 2;
          }
        }
        else
        {
          LOBYTE(v81) = 58;
          v44 = bswap32(v25);
LABEL_56:
          LODWORD(v86[0]) = v44;
          v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithCapacity:", 5);
          objc_msgSend(v16, "appendBytes:length:", &v81, 1);
          v26 = (__int128 *)v86;
          v27 = v16;
          v28 = 4;
        }
      }
      else
      {
        LOBYTE(v81) = 59;
        v23 = bswap64(v25);
LABEL_31:
        v86[0] = v23;
        v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithCapacity:", 9);
        objc_msgSend(v16, "appendBytes:length:", &v81, 1);
        v26 = (__int128 *)v86;
        v27 = v16;
        v28 = 8;
      }
      objc_msgSend(v27, "appendBytes:length:", v26, v28);
      if (!v6)
        goto LABEL_122;
      goto LABEL_98;
    case 2:
      objc_msgSend(v5, "data");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_34;
    case 3:
      objc_msgSend(v5, "string");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_34:
      v13 = v29;
      +[CBOR encodeMajorType2or3:]((uint64_t)CBOR, v29);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_97;
    case 4:
      objc_msgSend(v5, "array");
      v30 = (id)objc_claimAutoreleasedReturnValue();
      objc_opt_self();
      v16 = (id)objc_opt_new();
      objc_msgSend(v30, "count");
      if ((unint64_t)objc_msgSend(v30, "count") >> 32)
      {
        LOBYTE(v80[0]) = -101;
        v86[0] = bswap64(objc_msgSend(v30, "count"));
        objc_msgSend(v16, "appendBytes:length:", v80, 1);
        v31 = v86;
        v32 = v16;
        v33 = 8;
      }
      else if ((unint64_t)objc_msgSend(v30, "count") < 0x10000)
      {
        if ((unint64_t)objc_msgSend(v30, "count") < 0x100)
        {
          if ((unint64_t)objc_msgSend(v30, "count") < 0x18)
          {
            LOBYTE(v80[0]) = objc_msgSend(v30, "count") ^ 0x80;
            v31 = v80;
          }
          else
          {
            LOBYTE(v80[0]) = -104;
            LOBYTE(v86[0]) = objc_msgSend(v30, "count");
            objc_msgSend(v16, "appendBytes:length:", v80, 1);
            v31 = v86;
          }
          v32 = v16;
          v33 = 1;
        }
        else
        {
          LOBYTE(v80[0]) = -103;
          LOWORD(v86[0]) = bswap32(objc_msgSend(v30, "count")) >> 16;
          objc_msgSend(v16, "appendBytes:length:", v80, 1);
          v31 = v86;
          v32 = v16;
          v33 = 2;
        }
      }
      else
      {
        LOBYTE(v80[0]) = -102;
        LODWORD(v86[0]) = bswap32(objc_msgSend(v30, "count"));
        objc_msgSend(v16, "appendBytes:length:", v80, 1);
        v31 = v86;
        v32 = v16;
        v33 = 4;
      }
      objc_msgSend(v32, "appendBytes:length:", v31, v33);
      v83 = 0u;
      v84 = 0u;
      v81 = 0u;
      v82 = 0u;
      v13 = v30;
      v46 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v81, v86, 16);
      if (v46)
      {
        v47 = v46;
        v48 = *(_QWORD *)v82;
        do
        {
          for (i = 0; i != v47; ++i)
          {
            if (*(_QWORD *)v82 != v48)
              objc_enumerationMutation(v13);
            objc_msgSend(MEMORY[0x24BDBCE50], "dataWithCBOR:", *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * i));
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "appendData:", v50);

          }
          v47 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v81, v86, 16);
        }
        while (v47);
      }

      goto LABEL_97;
    case 5:
      v34 = v5;
      objc_opt_self();
      objc_msgSend(v34, "dictionary");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (id)objc_opt_new();
      objc_msgSend(v35, "count");
      if ((unint64_t)objc_msgSend(v35, "count") >> 32)
      {
        v85 = -69;
        v86[0] = bswap64(objc_msgSend(v35, "count"));
        objc_msgSend(v16, "appendBytes:length:", &v85, 1);
        v36 = (char *)v86;
        v37 = v16;
        v38 = 8;
      }
      else if ((unint64_t)objc_msgSend(v35, "count") < 0x10000)
      {
        if ((unint64_t)objc_msgSend(v35, "count") < 0x100)
        {
          if ((unint64_t)objc_msgSend(v35, "count") < 0x18)
          {
            v85 = objc_msgSend(v35, "count") - 96;
            v36 = &v85;
          }
          else
          {
            v85 = -72;
            LOBYTE(v86[0]) = objc_msgSend(v35, "count");
            objc_msgSend(v16, "appendBytes:length:", &v85, 1);
            v36 = (char *)v86;
          }
          v37 = v16;
          v38 = 1;
        }
        else
        {
          v85 = -71;
          LOWORD(v86[0]) = bswap32(objc_msgSend(v35, "count")) >> 16;
          objc_msgSend(v16, "appendBytes:length:", &v85, 1);
          v36 = (char *)v86;
          v37 = v16;
          v38 = 2;
        }
      }
      else
      {
        v85 = -70;
        LODWORD(v86[0]) = bswap32(objc_msgSend(v35, "count"));
        objc_msgSend(v16, "appendBytes:length:", &v85, 1);
        v36 = (char *)v86;
        v37 = v16;
        v38 = 4;
      }
      objc_msgSend(v37, "appendBytes:length:", v36, v38);
      objc_msgSend(v34, "orderedKeys");
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      if (v55)
      {
        v83 = 0u;
        v84 = 0u;
        v81 = 0u;
        v82 = 0u;
        objc_msgSend(v34, "orderedKeys");
        v56 = (id)objc_claimAutoreleasedReturnValue();
        v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v81, v86, 16);
        if (!v57)
          goto LABEL_121;
        v58 = v57;
        v78 = v34;
        v79 = v5;
        v59 = *(_QWORD *)v82;
        do
        {
          for (j = 0; j != v58; ++j)
          {
            if (*(_QWORD *)v82 != v59)
              objc_enumerationMutation(v56);
            v61 = *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * j);
            objc_msgSend(MEMORY[0x24BDBCE50], "dataWithCBOR:", v61);
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "appendData:", v62);

            v63 = (void *)MEMORY[0x24BDBCE50];
            objc_msgSend(v35, "objectForKey:", v61);
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "dataWithCBOR:", v64);
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "appendData:", v65);

          }
          v58 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v81, v86, 16);
        }
        while (v58);
      }
      else
      {
        v78 = v34;
        v79 = v5;
        objc_msgSend(v35, "allKeys");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v80[0] = MEMORY[0x24BDAC760];
        v80[1] = 3221225472;
        v80[2] = __51__CBOR_Encoder__encodeMajorType5_encodingKeyOrder___block_invoke;
        v80[3] = &__block_descriptor_40_e23_q24__0__CBOR_8__CBOR_16l;
        v80[4] = a4;
        objc_msgSend(v66, "sortedArrayUsingComparator:", v80);
        v67 = (void *)objc_claimAutoreleasedReturnValue();

        v83 = 0u;
        v84 = 0u;
        v81 = 0u;
        v82 = 0u;
        v56 = v67;
        v68 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v81, v86, 16);
        if (v68)
        {
          v69 = v68;
          v70 = *(_QWORD *)v82;
          do
          {
            for (k = 0; k != v69; ++k)
            {
              if (*(_QWORD *)v82 != v70)
                objc_enumerationMutation(v56);
              v72 = *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * k);
              objc_msgSend(MEMORY[0x24BDBCE50], "dataWithCBOR:", v72);
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "appendData:", v73);

              v74 = (void *)MEMORY[0x24BDBCE50];
              objc_msgSend(v35, "objectForKey:", v72);
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v74, "dataWithCBOR:", v75);
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "appendData:", v76);

            }
            v69 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v81, v86, 16);
          }
          while (v69);
        }

      }
      v34 = v78;
      v5 = v79;
      v7 = 0x24BDBC000;
LABEL_121:

      if (!v6)
        goto LABEL_122;
      goto LABEL_98;
    case 6:
    case 7:
    case 8:
      v13 = v5;
      objc_opt_self();
      LOBYTE(v81) = 0;
      objc_msgSend(v13, "value");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      objc_opt_isKindOfClass();

      objc_msgSend(v13, "value");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "valueSize") == 2 && objc_msgSend(v13, "type") == 6)
      {
        LOBYTE(v81) = -7;
        v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithCapacity:", 3);
        objc_msgSend(v16, "appendBytes:length:", &v81, 1);
        objc_msgSend(v15, "doubleValue");
        LOWORD(v86[0]) = 0;
        v17 = v16;
        v18 = 2;
LABEL_24:
        objc_msgSend(v17, "appendBytes:length:", v86, v18);
        goto LABEL_26;
      }
      if (objc_msgSend(v13, "valueSize") == 4 && objc_msgSend(v13, "type") == 7)
      {
        LOBYTE(v81) = -6;
        v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithCapacity:", 5);
        objc_msgSend(v16, "appendBytes:length:", &v81, 1);
        objc_msgSend(v15, "floatValue");
        LODWORD(v86[0]) = bswap32(v19);
        v17 = v16;
        v18 = 4;
        goto LABEL_24;
      }
      if (objc_msgSend(v13, "valueSize") == 8 && objc_msgSend(v13, "type") == 8)
      {
        LOBYTE(v81) = -5;
        v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithCapacity:", 9);
        objc_msgSend(v16, "appendBytes:length:", &v81, 1);
        objc_msgSend(v15, "doubleValue");
        v86[0] = bswap64(v21);
        v17 = v16;
        v18 = 8;
        goto LABEL_24;
      }
      v16 = 0;
LABEL_26:

LABEL_97:
      if (v6)
      {
LABEL_98:
        v51 = (void *)MEMORY[0x212BAA510]();
        v52 = (void *)objc_msgSend(objc_alloc(*(Class *)(v7 + 3784)), "initWithData:", v6);
        v53 = v52;
        if (v16)
          objc_msgSend(v52, "appendData:", v16);
        v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithData:", v53);

        objc_autoreleasePoolPop(v51);
      }
      else
      {
LABEL_122:
        if (!v16)
LABEL_123:
          v16 = (id)objc_opt_new();
        v16 = v16;
        v54 = v16;
      }

      return v54;
    case 9:
      v39 = 0;
      goto LABEL_41;
    case 10:
      v39 = 1;
LABEL_41:
      +[CBOR encodeMajorType7Bool:]((uint64_t)CBOR, v39);
      v20 = objc_claimAutoreleasedReturnValue();
      goto LABEL_50;
    case 11:
      objc_opt_self();
      v40 = -10;
      goto LABEL_48;
    case 12:
    case 16:
      goto LABEL_20;
    case 13:
      v41 = objc_msgSend(v5, "longLongValue");
      objc_opt_self();
      if (v41 > 0x1F)
      {
        if (v41 - 32 > 0xDF)
        {
LABEL_20:
          +[CBOR encodeMajorType7Undefined]();
          v20 = objc_claimAutoreleasedReturnValue();
          goto LABEL_50;
        }
        LOBYTE(v86[0]) = -8;
        BYTE1(v86[0]) = v41;
        v42 = objc_alloc(MEMORY[0x24BDBCE50]);
        v43 = 2;
      }
      else
      {
        v40 = v41 - 32;
LABEL_48:
        LOBYTE(v86[0]) = v40;
        v42 = objc_alloc(MEMORY[0x24BDBCE50]);
        v43 = 1;
      }
      v20 = objc_msgSend(v42, "initWithBytes:length:", v86, v43);
LABEL_50:
      v16 = (id)v20;
      if (!v6)
        goto LABEL_122;
      goto LABEL_98;
    case 15:
      objc_opt_self();
      v40 = -1;
      goto LABEL_48;
    default:
      if (!v6)
        goto LABEL_123;
      v16 = 0;
      goto LABEL_98;
  }
}

@end
