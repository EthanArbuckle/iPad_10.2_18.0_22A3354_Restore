@implementation CGSVGNodeCreateCompoundCGPath

void __CGSVGNodeCreateCompoundCGPath_block_invoke(_QWORD *a1, _QWORD *a2, int a3)
{
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  os_unfair_lock_s *v11;
  _QWORD *v12;
  __int128 *v13;
  _OWORD *v14;
  unint64_t v15;
  __int128 v16;
  __int128 v17;
  _OWORD *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char *v24;
  char *v25;
  char *v26;
  __int128 v27;
  __int128 v28;
  char *v29;
  char *v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  SVGShapeNode *v38;
  _OWORD *SVGPath;
  _OWORD *v40;
  _QWORD *v41;
  uint64_t v42;
  __int128 v43;
  unint64_t v44;
  unint64_t v45;
  __int128 *v46;
  __int128 v47;
  __int128 v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  char *v55;
  char *v56;
  char *v57;
  char *v58;
  char *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  CGAffineTransform v63;
  CGAffineTransform t1;
  CGAffineTransform v65;
  CGAffineTransform v66;

  if (a3)
  {
    if ((_QWORD *)a1[8] == a2)
      *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
    v5 = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 48);
    if (v5 != *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40))
    {
      v6 = *(_QWORD *)(a1[5] + 8);
      v7 = *(_OWORD *)(v5 - 48);
      v8 = *(_OWORD *)(v5 - 32);
      *(_OWORD *)(v6 + 72) = *(_OWORD *)(v5 - 16);
      *(_OWORD *)(v6 + 56) = v8;
      *(_OWORD *)(v6 + 40) = v7;
      *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 48) -= 48;
    }
  }
  else
  {
    v9 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    *(_OWORD *)&v66.a = *MEMORY[0x24BDBD8B8];
    *(_OWORD *)&v66.c = v9;
    *(_OWORD *)&v66.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
    v10 = a2[7];
    if (v10)
    {
      v11 = (os_unfair_lock_s *)SVGAttributeMap::attribute(v10, 0x3Fu);
      if (v11)
        SVGAttribute::transformValue(v11, &v66);
    }
    v12 = *(_QWORD **)(a1[4] + 8);
    v13 = (__int128 *)(*(_QWORD *)(a1[5] + 8) + 40);
    v14 = (_OWORD *)v12[6];
    v15 = v12[7];
    if ((unint64_t)v14 >= v15)
    {
      v19 = v12[5];
      v20 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v14 - v19) >> 4);
      v21 = v20 + 1;
      if (v20 + 1 > 0x555555555555555)
        std::vector<double>::__throw_length_error[abi:ne180100]();
      v22 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v15 - v19) >> 4);
      if (2 * v22 > v21)
        v21 = 2 * v22;
      if (v22 >= 0x2AAAAAAAAAAAAAALL)
        v23 = 0x555555555555555;
      else
        v23 = v21;
      if (v23)
        v24 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGAffineTransform>>((uint64_t)(v12 + 7), v23);
      else
        v24 = 0;
      v25 = &v24[48 * v20];
      v26 = &v24[48 * v23];
      v27 = *v13;
      v28 = v13[2];
      *((_OWORD *)v25 + 1) = v13[1];
      *((_OWORD *)v25 + 2) = v28;
      *(_OWORD *)v25 = v27;
      v18 = v25 + 48;
      v30 = (char *)v12[5];
      v29 = (char *)v12[6];
      if (v29 != v30)
      {
        do
        {
          v31 = *((_OWORD *)v29 - 3);
          v32 = *((_OWORD *)v29 - 1);
          *((_OWORD *)v25 - 2) = *((_OWORD *)v29 - 2);
          *((_OWORD *)v25 - 1) = v32;
          *((_OWORD *)v25 - 3) = v31;
          v25 -= 48;
          v29 -= 48;
        }
        while (v29 != v30);
        v29 = (char *)v12[5];
      }
      v12[5] = v25;
      v12[6] = v18;
      v12[7] = v26;
      if (v29)
        operator delete(v29);
    }
    else
    {
      v16 = *v13;
      v17 = *(_OWORD *)(*(_QWORD *)(a1[5] + 8) + 72);
      v14[1] = *(_OWORD *)(*(_QWORD *)(a1[5] + 8) + 56);
      v14[2] = v17;
      *v14 = v16;
      v18 = v14 + 3;
    }
    v12[6] = v18;
    t1 = v66;
    v33 = *(_QWORD *)(a1[5] + 8);
    v34 = *(_OWORD *)(v33 + 40);
    v35 = *(_OWORD *)(v33 + 72);
    *(_OWORD *)&v63.c = *(_OWORD *)(v33 + 56);
    *(_OWORD *)&v63.tx = v35;
    *(_OWORD *)&v63.a = v34;
    CGAffineTransformConcat(&v65, &t1, &v63);
    v37 = *(_OWORD *)&v65.c;
    v36 = *(_OWORD *)&v65.tx;
    *(_OWORD *)(v33 + 40) = *(_OWORD *)&v65.a;
    *(_OWORD *)(v33 + 56) = v37;
    *(_OWORD *)(v33 + 72) = v36;
    if ((_QWORD *)a1[8] == a2)
      *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
    if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
    {
      if (v38)
      {
        SVGPath = SVGShapeNode::createSVGPath(v38);
        if (SVGPath)
        {
          v40 = SVGPath;
          v41 = *(_QWORD **)(a1[7] + 8);
          v42 = *(_QWORD *)(a1[5] + 8);
          v43 = *(_OWORD *)(v42 + 56);
          *(_OWORD *)&v65.a = *(_OWORD *)(v42 + 40);
          *(_OWORD *)&v65.c = v43;
          *(_OWORD *)&v65.tx = *(_OWORD *)(v42 + 72);
          v44 = v41[6];
          v45 = v41[7];
          if (v44 >= v45)
          {
            v50 = v41[5];
            v51 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v44 - v50) >> 3);
            v52 = v51 + 1;
            if ((unint64_t)(v51 + 1) > 0x492492492492492)
              std::vector<double>::__throw_length_error[abi:ne180100]();
            v53 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v45 - v50) >> 3);
            if (2 * v53 > v52)
              v52 = 2 * v53;
            if (v53 >= 0x249249249249249)
              v54 = 0x492492492492492;
            else
              v54 = v52;
            if (v54)
              v55 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<CGAffineTransform,SVGPath *>>>((uint64_t)(v41 + 7), v54);
            else
              v55 = 0;
            v56 = &v55[56 * v51];
            v57 = &v55[56 * v54];
            *(CGAffineTransform *)v56 = v65;
            *((_QWORD *)v56 + 6) = v40;
            v49 = v56 + 56;
            v59 = (char *)v41[5];
            v58 = (char *)v41[6];
            if (v58 != v59)
            {
              do
              {
                v60 = *(_OWORD *)(v58 - 56);
                v61 = *(_OWORD *)(v58 - 40);
                v62 = *(_OWORD *)(v58 - 24);
                *((_QWORD *)v56 - 1) = *((_QWORD *)v58 - 1);
                *(_OWORD *)(v56 - 24) = v62;
                *(_OWORD *)(v56 - 40) = v61;
                *(_OWORD *)(v56 - 56) = v60;
                v56 -= 56;
                v58 -= 56;
              }
              while (v58 != v59);
              v58 = (char *)v41[5];
            }
            v41[5] = v56;
            v41[6] = v49;
            v41[7] = v57;
            if (v58)
              operator delete(v58);
          }
          else
          {
            v46 = (__int128 *)(v42 + 40);
            v47 = *v46;
            v48 = v46[2];
            *(_OWORD *)(v44 + 16) = v46[1];
            *(_OWORD *)(v44 + 32) = v48;
            *(_OWORD *)v44 = v47;
            *(_QWORD *)(v44 + 48) = SVGPath;
            v49 = (char *)(v44 + 56);
          }
          v41[6] = v49;
        }
      }
    }
  }
}

@end
