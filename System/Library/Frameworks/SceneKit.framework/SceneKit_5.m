_QWORD *OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement::propagateEdgeTags(_QWORD *this)
{
  uint64_t v1;
  uint64_t v2;

  LODWORD(v1) = *(_DWORD *)(*this + 44);
  if ((int)v1 >= 1)
  {
    v2 = 0;
    do
      *(_BYTE *)(*(_QWORD *)(this[4] + 48) + v2++) = 0;
    while (v2 < *(int *)(*this + 44));
    LODWORD(v1) = *(_DWORD *)(*this + 44);
  }
  if ((int)v1 < *(_DWORD *)(this[3] + 4))
  {
    v1 = (int)v1;
    do
    {
      *(_BYTE *)(*(_QWORD *)(this[4] + 48) + v1) = *(_BYTE *)(*(_QWORD *)(this[2] + 48)
                                                              + *(int *)(*(_QWORD *)(*this + 288) + 4 * v1));
      ++v1;
    }
    while (v1 < *(int *)(this[3] + 4));
  }
  return this;
}

int **OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement::propagateValueTags(int **this)
{
  int **v1;
  int *v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v1 = this;
  v2 = *this;
  v3 = (*this)[13];
  if (v3 >= 1)
  {
    v4 = v2[19];
    v5 = v3 + v4;
    v6 = *(int *)(*((_QWORD *)this[4] + 12) + 4 * v4);
    do
    {
      *(_BYTE *)(*((_QWORD *)this[4] + 21) + v6) = 0;
      ++v4;
      ++v6;
    }
    while (v4 < v5);
    v2 = *this;
  }
  v7 = v2[14];
  if ((int)v7 >= 1)
  {
    v8 = v2[20];
    v9 = v7 + v8;
    if (*((_BYTE *)this[2] + 13))
      v10 = 1;
    else
      v10 = 9;
    do
    {
      v11 = v1[4];
      v12 = *((_QWORD *)v11 + 9);
      if (*(_WORD *)(v12 + 2 * v8))
      {
        if ((*(_BYTE *)(*((_QWORD *)v1[2] + 6) + *(int *)(*((_QWORD *)*v1 + 39) + 4 * v8)) & 9) != 0)
          v13 = v10;
        else
          v13 = 0;
        this = (int **)memset((void *)(*((_QWORD *)v11 + 21) + *(int *)(*((_QWORD *)v11 + 12) + 4 * v8)), v13, *(unsigned __int16 *)(v12 + 2 * v8));
      }
      ++v8;
    }
    while (v8 < v9);
    v2 = *v1;
  }
  v14 = v2[15];
  if ((int)v14 >= 1)
  {
    v15 = v2[21];
    v16 = v14 + v15;
    do
    {
      if ((*(_BYTE *)(*((_QWORD *)*v1 + 48) + v15) & 1) != 0)
        OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement::propagateValueTags();
      v17 = *(int *)(*((_QWORD *)*v1 + 39) + 4 * v15);
      this = (int **)memcpy((void *)(*((_QWORD *)v1[4] + 21) + *(int *)(*((_QWORD *)v1[4] + 12) + 4 * v15++)), (const void *)(*((_QWORD *)v1[2] + 21) + *(int *)(*((_QWORD *)v1[2] + 12) + 4 * v17)), *(unsigned __int16 *)(*((_QWORD *)v1[2] + 9) + 2 * v17));
    }
    while (v15 < v16);
  }
  return this;
}

_QWORD *OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement::propagateValueCreases(_QWORD *this)
{
  uint64_t v1;
  uint64_t v2;
  __int16 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  __int16 v13;
  _WORD *v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  _DWORD *v23;
  _DWORD *v24;
  char v25;

  v1 = this[4];
  if (*(_BYTE *)(v1 + 13))
    OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement::propagateValueCreases();
  v2 = *this;
  if (*(_DWORD *)(*this + 32) == 4)
    v3 = 2;
  else
    v3 = 3;
  v4 = *(int *)(v2 + 56);
  if ((int)v4 >= 1)
  {
    v5 = *(int *)(v2 + 80);
    v6 = v4 + v5;
    v7 = *(_QWORD *)(v1 + 72);
    v8 = *(_QWORD *)(v1 + 96);
    v9 = *(_QWORD *)(v1 + 168);
    do
    {
      v10 = *(int *)(v8 + 4 * v5);
      v11 = (char *)(v9 + v10);
      if ((*(_BYTE *)(v9 + v10) & 1) != 0 && (*(_BYTE *)(*(_QWORD *)(v2 + 384) + v5) & 1) == 0)
      {
        v12 = *(unsigned __int16 *)(v7 + 2 * v5);
        if (*(_WORD *)(v7 + 2 * v5))
        {
          v13 = 0;
          v14 = (_WORD *)(*(_QWORD *)(v1 + 192) + 4 * v10 + 2);
          do
          {
            v15 = *v11++;
            if ((v15 & 0x18) != 0)
            {
              *(v14 - 1) = v13;
              *v14 = v3 - 1 + v13;
            }
            v13 += v3;
            v14 += 2;
            --v12;
          }
          while (v12);
        }
      }
      ++v5;
    }
    while (v5 < v6);
  }
  v16 = *(int *)(v2 + 60);
  if ((int)v16 >= 1)
  {
    v17 = *(int *)(v2 + 84);
    v18 = v16 + v17;
    do
    {
      v19 = (_QWORD *)this[4];
      v20 = *(int *)(v19[12] + 4 * v17);
      v21 = (char *)(v19[21] + v20);
      if ((*v21 & 1) != 0 && (*(_BYTE *)(*(_QWORD *)(*this + 384) + v17) & 1) == 0)
      {
        v22 = *(unsigned __int16 *)(v19[9] + 2 * v17);
        if (*(_WORD *)(v19[9] + 2 * v17))
        {
          v23 = (_DWORD *)(*(_QWORD *)(this[2] + 192)
                         + 4
                         * *(int *)(*(_QWORD *)(this[2] + 96) + 4 * *(int *)(*(_QWORD *)(*this + 312) + 4 * v17)));
          v24 = (_DWORD *)(v19[24] + 4 * v20);
          do
          {
            v25 = *v21++;
            if ((v25 & 0x18) != 0)
              *v24 = *v23;
            ++v24;
            ++v23;
            --v22;
          }
          while (v22);
        }
      }
      ++v17;
    }
    while (v17 < v18);
  }
  return this;
}

void OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement::reclassifySemisharpValues(OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement *this)
{
  void *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  unsigned __int16 *v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  char v34;
  BOOL v35;
  char v36;
  uint64_t v37;
  unint64_t v38;
  char v39;
  uint64_t *v40;
  uint64_t v41;
  void *__p;
  uint64_t v43;

  v2 = 0;
  v43 = *MEMORY[0x1E0C80C00];
  v3 = *(unsigned __int8 *)(*((_QWORD *)this + 2) + 14);
  v4 = *(unsigned int *)(*((_QWORD *)this + 3) + 20);
  v40 = &v41;
  __p = 0;
  if (v4 >= 0x11)
  {
    v2 = operator new(4 * v4);
    __p = v2;
    v40 = (uint64_t *)v2;
  }
  v5 = *(int *)(*(_QWORD *)this + 60);
  if ((int)v5 >= 1)
  {
    v6 = *(int *)(*(_QWORD *)this + 84);
    v7 = v5 + v6;
    while (1)
    {
      v8 = (_QWORD *)*((_QWORD *)this + 4);
      v9 = *(int *)(v8[12] + 4 * v6);
      v10 = (char *)(v8[21] + v9);
      if ((*v10 & 1) == 0)
        goto LABEL_9;
      v11 = *(_QWORD *)this;
      if ((*(_BYTE *)(*(_QWORD *)(*(_QWORD *)this + 384) + v6) & 1) != 0)
        goto LABEL_9;
      v12 = *(int *)(*(_QWORD *)(v11 + 312) + 4 * v6);
      v13 = (_QWORD *)*((_QWORD *)this + 1);
      if ((*(_WORD *)(v13[54] + 2 * v12) & 0x60) == 0)
        goto LABEL_9;
      v14 = (_QWORD *)*((_QWORD *)this + 3);
      v15 = *(_WORD *)(v14[54] + 2 * v6);
      if ((v15 & 0x30) != 0)
        goto LABEL_9;
      v16 = *(unsigned __int16 *)(v8[9] + 2 * v6);
      if ((v15 & 0x40) == 0)
      {
        if (*(_WORD *)(v8[9] + 2 * v6))
        {
          do
          {
            if ((*v10 & 0x10) != 0)
              *v10 = *v10 & 0xC7 | 8;
            ++v10;
            --v16;
          }
          while (v16);
        }
        goto LABEL_9;
      }
      v17 = v8[24];
      v18 = v14[45];
      if (((v14[46] - v18) & 0x3FFFFFFFCLL) != 0)
      {
        v20 = v14[42];
        v19 = (uint64_t *)(v18 + 4 * *(int *)(v20 + 8 * (_DWORD)v6 + 4));
        LODWORD(v20) = *(_DWORD *)(v20 + 8 * (int)v6);
      }
      else
      {
        v21 = v13[42];
        v20 = *(unsigned int *)(v21 + 8 * (_DWORD)v12);
        v19 = v40;
        if ((int)v20 >= 1)
        {
          v22 = 0;
          v23 = *(int *)(v21 + 8 * v12 + 4);
          v24 = v13[45] + 4 * v23;
          v25 = v13[48] + 2 * v23;
          v26 = *(_QWORD *)(v11 + 192);
          do
          {
            *((_DWORD *)v40 + v22) = *(_DWORD *)(v26
                                               + 8 * *(int *)(v24 + 4 * v22)
                                               + 4 * *(unsigned __int16 *)(v25 + 2 * v22));
            ++v22;
          }
          while (v20 != v22);
        }
      }
      if ((_DWORD)v16)
        break;
LABEL_9:
      if (++v6 >= v7)
      {
        v2 = __p;
        goto LABEL_51;
      }
    }
    v27 = 0;
    v28 = v17 + 4 * v9;
    while (1)
    {
      v29 = v10[v27];
      if ((v29 & 0x30) == 0x10)
      {
        v30 = (unsigned __int16 *)(v28 + 4 * v27);
        v31 = *v30;
        v32 = v30[1];
        if (v32 <= v31)
        {
          if (v31 <= v32)
            goto LABEL_41;
          if ((int)v31 + 1 < (int)v20)
          {
            do
            {
              v36 = *(_BYTE *)(*(_QWORD *)(*((_QWORD *)this + 3) + 240) + *((int *)v19 + v31 + 1));
              if ((v36 & 8) != 0)
                break;
              v37 = v31 + 2;
              ++v31;
            }
            while (v37 < (int)v20);
            if ((v36 & 8) != 0)
              goto LABEL_42;
          }
          v38 = 0;
          do
          {
            v34 = *(_BYTE *)(*(_QWORD *)(*((_QWORD *)this + 3) + 240) + *((int *)v19 + v38));
            if ((v34 & 8) != 0)
              break;
            v35 = v38++ >= v32;
          }
          while (!v35);
        }
        else
        {
          v33 = v31 + 1;
          do
          {
            v34 = *(_BYTE *)(*(_QWORD *)(*((_QWORD *)this + 3) + 240) + *((int *)v19 + v33));
            if ((v34 & 8) != 0)
              break;
            v35 = v33++ >= v32;
          }
          while (!v35);
        }
        if ((v34 & 8) == 0)
LABEL_41:
          v10[v27] = v29 & 0xC7 | 8;
      }
LABEL_42:
      if (++v27 == v16)
      {
        if (v3 && (_DWORD)v16 == 2)
        {
          v39 = *v10;
          if ((*v10 & 0x20) != 0 && (v10[1] & 0x10) == 0)
          {
LABEL_50:
            *v10 = v39 & 0xDF;
          }
          else if ((*v10 & 0x10) == 0 && (v10[1] & 0x20) != 0)
          {
            v39 = *++v10;
            goto LABEL_50;
          }
        }
        goto LABEL_9;
      }
    }
  }
LABEL_51:
  operator delete(v2);
}

_QWORD *OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement::populateChildValuesFromFaceVertices(_QWORD *this)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;

  v1 = *(int *)(*this + 52);
  if ((int)v1 >= 1)
  {
    v2 = *(int *)(*this + 76);
    v3 = v1 + v2;
    v4 = this[4];
    v5 = *(_QWORD *)(v4 + 96);
    v6 = *(_QWORD *)(v4 + 72);
    v7 = *(_DWORD *)(v4 + 16);
    do
    {
      *(_DWORD *)(v5 + 4 * v2) = v7;
      *(_WORD *)(v6 + 2 * v2) = 1;
      v7 = *(_DWORD *)(v4 + 16) + 1;
      *(_DWORD *)(v4 + 16) = v7;
      ++v2;
    }
    while (v2 < v3);
  }
  return this;
}

uint64_t OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement::populateChildValuesFromEdgeVertices(uint64_t this)
{
  uint64_t v1;
  OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = *(int *)(*(_QWORD *)this + 56);
  if ((int)v1 >= 1)
  {
    v2 = (OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement *)this;
    v3 = *(int *)(*(_QWORD *)this + 80);
    v4 = v1 + v3;
    v5 = *(_QWORD *)(this + 32);
    do
    {
      v6 = *(int *)(*(_QWORD *)(*(_QWORD *)v2 + 312) + 4 * v3);
      *(_DWORD *)(*(_QWORD *)(v5 + 96) + 4 * v3) = *(_DWORD *)(v5 + 16);
      if ((*(_BYTE *)(*(_QWORD *)(*((_QWORD *)v2 + 2) + 48) + v6) & 1) != 0)
      {
        this = OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement::populateChildValuesForEdgeVertex(v2, v3, v6);
        v5 = *((_QWORD *)v2 + 4);
        v7 = *(_QWORD *)(v5 + 72);
      }
      else
      {
        v7 = *(_QWORD *)(v5 + 72);
        this = 1;
      }
      *(_WORD *)(v7 + 2 * v3) = this;
      *(_DWORD *)(v5 + 16) += this;
      ++v3;
    }
    while (v3 < v4);
  }
  return this;
}

_QWORD *OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement::populateChildValuesFromVertexVertices(_QWORD *this)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  uint64_t v17;
  __int16 *v18;
  _WORD *v19;
  __int16 v20;

  v1 = *this;
  v2 = *(int *)(*this + 60);
  if ((int)v2 >= 1)
  {
    v3 = *(int *)(v1 + 84);
    v4 = v2 + v3;
    v5 = *(_QWORD *)(v1 + 312);
    v6 = this[4];
    v7 = *(_QWORD *)(v6 + 96);
    v8 = (_QWORD *)this[2];
    v9 = v8[12];
    v10 = v8[21];
    v11 = *(_DWORD *)(v6 + 16);
    do
    {
      v12 = *(int *)(v5 + 4 * v3);
      *(_DWORD *)(v7 + 4 * v3) = v11;
      if ((*(_BYTE *)(v10 + *(int *)(v9 + 4 * v12)) & 1) != 0)
      {
        if ((*(_BYTE *)(*(_QWORD *)(v1 + 384) + v3) & 1) != 0)
          OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement::populateChildValuesFromVertexVertices();
        v13 = *(unsigned __int16 *)(v8[9] + 2 * v12);
        if (v13 >= 2)
        {
          v14 = this[5] + 2 * v11;
          for (i = 1; i != v13; ++i)
            *(_WORD *)(v14 + 2 * i) = i;
          v16 = *(_QWORD *)(*(_QWORD *)v6 + 264);
          v17 = *(unsigned int *)(v16 + 8 * (_DWORD)v3);
          if ((int)v17 >= 1)
          {
            v18 = (__int16 *)(v8[15] + 2 * *(int *)(*(_QWORD *)(*v8 + 264) + 4 * (int)((2 * v12) | 1)));
            v19 = (_WORD *)(*(_QWORD *)(v6 + 120) + 2 * *(int *)(v16 + 8 * (int)v3 + 4));
            do
            {
              v20 = *v18++;
              *v19++ = v20;
              --v17;
            }
            while (v17);
          }
        }
      }
      else
      {
        LODWORD(v13) = 1;
      }
      *(_WORD *)(*(_QWORD *)(v6 + 72) + 2 * v3) = v13;
      v11 = *(_DWORD *)(v6 + 16) + v13;
      *(_DWORD *)(v6 + 16) = v11;
      ++v3;
    }
    while (v3 < v4);
  }
  return this;
}

uint64_t OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement::populateChildValuesForEdgeVertex(OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement *this, int a2, int a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t i;

  v4 = *((_QWORD *)this + 1);
  v5 = *(_QWORD *)(v4 + 144);
  result = *(unsigned int *)(v5 + 8 * a3);
  if ((_DWORD)result != 1)
  {
    v7 = *(_QWORD *)(v4 + 168);
    v8 = *(int *)(v5 + 8 * a3 + 4);
    v9 = (_QWORD *)*((_QWORD *)this + 4);
    if ((int)result >= 1)
    {
      v10 = 0;
      v11 = *((_QWORD *)this + 5) + 2 * *(int *)(v9[12] + 4 * a2);
      do
      {
        *(_WORD *)(v11 + 2 * v10) = v10;
        ++v10;
      }
      while (result != v10);
    }
    v12 = *((_QWORD *)this + 3);
    v13 = *(_QWORD *)(v12 + 264);
    v14 = *(unsigned int *)(v13 + 8 * a2);
    v15 = *(_QWORD *)(*v9 + 264);
    if ((_DWORD)v14 != *(_DWORD *)(v15 + 8 * a2))
      OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement::populateChildValuesForEdgeVertex();
    if ((int)v14 < (int)result)
      OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement::populateChildValuesForEdgeVertex();
    if ((int)v14 >= 1)
    {
      v16 = 0;
      v17 = v7 + 4 * v8;
      v18 = *(_QWORD *)(v12 + 288);
      v19 = (8 * a2) | 4;
      v20 = v18 + 4 * *(int *)(v13 + v19);
      v21 = v9[15] + 2 * *(int *)(v15 + v19);
      v22 = *(_QWORD *)(*(_QWORD *)this + 264);
      do
      {
        v23 = *(_DWORD *)(v22 + 4 * *(int *)(v20 + 4 * v16));
        if ((_DWORD)result == 2)
        {
          if (v23 == *(_DWORD *)(v17 + 4))
            *(_WORD *)(v21 + 2 * v16) = 1;
        }
        else if ((int)result >= 1)
        {
          for (i = 0; i != result; ++i)
          {
            if (v23 == *(_DWORD *)(v17 + 4 * i))
              *(_WORD *)(v21 + 2 * v16) = i;
          }
        }
        ++v16;
      }
      while (v16 != v14);
    }
  }
  return result;
}

float OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement::getFractionalWeight(OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement *this, int a2, unsigned int a3, int a4)
{
  int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  float *v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int v22;
  uint64_t v23;
  float *v24;
  unsigned __int16 *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int *v33;
  int *v34;
  uint64_t v35;
  float *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int *v42;
  int *v43;
  uint64_t v44;
  float *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  float *v49;
  uint64_t v50;
  uint64_t v51;
  float v52;
  uint64_t v54;
  int v56;
  float *v57;
  int v58;
  int v59;
  _BYTE v60[128];
  float *v61;
  _BYTE *v62;
  uint64_t v63;
  _BYTE v64[64];
  void *v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v6 = (int *)v64;
  v62 = v64;
  v63 = 0x1000000000;
  v65 = 0;
  v7 = *((_QWORD *)this + 1);
  v8 = *(_QWORD *)(v7 + 360);
  v9 = a2;
  v10 = (2 * a2) | 1;
  v11 = *(_QWORD *)(v7 + 336);
  v12 = *(int *)(v11 + 4 * v10);
  v13 = (int *)(v8 + 4 * v12);
  v14 = *(unsigned int *)(v11 + 8 * a2);
  v15 = (_QWORD *)*((_QWORD *)this + 3);
  v16 = v15[45];
  if (((v15[46] - v16) & 0x3FFFFFFFCLL) != 0)
  {
    v6 = (int *)(v16 + 4 * *(int *)(v15[42] + 8 * a4 + 4));
    goto LABEL_11;
  }
  if (!(_DWORD)v14)
  {
    v18 = a2;
    operator delete(0);
    v9 = v18;
    v63 = 0x1000000000;
    v19 = (float *)v60;
    v57 = (float *)v60;
    v58 = 0;
    v59 = 32;
    v61 = 0;
    v62 = v64;
    goto LABEL_13;
  }
  if (v14 <= 0x10)
  {
    LODWORD(v63) = v14;
    v17 = *(_QWORD *)(*((_QWORD *)this + 1) + 384)
        + 2 * *(int *)(*(_QWORD *)(*((_QWORD *)this + 1) + 336) + 4 * v10);
  }
  else
  {
    v54 = a2;
    operator delete(0);
    v6 = (int *)operator new(4 * v14);
    v65 = v6;
    v62 = v6;
    LODWORD(v63) = v14;
    HIDWORD(v63) = v14;
    if ((int)v14 < 1)
    {
      v9 = v54;
      goto LABEL_11;
    }
    v17 = *(_QWORD *)(*((_QWORD *)this + 1) + 384)
        + 2 * *(int *)(*(_QWORD *)(*((_QWORD *)this + 1) + 336) + 4 * v10);
    v9 = v54;
  }
  v20 = 0;
  v21 = *(_QWORD *)(*(_QWORD *)this + 192);
  do
  {
    v6[v20] = *(_DWORD *)(v21 + 8 * v13[v20] + 4 * *(unsigned __int16 *)(v17 + 2 * v20));
    ++v20;
  }
  while (v14 != v20);
LABEL_11:
  v19 = (float *)v60;
  v57 = (float *)v60;
  v58 = 2 * v14;
  v59 = 32;
  v61 = 0;
  if ((2 * v14) >= 0x21)
  {
    v22 = a3;
    v23 = v9;
    v24 = (float *)operator new(4 * (2 * v14));
    v9 = v23;
    a3 = v22;
    v19 = v24;
    v61 = v24;
    v57 = v24;
    v59 = 2 * v14;
  }
LABEL_13:
  v25 = (unsigned __int16 *)(*(_QWORD *)(*((_QWORD *)this + 2) + 192)
                           + 4 * *(int *)(*(_QWORD *)(*((_QWORD *)this + 2) + 96) + 4 * v9)
                           + 4 * a3);
  v26 = *v25;
  v27 = v25[1];
  v28 = (v27 - v26);
  if (v27 <= v26)
  {
    v29 = *((_QWORD *)this + 1);
    if (v26 <= v27)
    {
      LODWORD(v28) = 0;
      v31 = *((_QWORD *)this + 3);
    }
    else
    {
      v39 = *(_QWORD *)(v29 + 216);
      v31 = *((_QWORD *)this + 3);
      v40 = *(_QWORD *)(v31 + 216);
      if ((int)v26 + 1 >= (int)v14)
      {
        v41 = 0;
      }
      else
      {
        v41 = (v14 + ~(_DWORD)v26);
        v42 = (int *)(4 * v12 + 4 * v26 + v8 + 4);
        v43 = &v6[v26 + 1];
        v44 = v41;
        v45 = v19;
        do
        {
          v46 = *v42++;
          *v45 = *(float *)(v39 + 4 * v46);
          v47 = *v43++;
          v45[(int)v14] = *(float *)(v40 + 4 * v47);
          ++v45;
          --v44;
        }
        while (v44);
      }
      v48 = v27 + 1;
      v49 = &v19[v41];
      LODWORD(v28) = v27 + v41 + 1;
      do
      {
        v50 = *v13++;
        *v49 = *(float *)(v39 + 4 * v50);
        v51 = *v6++;
        v49[(int)v14] = *(float *)(v40 + 4 * v51);
        ++v49;
        --v48;
      }
      while (v48);
    }
  }
  else
  {
    v29 = *((_QWORD *)this + 1);
    v30 = *(_QWORD *)(v29 + 216);
    v31 = *((_QWORD *)this + 3);
    v32 = *(_QWORD *)(v31 + 216);
    v33 = &v6[v26 + 1];
    v34 = (int *)(4 * v12 + 4 * v26 + v8 + 4);
    v35 = v28;
    v36 = v19;
    do
    {
      v37 = *v34++;
      *v36 = *(float *)(v30 + 4 * v37);
      v38 = *v33++;
      v36[(int)v14] = *(float *)(v32 + 4 * v38);
      ++v36;
      --v35;
    }
    while (v35);
  }
  v56 = *(_DWORD *)(*(_QWORD *)this + 24);
  v52 = OpenSubdiv::v3_1_1::Sdc::Crease::ComputeFractionalWeightAtVertex((OpenSubdiv::v3_1_1::Sdc::Crease *)&v56, *(float *)(*(_QWORD *)(v29 + 408) + 4 * v9), *(float *)(*(_QWORD *)(v31 + 408) + 4 * a4), v28, v19, &v19[(int)v14]);
  operator delete(v61);
  operator delete(v65);
  return v52;
}

void OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement::estimateAndAllocateChildValues()
{
  __assert_rtn("estimateAndAllocateChildValues", "fvarRefinement.cpp", 142, "_refinement.isChildVertexComplete(cVert)");
}

void OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement::propagateValueTags()
{
  __assert_rtn("propagateValueTags", "fvarRefinement.cpp", 439, "_refinement.isChildVertexComplete(cVert)");
}

void OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement::propagateValueCreases()
{
  __assert_rtn("propagateValueCreases", "fvarRefinement.cpp", 452, "_childFVar.hasSmoothBoundaries()");
}

void OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement::populateChildValuesFromVertexVertices()
{
  __assert_rtn("populateChildValuesForVertexVertex", "fvarRefinement.cpp", 251, "_refinement.isChildVertexComplete(cVert)");
}

void OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement::populateChildValuesForEdgeVertex()
{
  __assert_rtn("populateChildValuesForEdgeVertex", "fvarRefinement.cpp", 221, "cVertFaces.size() >= cValueCount");
}

{
  __assert_rtn("populateChildValuesForEdgeVertex", "fvarRefinement.cpp", 220, "cVertFaces.size() == cVertFaceSiblings.size()");
}

double OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::TriRefinement(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  _QWORD *v4;
  double result;

  v4 = (_QWORD *)OpenSubdiv::v3_1_1::Vtr::internal::Refinement::Refinement(a1, a2, a3, a4);
  *v4 = &off_1EA598570;
  v4[65] = 0;
  v4[63] = 0;
  v4[64] = 0;
  *(_QWORD *)&result = 0x300000001;
  *(_QWORD *)((char *)v4 + 28) = 0x300000001;
  return result;
}

void OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::~TriRefinement(OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement *this)
{
  void *v2;

  *(_QWORD *)this = &off_1EA598570;
  v2 = (void *)*((_QWORD *)this + 63);
  if (v2)
  {
    *((_QWORD *)this + 64) = v2;
    operator delete(v2);
  }
  OpenSubdiv::v3_1_1::Vtr::internal::Refinement::~Refinement(this);
}

{
  OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::~TriRefinement(this);
  JUMPOUT(0x1DF0D41C0);
}

void OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::allocateParentChildIndices(std::vector<int> *this)
{
  std::vector<int>::pointer end;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  std::vector<int>::size_type v7;
  uint64_t v8;
  std::vector<int>::size_type v9;
  std::vector<int>::pointer v10;
  std::vector<int>::pointer begin;
  int v12;
  uint64_t v13;
  _DWORD *v14;
  unint64_t v15;
  int *v16;
  uint64_t v17;
  std::vector<int>::value_type v18;
  std::vector<int>::value_type __x;

  end = this->__end_;
  v4 = *((_QWORD *)end + 9);
  v3 = *((_QWORD *)end + 10);
  v6 = *((_QWORD *)end + 15);
  v5 = *((_QWORD *)end + 16);
  v8 = *end;
  v7 = end[1];
  v9 = end[2];
  __x = 4;
  std::vector<int>::resize(this + 21, 2 * v8, &__x);
  v10 = this->__end_;
  begin = this[21].__begin_;
  if (*v10 >= 1)
  {
    v12 = 0;
    v13 = 0;
    v14 = begin + 1;
    do
    {
      *v14 = v12;
      v14 += 2;
      ++v13;
      v12 += 4;
    }
    while (v13 < *v10);
  }
  v15 = (unint64_t)((char *)this[21].__end_ - (char *)begin) >> 2;
  this[3].__end_cap_.__value_ = begin;
  LODWORD(this[4].__begin_) = v15;
  v16 = (int *)*((_QWORD *)v10 + 3);
  v17 = (*((_QWORD *)v10 + 4) - (_QWORD)v16) >> 2;
  this[4].__end_ = v16;
  LODWORD(this[4].__end_cap_.__value_) = v17;
  v18 = 0;
  std::vector<int>::resize(this + 5, 4 * v8, &v18);
  std::vector<int>::resize(this + 6, (int)((v3 - v4) >> 2), &v18);
  std::vector<int>::resize(this + 8, (int)((v5 - v6) >> 2), &v18);
  std::vector<int>::resize(this + 7, 0, &v18);
  std::vector<int>::resize(this + 9, v7, &v18);
  std::vector<int>::resize(this + 10, v9, &v18);
}

_QWORD *OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateFaceVertexRelation(OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement *this)
{
  std::vector<unsigned int> *v2;

  v2 = (std::vector<unsigned int> *)*((_QWORD *)this + 2);
  if (v2[1].__end_ == v2[1].__begin_)
  {
    OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateFaceVertexCountsAndOffsets(this);
    v2 = (std::vector<unsigned int> *)*((_QWORD *)this + 2);
  }
  std::vector<int>::resize(v2 + 2, 3 * SLODWORD(v2->__begin_));
  return OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateFaceVerticesFromParentFaces(this);
}

void OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateFaceVertexCountsAndOffsets(OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement *this)
{
  std::vector<int> *v2;
  uint64_t begin_low;
  int *v4;
  int v5;
  uint64_t v6;
  _DWORD *v7;
  std::vector<int>::value_type __x;

  v2 = (std::vector<int> *)*((_QWORD *)this + 2);
  begin_low = SLODWORD(v2->__begin_);
  __x = 3;
  std::vector<int>::resize(v2 + 1, 2 * begin_low, &__x);
  v4 = (int *)*((_QWORD *)this + 2);
  if (*v4 >= 1)
  {
    v5 = 0;
    v6 = 0;
    v7 = (_DWORD *)(*((_QWORD *)v4 + 3) + 4);
    do
    {
      *v7 = v5;
      v7 += 2;
      ++v6;
      v5 += 3;
    }
    while (v6 < *v4);
  }
}

_QWORD *OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateFaceVerticesFromParentFaces(_QWORD *this)
{
  int *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  int *v7;
  uint64_t v8;
  int *v9;
  int *v10;
  uint64_t v11;
  int v12;
  int v13;
  _DWORD *v14;
  int v15;
  _DWORD *v16;
  int v17;
  _DWORD *v18;
  int v19;
  _DWORD *v20;
  int v21;
  _DWORD *v22;

  v1 = (int *)this[1];
  if (*v1 >= 1)
  {
    v2 = 0;
    v3 = *((_QWORD *)v1 + 6);
    v4 = *((_QWORD *)v1 + 9);
    v5 = this[15];
    v6 = (int *)(this[11] + 4);
    v7 = (int *)(*((_QWORD *)v1 + 3) + 4);
    do
    {
      if (*(v7 - 1) != 3)
        OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateFaceVerticesFromParentFaces();
      if (*(v6 - 1) != 4)
        OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateFaceVerticesFromParentFaces();
      v8 = *v7;
      v9 = (int *)(v3 + 4 * v8);
      v10 = (int *)(v4 + 4 * v8);
      v11 = this[27];
      v12 = *(_DWORD *)(v11 + 4 * *v10);
      v13 = *(_DWORD *)(v11 + 4 * v10[1]);
      v14 = (_DWORD *)(v5 + 4 * *v6);
      v15 = *(_DWORD *)(v11 + 4 * v10[2]);
      if (*v14 != -1)
      {
        v16 = (_DWORD *)(*(_QWORD *)(this[2] + 48)
                       + 4 * *(int *)(*(_QWORD *)(this[2] + 24) + 4 * ((2 * *v14) | 1)));
        *v16 = *(_DWORD *)(this[30] + 4 * *v9);
        v16[1] = v12;
        v16[2] = v15;
      }
      v17 = v14[1];
      if (v17 != -1)
      {
        v18 = (_DWORD *)(*(_QWORD *)(this[2] + 48)
                       + 4 * *(int *)(*(_QWORD *)(this[2] + 24) + 4 * ((2 * v17) | 1)));
        *v18 = v12;
        v18[1] = *(_DWORD *)(this[30] + 4 * v9[1]);
        v18[2] = v13;
      }
      v19 = v14[2];
      if (v19 != -1)
      {
        v20 = (_DWORD *)(*(_QWORD *)(this[2] + 48)
                       + 4 * *(int *)(*(_QWORD *)(this[2] + 24) + 4 * ((2 * v19) | 1)));
        *v20 = v15;
        v20[1] = v13;
        v20[2] = *(_DWORD *)(this[30] + 4 * v9[2]);
      }
      v21 = v14[3];
      if (v21 != -1)
      {
        v22 = (_DWORD *)(*(_QWORD *)(this[2] + 48)
                       + 4 * *(int *)(*(_QWORD *)(this[2] + 24) + 4 * ((2 * v21) | 1)));
        *v22 = v13;
        v22[1] = v15;
        v22[2] = v12;
      }
      v7 += 2;
      ++v2;
      v6 += 2;
    }
    while (v2 < *v1);
  }
  return this;
}

_QWORD *OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateFaceEdgeRelation(OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement *this)
{
  std::vector<unsigned int> *v2;

  v2 = (std::vector<unsigned int> *)*((_QWORD *)this + 2);
  if (v2[1].__end_ == v2[1].__begin_)
  {
    OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateFaceVertexCountsAndOffsets(this);
    v2 = (std::vector<unsigned int> *)*((_QWORD *)this + 2);
  }
  std::vector<int>::resize(v2 + 3, 3 * SLODWORD(v2->__begin_));
  return OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateFaceEdgesFromParentFaces(this);
}

_QWORD *OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateFaceEdgesFromParentFaces(_QWORD *this)
{
  int *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _DWORD *v12;
  int *v13;
  _DWORD *v14;
  _DWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  uint64_t v20;
  _DWORD *v21;
  _BOOL4 v22;
  uint64_t v23;
  int v24;
  _DWORD *v25;
  _DWORD *v26;
  int v27;
  int v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  int v32;
  _DWORD *v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v1 = (int *)this[1];
  if (*v1 >= 1)
  {
    v2 = 0;
    v3 = *((_QWORD *)v1 + 3);
    v4 = *((_QWORD *)v1 + 6);
    v5 = *((_QWORD *)v1 + 9);
    v6 = this[11];
    v7 = this[15];
    v8 = this[13];
    v9 = this[18];
    do
    {
      if (*(_DWORD *)(v6 + 8 * v2) != 4)
        OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateFaceEdgesFromParentFaces();
      if (*(_DWORD *)(v8 + 8 * v2) != 3)
        OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateFaceEdgesFromParentFaces();
      v10 = (8 * v2) | 4;
      v11 = *(int *)(v3 + v10);
      v12 = (_DWORD *)(v4 + 4 * v11);
      v13 = (int *)(v5 + 4 * v11);
      v14 = (_DWORD *)(v7 + 4 * *(int *)(v6 + v10));
      v15 = (_DWORD *)(v9 + 4 * *(int *)(v8 + v10));
      v16 = this[24];
      v17 = *((_QWORD *)v1 + 15);
      for (i = 4; i != 28; i += 8)
      {
        v20 = *v13++;
        v19 = v20;
        v21 = (_DWORD *)(v17 + 8 * v20);
        v22 = *v21 != v21[1] && *v12 != *v21;
        v23 = v16 + 8 * v19;
        v24 = *(_DWORD *)(v23 + 4 * v22);
        v25 = (int *)((char *)&v34 + i);
        LODWORD(v23) = *(_DWORD *)(v23 + 4 * !v22);
        *(v25 - 1) = v24;
        *v25 = v23;
        ++v12;
      }
      if (*v14 != -1)
      {
        v26 = (_DWORD *)(*(_QWORD *)(this[2] + 72)
                       + 4 * *(int *)(*(_QWORD *)(this[2] + 24) + 4 * ((2 * *v14) | 1)));
        v27 = v37;
        *v26 = v34;
        v26[1] = *v15;
        v26[2] = v27;
      }
      v28 = v14[1];
      if (v28 != -1)
      {
        v29 = *(_QWORD *)(this[2] + 72) + 4 * *(int *)(*(_QWORD *)(this[2] + 24) + 4 * ((2 * v28) | 1));
        *(_QWORD *)v29 = v35;
        *(_DWORD *)(v29 + 8) = v15[1];
      }
      v30 = v14[2];
      if (v30 != -1)
      {
        v31 = *(_QWORD *)(this[2] + 72) + 4 * *(int *)(*(_QWORD *)(this[2] + 24) + 4 * ((2 * v30) | 1));
        *(_DWORD *)v31 = v15[2];
        *(_QWORD *)(v31 + 4) = v36;
      }
      v32 = v14[3];
      if (v32 != -1)
      {
        v33 = (_DWORD *)(*(_QWORD *)(this[2] + 72)
                       + 4 * *(int *)(*(_QWORD *)(this[2] + 24) + 4 * ((2 * v32) | 1)));
        *v33 = v15[2];
        v33[1] = *v15;
        v33[2] = v15[1];
      }
      ++v2;
    }
    while (v2 < *v1);
  }
  return this;
}

_QWORD *OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateEdgeVertexRelation(OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement *this)
{
  std::vector<int>::resize((std::vector<unsigned int> *)(*((_QWORD *)this + 2) + 120), 2 * *(int *)(*((_QWORD *)this + 2) + 4));
  OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateEdgeVerticesFromParentFaces(this);
  return OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateEdgeVerticesFromParentEdges(this);
}

_QWORD *OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateEdgeVerticesFromParentFaces(_QWORD *this)
{
  int *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int *v5;
  int *v6;
  int *v7;
  uint64_t v8;
  int v9;
  int v10;
  int *v11;
  int v12;
  uint64_t v13;
  _DWORD *v14;
  uint64_t v15;
  _DWORD *v16;
  uint64_t v17;
  _DWORD *v18;

  v1 = (int *)this[1];
  if (*v1 >= 1)
  {
    v2 = 0;
    v3 = *((_QWORD *)v1 + 9);
    v4 = this[18];
    v5 = (int *)(this[13] + 4);
    v6 = (int *)(*((_QWORD *)v1 + 3) + 4);
    do
    {
      if (*(v6 - 1) != 3)
        OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateEdgeVerticesFromParentFaces();
      if (*(v5 - 1) != 3)
        OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateEdgeVerticesFromParentFaces();
      v7 = (int *)(v3 + 4 * *v6);
      v8 = this[27];
      v9 = *(_DWORD *)(v8 + 4 * *v7);
      v10 = *(_DWORD *)(v8 + 4 * v7[1]);
      v11 = (int *)(v4 + 4 * *v5);
      v12 = *(_DWORD *)(v8 + 4 * v7[2]);
      v13 = *v11;
      if ((_DWORD)v13 != -1)
      {
        v14 = (_DWORD *)(*(_QWORD *)(this[2] + 120) + 8 * v13);
        *v14 = v9;
        v14[1] = v12;
      }
      v15 = v11[1];
      if ((_DWORD)v15 != -1)
      {
        v16 = (_DWORD *)(*(_QWORD *)(this[2] + 120) + 8 * v15);
        *v16 = v10;
        v16[1] = v9;
      }
      v17 = v11[2];
      if ((_DWORD)v17 != -1)
      {
        v18 = (_DWORD *)(*(_QWORD *)(this[2] + 120) + 8 * v17);
        *v18 = v12;
        v18[1] = v10;
      }
      v6 += 2;
      ++v2;
      v5 += 2;
    }
    while (v2 < *v1);
  }
  return this;
}

_QWORD *OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateEdgeVerticesFromParentEdges(_QWORD *this)
{
  uint64_t v1;
  uint64_t v2;
  int *v3;
  int *v4;
  uint64_t v5;
  _DWORD *v6;
  uint64_t v7;
  _DWORD *v8;

  v1 = this[1];
  if (*(int *)(v1 + 4) >= 1)
  {
    v2 = 0;
    v3 = (int *)(this[24] + 4);
    v4 = (int *)(*(_QWORD *)(v1 + 120) + 4);
    do
    {
      v5 = *(v3 - 1);
      if ((_DWORD)v5 != -1)
      {
        v6 = (_DWORD *)(*(_QWORD *)(this[2] + 120) + 8 * v5);
        *v6 = *(_DWORD *)(this[27] + 4 * v2);
        v6[1] = *(_DWORD *)(this[30] + 4 * *(v4 - 1));
      }
      v7 = *v3;
      if ((_DWORD)v7 != -1)
      {
        v8 = (_DWORD *)(*(_QWORD *)(this[2] + 120) + 8 * v7);
        *v8 = *(_DWORD *)(this[27] + 4 * v2);
        v8[1] = *(_DWORD *)(this[30] + 4 * *v4);
      }
      ++v2;
      v3 += 2;
      v4 += 2;
    }
    while (v2 < *(int *)(v1 + 4));
  }
  return this;
}

void OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateEdgeFaceRelation(OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement *this)
{
  int v2;
  uint64_t v3;
  int *v4;
  std::vector<unsigned int>::size_type v5;

  v2 = 2
     * (((*(_QWORD *)(*((_QWORD *)this + 1) + 176) - *(_QWORD *)(*((_QWORD *)this + 1) + 168)) >> 2)
      + ((*((_QWORD *)this + 19) - *((_QWORD *)this + 18)) >> 2));
  std::vector<int>::resize((std::vector<unsigned int> *)(*((_QWORD *)this + 2) + 144), 2 * *(int *)(*((_QWORD *)this + 2) + 4));
  std::vector<int>::resize((std::vector<unsigned int> *)(*((_QWORD *)this + 2) + 168), v2);
  std::vector<unsigned short>::resize(*((_QWORD *)this + 2) + 192, v2);
  *(_DWORD *)(*((_QWORD *)this + 2) + 16) = *(_DWORD *)(*((_QWORD *)this + 1) + 16);
  OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateEdgeFacesFromParentFaces(this);
  OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateEdgeFacesFromParentEdges(this);
  v3 = *((_QWORD *)this + 2);
  v4 = (int *)(*(_QWORD *)(v3 + 144) + 4 * (2 * *(_DWORD *)(v3 + 4) - 2));
  v5 = v4[1] + (uint64_t)*v4;
  std::vector<int>::resize((std::vector<unsigned int> *)(v3 + 168), v5);
  std::vector<unsigned short>::resize(*((_QWORD *)this + 2) + 192, v5);
}

_QWORD *OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateEdgeFacesFromParentFaces(_QWORD *this)
{
  int *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _DWORD *v16;
  int v17;
  unsigned int v18;
  int v19;
  int v20;
  uint64_t v21;
  _DWORD *v22;
  _WORD *v23;
  int v24;
  uint64_t v25;

  v1 = (int *)this[1];
  if (*v1 >= 1)
  {
    v2 = 0;
    v3 = this[11];
    v4 = this[15];
    v5 = this[13];
    v6 = this[18];
    do
    {
      if (*(_DWORD *)(v3 + 8 * v2) != 4)
        OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateEdgeFacesFromParentFaces();
      if (*(_DWORD *)(v5 + 8 * v2) != 3)
        OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateEdgeFacesFromParentFaces();
      v7 = 0;
      v8 = (8 * v2) | 4;
      v9 = v4 + 4 * *(int *)(v3 + v8);
      v10 = v6 + 4 * *(int *)(v5 + v8);
      v11 = *(_DWORD *)(v9 + 12);
      v12 = 1;
      do
      {
        v13 = *(int *)(v10 + v7);
        if ((_DWORD)v13 != -1)
        {
          v14 = this[2];
          v15 = *(_QWORD *)(v14 + 144);
          v16 = (_DWORD *)(v15 + 8 * v13);
          *v16 = 2;
          if ((_DWORD)v13)
            v17 = *(v16 - 1) + *(v16 - 2);
          else
            v17 = 0;
          v18 = v12 % 3;
          v19 = 2 * v13;
          v16[1] = v17;
          v20 = *(_DWORD *)(v14 + 16);
          if (v20 <= 2)
            v20 = 2;
          *(_DWORD *)(v14 + 16) = v20;
          v21 = *(int *)(v15 + 4 * (v19 | 1));
          v22 = (_DWORD *)(*(_QWORD *)(v14 + 168) + 4 * v21);
          v23 = (_WORD *)(*(_QWORD *)(v14 + 192) + 2 * v21);
          v24 = *(_DWORD *)(v9 + v7);
          if (v24 == -1)
          {
            v25 = 0;
          }
          else
          {
            *v22 = v24;
            *v23 = v18;
            v25 = 1;
          }
          if (v11 != -1)
          {
            v22[v25] = v11;
            v23[v25] = v18;
            LODWORD(v25) = v25 + 1;
          }
          *v16 = v25;
        }
        ++v12;
        v7 += 4;
      }
      while (v7 != 12);
      ++v2;
    }
    while (v2 < *v1);
  }
  return this;
}

_QWORD *OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateEdgeFacesFromParentEdges(_QWORD *this)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  _DWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _DWORD *v12;
  char v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _DWORD *v18;
  int v19;
  int v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int *v29;
  unsigned __int16 *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _BOOL4 v35;
  uint64_t v36;
  unsigned int v37;
  unsigned int v38;
  int v39;

  v1 = this[1];
  v2 = *(_DWORD *)(v1 + 4);
  if (v2 >= 1)
  {
    v3 = 0;
    v4 = this[24];
    do
    {
      v5 = (_DWORD *)(v4 + 8 * v3);
      if (*v5 != -1 || v5[1] != -1)
      {
        v6 = 0;
        v7 = *(_QWORD *)(v1 + 144);
        v8 = *(int *)(v7 + ((8 * v3) | 4));
        v9 = *(unsigned int *)(v7 + 8 * v3);
        v10 = *(_QWORD *)(v1 + 168) + 4 * v8;
        v11 = *(_QWORD *)(v1 + 192) + 2 * v8;
        v12 = (_DWORD *)(*(_QWORD *)(v1 + 120) + 8 * v3);
        v13 = 1;
        do
        {
          v14 = v13;
          v15 = (int)v5[v6];
          if ((_DWORD)v15 != -1)
          {
            v16 = this[2];
            v17 = *(_QWORD *)(v16 + 144);
            v18 = (_DWORD *)(v17 + 8 * v15);
            *v18 = v9;
            if ((_DWORD)v15)
              v19 = *(v18 - 1) + *(v18 - 2);
            else
              v19 = 0;
            v18[1] = v19;
            v20 = *(_DWORD *)(v16 + 16);
            if (v20 <= (int)v9)
              v20 = v9;
            *(_DWORD *)(v16 + 16) = v20;
            if ((int)v9 < 1)
            {
              v21 = 0;
            }
            else
            {
              v21 = 0;
              v22 = *(int *)(v17 + 4 * (int)((2 * v15) | 1));
              v23 = *(_QWORD *)(v16 + 168) + 4 * v22;
              v24 = *(_QWORD *)(v16 + 192) + 2 * v22;
              v25 = *(_QWORD *)(v1 + 24);
              v26 = this[11];
              v27 = this[15];
              v28 = v9;
              v29 = (int *)v10;
              v30 = (unsigned __int16 *)v11;
              do
              {
                v32 = *v29++;
                v31 = v32;
                LODWORD(v32) = *v30++;
                v33 = v32;
                v34 = (2 * v31) | 1;
                v35 = v6;
                if (*v12 != v12[1])
                  v35 = *(_DWORD *)(*(_QWORD *)(v1 + 48) + 4 * *(int *)(v25 + 4 * v34) + 4 * v33) != v12[v6];
                v36 = v27 + 4 * *(int *)(v26 + 4 * v34);
                v37 = v35 + v33;
                if (v37 == *(_DWORD *)(v25 + 8 * (_DWORD)v31))
                  v38 = 0;
                else
                  v38 = v37;
                v39 = *(_DWORD *)(v36 + 4 * v38);
                if (v39 != -1)
                {
                  *(_DWORD *)(v23 + 4 * v21) = v39;
                  *(_WORD *)(v24 + 2 * v21++) = v33;
                }
                --v28;
              }
              while (v28);
            }
            *v18 = v21;
          }
          v13 = 0;
          v6 = 1;
        }
        while ((v14 & 1) != 0);
        v2 = *(_DWORD *)(v1 + 4);
      }
      ++v3;
    }
    while (v3 < v2);
  }
  return this;
}

void OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateVertexFaceRelation(OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement *this)
{
  int v2;
  uint64_t v3;
  int *v4;
  std::vector<unsigned int>::size_type v5;

  v2 = ((*(_QWORD *)(*((_QWORD *)this + 1) + 296) - *(_QWORD *)(*((_QWORD *)this + 1) + 288)) >> 2)
     + 3 * ((*(_QWORD *)(*((_QWORD *)this + 1) + 176) - *(_QWORD *)(*((_QWORD *)this + 1) + 168)) >> 2);
  std::vector<int>::resize((std::vector<unsigned int> *)(*((_QWORD *)this + 2) + 264), 2 * *(int *)(*((_QWORD *)this + 2) + 8));
  std::vector<int>::resize((std::vector<unsigned int> *)(*((_QWORD *)this + 2) + 288), v2);
  std::vector<unsigned short>::resize(*((_QWORD *)this + 2) + 312, v2);
  if (*((_DWORD *)this + 21))
  {
    OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateVertexFacesFromParentEdges(this);
    OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateVertexFacesFromParentVertices(this);
  }
  else
  {
    OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateVertexFacesFromParentVertices(this);
    OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateVertexFacesFromParentEdges(this);
  }
  v3 = *((_QWORD *)this + 2);
  v4 = (int *)(*(_QWORD *)(v3 + 264) + 4 * (2 * *(_DWORD *)(v3 + 8) - 2));
  v5 = v4[1] + (uint64_t)*v4;
  std::vector<int>::resize((std::vector<unsigned int> *)(v3 + 288), v5);
  std::vector<unsigned short>::resize(*((_QWORD *)this + 2) + 312, v5);
}

_QWORD *OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateVertexFacesFromParentVertices(_QWORD *this)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _DWORD *v12;
  int v13;
  int v14;
  int *v15;
  unsigned __int16 *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int16 v23;
  int v24;

  v1 = this[1];
  v2 = *(_DWORD *)(v1 + 8);
  if (v2 >= 1)
  {
    v3 = 0;
    v4 = this[30];
    do
    {
      v5 = *(int *)(v4 + 4 * v3);
      if ((_DWORD)v5 != -1)
      {
        v6 = *(_QWORD *)(v1 + 288);
        v7 = (unsigned int *)(*(_QWORD *)(v1 + 264) + 8 * v3);
        v8 = *v7;
        v9 = (int)v7[1];
        v10 = *(_QWORD *)(v1 + 312);
        v11 = (_QWORD *)this[2];
        v12 = (_DWORD *)(v11[33] + 8 * v5);
        *v12 = v8;
        if ((_DWORD)v5)
          v13 = *(v12 - 1) + *(v12 - 2);
        else
          v13 = 0;
        v12[1] = v13;
        if ((int)v8 < 1)
        {
          v14 = 0;
        }
        else
        {
          v14 = 0;
          v15 = (int *)(v6 + 4 * v9);
          v16 = (unsigned __int16 *)(v10 + 2 * v9);
          v17 = v11[36] + 4 * v13;
          v18 = v11[39] + 2 * v13;
          v19 = this[11];
          v20 = this[15];
          do
          {
            v22 = *v15++;
            v21 = v22;
            LODWORD(v22) = *v16++;
            v23 = v22;
            v24 = *(_DWORD *)(v20 + 4 * *(int *)(v19 + 8 * v21 + 4) + 4 * v22);
            if (v24 != -1)
            {
              *(_DWORD *)(v17 + 4 * v14) = v24;
              *(_WORD *)(v18 + 2 * v14++) = v23;
            }
            --v8;
          }
          while (v8);
        }
        *v12 = v14;
        v2 = *(_DWORD *)(v1 + 8);
      }
      ++v3;
    }
    while (v3 < v2);
  }
  return this;
}

_QWORD *OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateVertexFacesFromParentEdges(_QWORD *this)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _DWORD *v12;
  int v13;
  int v14;
  int *v15;
  unsigned __int16 *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unsigned int v24;
  unsigned int v25;
  uint64_t v26;
  int v27;
  int v28;
  int v29;

  v1 = this[1];
  v2 = *(_DWORD *)(v1 + 4);
  if (v2 >= 1)
  {
    v3 = 0;
    v4 = this[27];
    do
    {
      v5 = *(int *)(v4 + 4 * v3);
      if ((_DWORD)v5 != -1)
      {
        v6 = *(_QWORD *)(v1 + 168);
        v7 = (unsigned int *)(*(_QWORD *)(v1 + 144) + 8 * v3);
        v8 = *v7;
        v9 = (int)v7[1];
        v10 = *(_QWORD *)(v1 + 192);
        v11 = (_QWORD *)this[2];
        v12 = (_DWORD *)(v11[33] + 8 * v5);
        *v12 = 2 * v8;
        if ((_DWORD)v5)
          v13 = *(v12 - 1) + *(v12 - 2);
        else
          v13 = 0;
        v12[1] = v13;
        if ((int)v8 < 1)
        {
          v14 = 0;
        }
        else
        {
          v14 = 0;
          v15 = (int *)(v6 + 4 * v9);
          v16 = (unsigned __int16 *)(v10 + 2 * v9);
          v17 = v11[36] + 4 * v13;
          v18 = v11[39] + 2 * v13;
          v19 = this[11];
          v20 = this[15];
          do
          {
            v22 = *v15++;
            v21 = v22;
            if (*(_DWORD *)(v19 + 8 * (_DWORD)v22) != 4)
              OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateVertexFacesFromParentEdges();
            v24 = *v16++;
            v23 = v24;
            v25 = v24 + 1 - 3 * ((1431655766 * (unint64_t)(v24 + 1)) >> 32);
            v26 = v20 + 4 * *(int *)(v19 + 8 * v21 + 4);
            v27 = *(_DWORD *)(v26 + 4 * v25);
            if (v27 != -1)
            {
              *(_DWORD *)(v17 + 4 * v14) = v27;
              *(_WORD *)(v18 + 2 * v14++) = v23;
            }
            v28 = *(_DWORD *)(v26 + 12);
            if (v28 != -1)
            {
              *(_DWORD *)(v17 + 4 * v14) = v28;
              *(_WORD *)(v18 + 2 * v14++) = v23
                                            + 2
                                            - 3 * ((1431655766 * (unint64_t)(v23 + 2)) >> 32);
            }
            v29 = *(_DWORD *)(v26 + 4 * v23);
            if (v29 != -1)
            {
              *(_DWORD *)(v17 + 4 * v14) = v29;
              *(_WORD *)(v18 + 2 * v14++) = v25;
            }
            --v8;
          }
          while (v8);
        }
        *v12 = v14;
        v2 = *(_DWORD *)(v1 + 4);
      }
      ++v3;
    }
    while (v3 < v2);
  }
  return this;
}

void OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateVertexEdgeRelation(OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement *this)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  int *v5;
  std::vector<unsigned int>::size_type v6;

  v2 = *((_QWORD *)this + 1);
  v3 = ((*(_QWORD *)(v2 + 368) - *(_QWORD *)(v2 + 360)) >> 2)
     + 2 * (*(_DWORD *)(v2 + 4) + ((*(_QWORD *)(v2 + 176) - *(_QWORD *)(v2 + 168)) >> 2));
  std::vector<int>::resize((std::vector<unsigned int> *)(*((_QWORD *)this + 2) + 336), 2 * *(int *)(*((_QWORD *)this + 2) + 8));
  std::vector<int>::resize((std::vector<unsigned int> *)(*((_QWORD *)this + 2) + 360), v3);
  std::vector<unsigned short>::resize(*((_QWORD *)this + 2) + 384, v3);
  if (*((_DWORD *)this + 21))
  {
    OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateVertexEdgesFromParentEdges(this);
    OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateVertexEdgesFromParentVertices(this);
  }
  else
  {
    OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateVertexEdgesFromParentVertices(this);
    OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateVertexEdgesFromParentEdges(this);
  }
  v4 = *((_QWORD *)this + 2);
  v5 = (int *)(*(_QWORD *)(v4 + 336) + 4 * (2 * *(_DWORD *)(v4 + 8) - 2));
  v6 = v5[1] + (uint64_t)*v5;
  std::vector<int>::resize((std::vector<unsigned int> *)(v4 + 360), v6);
  std::vector<unsigned short>::resize(*((_QWORD *)this + 2) + 384, v6);
}

_QWORD *OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateVertexEdgesFromParentVertices(_QWORD *this)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _DWORD *v13;
  int v14;
  int v15;
  int v16;
  int *v17;
  unsigned __int16 *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;

  v1 = this[1];
  v2 = *(_DWORD *)(v1 + 8);
  if (v2 >= 1)
  {
    v3 = 0;
    v4 = this[30];
    do
    {
      v5 = *(int *)(v4 + 4 * v3);
      if ((_DWORD)v5 != -1)
      {
        v6 = *(_QWORD *)(v1 + 360);
        v7 = (unsigned int *)(*(_QWORD *)(v1 + 336) + 8 * v3);
        v8 = *v7;
        v9 = (int)v7[1];
        v10 = *(_QWORD *)(v1 + 384);
        v11 = this[2];
        v12 = *(_QWORD *)(v11 + 336);
        v13 = (_DWORD *)(v12 + 8 * v5);
        *v13 = v8;
        if ((_DWORD)v5)
          v14 = *(v13 - 1) + *(v13 - 2);
        else
          v14 = 0;
        v13[1] = v14;
        v15 = *(_DWORD *)(v11 + 20);
        if (v15 <= (int)v8)
          v15 = v8;
        *(_DWORD *)(v11 + 20) = v15;
        if ((int)v8 < 1)
        {
          v16 = 0;
        }
        else
        {
          v16 = 0;
          v17 = (int *)(v6 + 4 * v9);
          v18 = (unsigned __int16 *)(v10 + 2 * v9);
          v19 = *(int *)(v12 + 4 * (int)((2 * v5) | 1));
          v20 = *(_QWORD *)(v11 + 360) + 4 * v19;
          v21 = *(_QWORD *)(v11 + 384) + 2 * v19;
          v22 = this[24];
          do
          {
            v23 = *v17++;
            v24 = v22 + 8 * v23;
            LODWORD(v23) = *v18++;
            v25 = *(_DWORD *)(v24 + 4 * v23);
            if (v25 != -1)
            {
              *(_DWORD *)(v20 + 4 * v16) = v25;
              *(_WORD *)(v21 + 2 * v16++) = 1;
            }
            --v8;
          }
          while (v8);
        }
        *v13 = v16;
        v2 = *(_DWORD *)(v1 + 8);
      }
      ++v3;
    }
    while (v3 < v2);
  }
  return this;
}

_QWORD *OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateVertexEdgesFromParentEdges(_QWORD *this)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  _DWORD *v15;
  int v16;
  uint64_t v17;
  BOOL v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  _DWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  int v34;
  int v35;

  v1 = this[1];
  v2 = *(_DWORD *)(v1 + 4);
  if (v2 >= 1)
  {
    v3 = 0;
    v4 = this[27];
    do
    {
      v5 = *(int *)(v4 + 4 * v3);
      if ((_DWORD)v5 != -1)
      {
        v6 = *(_QWORD *)(v1 + 168);
        v7 = *(unsigned int *)(*(_QWORD *)(v1 + 144) + 8 * v3);
        v8 = *(int *)(*(_QWORD *)(v1 + 144) + 8 * v3 + 4);
        v9 = *(_QWORD *)(v1 + 192);
        v10 = *(_QWORD *)(v1 + 120);
        v11 = this[24];
        v12 = this[2];
        v13 = v7 + 2;
        v14 = *(_QWORD *)(v12 + 336);
        v15 = (_DWORD *)(v14 + 8 * v5);
        *v15 = v7 + 2;
        if ((_DWORD)v5)
          v16 = *(v15 - 1) + *(v15 - 2);
        else
          v16 = 0;
        v15[1] = v16;
        if (*(_DWORD *)(v12 + 20) > v13)
          v13 = *(_DWORD *)(v12 + 20);
        *(_DWORD *)(v12 + 20) = v13;
        if ((int)v7 < 1)
        {
          v19 = 0;
        }
        else
        {
          v17 = 0;
          v18 = 0;
          v19 = 0;
          v20 = v6 + 4 * v8;
          v21 = v9 + 2 * v8;
          v22 = (_DWORD *)(v10 + 8 * v3);
          v23 = v11 + 8 * v3;
          v24 = *(int *)(v14 + 4 * (int)((2 * v5) | 1));
          v25 = *(_QWORD *)(v12 + 360) + 4 * v24;
          v26 = *(_QWORD *)(v12 + 384) + 2 * v24;
          v27 = this[13];
          v28 = this[18];
          v29 = -1;
          do
          {
            v30 = *(unsigned __int16 *)(v21 + 2 * v17);
            v31 = (2 * *(int *)(v20 + 4 * v17)) | 1;
            v32 = v28 + 4 * *(int *)(v27 + 4 * v31);
            if (v17)
            {
              v33 = *(_DWORD *)(v32
                              + 4
                              * (v30
                                             + 1
                                             - 3 * ((1431655766 * (unint64_t)(v30 + 1)) >> 32)));
              v34 = *(_DWORD *)(v32 + 4 * v30);
            }
            else
            {
              if (*v22 != v22[1])
                v18 = *(_DWORD *)(*(_QWORD *)(v1 + 48) + 4 * *(int *)(*(_QWORD *)(v1 + 24) + 4 * v31) + 4 * v30) != *v22;
              v35 = *(_DWORD *)(v23 + 4 * !v18);
              v29 = *(_DWORD *)(v23 + 4 * v18);
              v33 = *(_DWORD *)(v32
                              + 4
                              * (v30
                                             + 1
                                             - 3 * ((1431655766 * (unint64_t)(v30 + 1)) >> 32)));
              v34 = *(_DWORD *)(v32 + 4 * v30);
              if (v35 != -1)
              {
                *(_DWORD *)(v25 + 4 * v19) = v35;
                *(_WORD *)(v26 + 2 * v19++) = 0;
              }
            }
            if (v33 != -1)
            {
              *(_DWORD *)(v25 + 4 * v19) = v33;
              *(_WORD *)(v26 + 2 * v19++) = 1;
            }
            if (v34 != -1)
            {
              *(_DWORD *)(v25 + 4 * v19) = v34;
              *(_WORD *)(v26 + 2 * v19++) = 0;
            }
            if (!v17 && v29 != -1)
            {
              *(_DWORD *)(v25 + 4 * v19) = v29;
              *(_WORD *)(v26 + 2 * v19++) = 0;
            }
            ++v17;
          }
          while (v7 != v17);
        }
        *v15 = v19;
        v2 = *(_DWORD *)(v1 + 4);
      }
      ++v3;
    }
    while (v3 < v2);
  }
  return this;
}

_QWORD *OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::markSparseFaceChildren(_QWORD *this)
{
  int *v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  _DWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int *v11;
  int v12;
  uint64_t v13;

  if (this[52] == this[51])
    OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::markSparseFaceChildren();
  v1 = (int *)this[1];
  if (*v1 >= 1)
  {
    v2 = 0;
    v3 = 0;
    *(_QWORD *)&v4 = 0x200000002;
    *((_QWORD *)&v4 + 1) = 0x200000002;
    do
    {
      v5 = (_DWORD *)(this[11] + v2);
      if (*v5 != 4)
        OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::markSparseFaceChildren();
      v6 = this[13];
      if (*(_DWORD *)(v6 + v2) != 3)
        OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::markSparseFaceChildren();
      v7 = this[15] + 4 * (int)v5[1];
      v8 = this[18] + 4 * *(int *)(v6 + v2 + 4);
      v9 = this[51];
      if ((*(_BYTE *)(v9 + v3) & 1) != 0)
      {
        *(_OWORD *)v7 = v4;
        *(_DWORD *)v8 = 2;
        *(_QWORD *)(v8 + 4) = 0x200000002;
        *(_BYTE *)(v9 + v3) &= 0xE1u;
      }
      else
      {
        v10 = *(int *)(*((_QWORD *)v1 + 3) + v2 + 4);
        v11 = (int *)(*((_QWORD *)v1 + 6) + 4 * v10);
        if ((*(_BYTE *)(this[57] + v11[1]) & 1)
           + (*(_BYTE *)(this[57] + *v11) & 1)
           + (*(_BYTE *)(this[57] + v11[2]) & 1))
        {
          v12 = *(_BYTE *)(this[54] + *(int *)(*((_QWORD *)v1 + 9) + 4 * v10 + 4)) & 0xE | (*(unsigned __int8 *)(this[54] + *(int *)(*((_QWORD *)v1 + 9) + 4 * v10)) >> 1) & 0xF | (2 * *(unsigned __int8 *)(this[54] + *(int *)(*((_QWORD *)v1 + 9) + 4 * v10 + 8))) & 0xC;
          *(_BYTE *)(v9 + v3) = *(_BYTE *)(v9 + v3) & 0xE1 | (2 * v12);
          if (v12)
          {
            *(_DWORD *)(v7 + 12) = 1;
            *(_DWORD *)v8 = 1;
            *(_QWORD *)(v8 + 4) = 0x100000001;
          }
          v13 = this[57];
          if ((*(_BYTE *)(v13 + *v11) & 1) != 0)
          {
            *(_DWORD *)v7 = 1;
            *(_DWORD *)v8 = 1;
          }
          if ((*(_BYTE *)(v13 + v11[1]) & 1) != 0)
          {
            *(_DWORD *)(v7 + 4) = 1;
            *(_DWORD *)(v8 + 4) = 1;
          }
          if ((*(_BYTE *)(v13 + v11[2]) & 1) != 0)
          {
            *(_DWORD *)(v7 + 8) = 1;
            *(_DWORD *)(v8 + 8) = 1;
          }
        }
      }
      ++v3;
      v1 = (int *)this[1];
      v2 += 8;
    }
    while (v3 < *v1);
  }
  return this;
}

void OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateFaceVerticesFromParentFaces()
{
  __assert_rtn("populateFaceVerticesFromParentFaces", "triRefinement.cpp", 149, "pFaceChildren.size() == 4");
}

{
  __assert_rtn("populateFaceVerticesFromParentFaces", "triRefinement.cpp", 148, "pFaceVerts.size() == 3");
}

void OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateFaceEdgesFromParentFaces()
{
  __assert_rtn("populateFaceEdgesFromParentFaces", "triRefinement.cpp", 226, "pFaceChildEdges.size() == 3");
}

{
  __assert_rtn("populateFaceEdgesFromParentFaces", "triRefinement.cpp", 225, "pFaceChildFaces.size() == 4");
}

void OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateEdgeVerticesFromParentFaces()
{
  __assert_rtn("populateEdgeVerticesFromParentFaces", "triRefinement.cpp", 296, "pFaceChildEdges.size() == 3");
}

{
  __assert_rtn("populateEdgeVerticesFromParentFaces", "triRefinement.cpp", 295, "pFaceEdges.size() == 3");
}

void OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateEdgeFacesFromParentFaces()
{
  __assert_rtn("populateEdgeFacesFromParentFaces", "triRefinement.cpp", 394, "pFaceChildEdges.size() == 3");
}

{
  __assert_rtn("populateEdgeFacesFromParentFaces", "triRefinement.cpp", 393, "pFaceChildFaces.size() == 4");
}

void OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateVertexFacesFromParentEdges()
{
  __assert_rtn("populateVertexFacesFromParentEdges", "triRefinement.cpp", 579, "pFaceChildFaces.size() == 4");
}

void OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::markSparseFaceChildren()
{
  __assert_rtn("markSparseFaceChildren", "triRefinement.cpp", 842, "_parentFaceTag.size() > 0");
}

{
  __assert_rtn("markSparseFaceChildren", "triRefinement.cpp", 866, "fChildEdges.size() == 3");
}

{
  __assert_rtn("markSparseFaceChildren", "triRefinement.cpp", 865, "fChildFaces.size() == 4");
}

void OpenSubdiv::v3_1_1::Osd::MTLPatchShaderSource::GetCommonShaderSource(std::string *a1@<X8>)
{
  void **v3;
  std::string::size_type v4;
  std::string *v5;
  __int128 v6;
  void *__p[2];
  unsigned __int8 v8;
  std::string v9;

  std::string::basic_string[abi:nn180100]<0>(&v9, "#define OSD_METAL_IOS 1\n");
  std::string::basic_string[abi:nn180100]<0>(__p, aLine0OsdMtlpat);
  if ((v8 & 0x80u) == 0)
    v3 = __p;
  else
    v3 = (void **)__p[0];
  if ((v8 & 0x80u) == 0)
    v4 = v8;
  else
    v4 = (std::string::size_type)__p[1];
  v5 = std::string::append(&v9, (const std::string::value_type *)v3, v4);
  if (SHIBYTE(v5->__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(a1, v5->__r_.__value_.__l.__data_, v5->__r_.__value_.__l.__size_);
  }
  else
  {
    v6 = *(_OWORD *)&v5->__r_.__value_.__l.__data_;
    a1->__r_.__value_.__r.__words[2] = v5->__r_.__value_.__r.__words[2];
    *(_OWORD *)&a1->__r_.__value_.__l.__data_ = v6;
  }
  if ((char)v8 < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v9.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v9.__r_.__value_.__l.__data_);
}

void sub_1DCFB6F94(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t OpenSubdiv::v3_1_1::Osd::MTLPatchShaderSource::GetPatchBasisShaderSource(OpenSubdiv::v3_1_1::Osd::MTLPatchShaderSource *this)
{
  void **v1;
  uint64_t v2;
  void *__p[2];
  unsigned __int8 v5;
  _BYTE v6[16];
  _QWORD v7[33];

  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:nn180100]((uint64_t)v6);
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v7, (uint64_t)"#define OSD_PATCH_BASIS_METAL 1\n", 32);
  std::string::basic_string[abi:nn180100]<0>(__p, aCopyright2016P);
  if ((v5 & 0x80u) == 0)
    v1 = __p;
  else
    v1 = (void **)__p[0];
  if ((v5 & 0x80u) == 0)
    v2 = v5;
  else
    v2 = (uint64_t)__p[1];
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v7, (uint64_t)v1, v2);
  if ((char)v5 < 0)
    operator delete(__p[0]);
  std::stringbuf::str();
  return std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)v6);
}

void sub_1DCFB7074(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  if (a14 < 0)
    operator delete(__p);
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

_QWORD *OpenSubdiv::v3_1_1::Osd::GetPatchTypeDefine@<X0>(int a1@<W0>, _QWORD *a2@<X8>)
{
  int v2;

  v2 = a1 - 2;
  if ((a1 - 2) >= 8 || ((0xF7u >> v2) & 1) == 0)
    OpenSubdiv::v3_1_1::Osd::GetPatchTypeDefine();
  return std::string::basic_string[abi:nn180100]<0>(a2, off_1EA5A5860[v2]);
}

_QWORD *OpenSubdiv::v3_1_1::Osd::GetPatchTypeSource@<X0>(int a1@<W0>, _QWORD *a2@<X8>)
{
  int v2;

  v2 = a1 - 2;
  if ((a1 - 2) >= 8 || ((0xF7u >> v2) & 1) == 0)
    OpenSubdiv::v3_1_1::Osd::GetPatchTypeSource();
  return std::string::basic_string[abi:nn180100]<0>(a2, *((char **)&off_1EA5A58A0 + v2));
}

uint64_t OpenSubdiv::v3_1_1::Osd::MTLPatchShaderSource::GetHullShaderSource(int a1)
{
  std::string *p_p;
  std::string::size_type size;
  std::string *v4;
  std::string::size_type v5;
  std::string *v6;
  std::string::size_type v7;
  std::string __p;
  _BYTE v10[16];
  _QWORD v11[33];

  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:nn180100]((uint64_t)v10);
  OpenSubdiv::v3_1_1::Osd::GetPatchTypeDefine(a1, &__p);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  else
    size = __p.__r_.__value_.__l.__size_;
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v11, (uint64_t)p_p, size);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  OpenSubdiv::v3_1_1::Osd::MTLPatchShaderSource::GetCommonShaderSource(&__p);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v4 = &__p;
  else
    v4 = (std::string *)__p.__r_.__value_.__r.__words[0];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v5 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  else
    v5 = __p.__r_.__value_.__l.__size_;
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v11, (uint64_t)v4, v5);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  OpenSubdiv::v3_1_1::Osd::GetPatchTypeSource(a1, &__p);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v6 = &__p;
  else
    v6 = (std::string *)__p.__r_.__value_.__r.__words[0];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v7 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  else
    v7 = __p.__r_.__value_.__l.__size_;
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v11, (uint64_t)v6, v7);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  std::stringbuf::str();
  return std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)v10);
}

void sub_1DCFB723C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

void OpenSubdiv::v3_1_1::Osd::GetPatchTypeDefine()
{
  __assert_rtn("GetPatchTypeDefine", "mtlPatchShaderSource.mm", 77, "\"Unknown Far::PatchDescriptor::Type\" && 0");
}

void OpenSubdiv::v3_1_1::Osd::GetPatchTypeSource()
{
  __assert_rtn("GetPatchTypeSource", "mtlPatchShaderSource.mm", 92, "\"Unknown Far::PatchDescriptor::Type\" && 0");
}

OpenSubdiv::v3_1_1::Far::EndCapBSplineBasisPatchFactory *OpenSubdiv::v3_1_1::Far::EndCapBSplineBasisPatchFactory::EndCapBSplineBasisPatchFactory(OpenSubdiv::v3_1_1::Far::EndCapBSplineBasisPatchFactory *this, const OpenSubdiv::v3_1_1::Far::TopologyRefiner *a2, OpenSubdiv::v3_1_1::Far::StencilTable *a3, OpenSubdiv::v3_1_1::Far::StencilTable *a4)
{
  unint64_t v4;
  uint64_t v7;
  std::vector<int>::size_type v8;
  int v9;
  int v10;
  uint64_t v11;

  *(_QWORD *)this = a3;
  *((_QWORD *)this + 1) = a4;
  *((_QWORD *)this + 2) = a2;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  v4 = *((unsigned __int8 *)a2 + 8);
  if ((v4 & 1) != 0)
    OpenSubdiv::v3_1_1::Far::EndCapBSplineBasisPatchFactory::EndCapBSplineBasisPatchFactory();
  v7 = **(int **)(*((_QWORD *)a2 + 11) + 24 * ((v4 >> 2) & 0xF));
  v8 = 7 * v7;
  v9 = 112 * v7;
  if (v9 >= 104857600)
    v10 = 104857600;
  else
    v10 = v9;
  std::vector<unsigned int>::reserve((std::vector<int> *)((char *)a3 + 16), v8);
  std::vector<unsigned int>::reserve((std::vector<int> *)((char *)a3 + 64), v10);
  std::vector<float>::reserve((void **)a3 + 11, v10);
  v11 = *((_QWORD *)this + 1);
  if (v11)
  {
    std::vector<unsigned int>::reserve((std::vector<int> *)(v11 + 16), v8);
    std::vector<unsigned int>::reserve((std::vector<int> *)(v11 + 64), v8);
    std::vector<float>::reserve((void **)(v11 + 88), v8);
  }
  return this;
}

uint64_t OpenSubdiv::v3_1_1::Far::EndCapBSplineBasisPatchFactory::GetPatchPoints(uint64_t a1, _QWORD *a2, int a3, __int16 *a4, unsigned int a5, unsigned int a6)
{
  uint64_t v8;
  int32x4_t *v9;
  int v10;
  unint64_t v11;
  int v12;
  __int16 v14;
  __int16 v15;

  v8 = a2[3];
  v9 = (int32x4_t *)(a2[6] + 4 * *(int *)(v8 + 8 * a3 + 4));
  v10 = *(_DWORD *)(v8 + 8 * a3);
  if ((a6 & 0x80000000) == 0)
    return OpenSubdiv::v3_1_1::Far::EndCapBSplineBasisPatchFactory::getPatchPointsFromGregoryBasis(a1);
  v11 = 0;
  v12 = -1;
  do
  {
    v14 = *(_WORD *)(a2[54] + 2 * v9->i32[v11]);
    if ((v14 & 0x780) != 0x80 || (v15 = *a4) != 0)
      LOBYTE(v15) = 1;
    if ((v14 & 2) != 0)
    {
      if (v12 < 0)
        v12 = v11;
      else
        LOBYTE(v15) = 1;
    }
    if (v11 > 2)
      break;
    ++v11;
    a4 += 3;
  }
  while ((v15 & 1) == 0);
  if ((v15 & 1) == 0)
    return OpenSubdiv::v3_1_1::Far::EndCapBSplineBasisPatchFactory::getPatchPoints(a1, (uint64_t)a2, a3, v12, v9, v10, a5, a6);
  else
    return OpenSubdiv::v3_1_1::Far::EndCapBSplineBasisPatchFactory::getPatchPointsFromGregoryBasis(a1);
}

uint64_t OpenSubdiv::v3_1_1::Far::EndCapBSplineBasisPatchFactory::getPatchPointsFromGregoryBasis(uint64_t a1)
{
  int v1;
  double v2;
  int v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  OpenSubdiv::v3_1_1::Far::TopologyRefiner *v8;
  int NumFVarValuesTotal;
  int v10;
  _QWORD *v11;
  int v12;
  char *v13;
  int v14;
  char *v15;
  char *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  char *v22;
  int v23;
  unsigned int v24;
  uint64_t **v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t i;
  float v33;
  uint64_t v34;
  uint64_t j;
  uint64_t v36;
  char *v37;
  OpenSubdiv::v3_1_1::Far::StencilTable *v38;
  uint64_t v39;
  uint64_t v40;
  float v41;
  uint64_t k;
  int v43;
  _QWORD *v44;
  char *v45;
  unint64_t v46;
  _DWORD *v47;
  char *v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  unint64_t v52;
  char *v53;
  char *v54;
  int v55;
  int v56;
  _QWORD *v57;
  char *v58;
  unint64_t v59;
  _DWORD *v60;
  char *v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  unint64_t v65;
  char *v66;
  char *v67;
  int v68;
  _QWORD *v69;
  char *v70;
  unint64_t v71;
  _DWORD *v72;
  char *v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  unint64_t v77;
  char *v78;
  char *v79;
  int v80;
  uint64_t v81;
  uint64_t v82;
  unint64_t v83;
  uint64_t v84;
  uint64_t *v85;
  uint64_t *v86;
  uint64_t m;
  _BYTE *v88;
  uint64_t n;
  _BYTE *v90;
  uint64_t ii;
  _BYTE *v92;
  uint64_t v93;
  _BYTE *v94;
  uint64_t v95;
  int v97;
  uint64_t v98;
  _BYTE v99[16];
  int v100;
  uint64_t v101;
  uint64_t v102;
  _BYTE v103[352];
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  _BYTE v111[352];
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  _BYTE v115[1776];
  _BYTE v116[344];
  void *__p;
  uint64_t *v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  _QWORD v122[18];

  v2 = MEMORY[0x1E0C80A78](a1);
  v4 = v3;
  v98 = v5;
  v7 = v6;
  v122[16] = *MEMORY[0x1E0C80C00];
  v8 = *(OpenSubdiv::v3_1_1::Far::TopologyRefiner **)(v6 + 16);
  if (v1 < 0)
    NumFVarValuesTotal = *((_DWORD *)v8 + 5);
  else
    NumFVarValuesTotal = OpenSubdiv::v3_1_1::Far::TopologyRefiner::GetNumFVarValuesTotal(v8, v1);
  v97 = v4;
  v10 = 0;
  v11 = (_QWORD *)(v7 + 48);
  v12 = *(_DWORD *)(v7 + 24);
  v13 = *(char **)(v7 + 40);
  do
  {
    v14 = v12 + NumFVarValuesTotal;
    if ((unint64_t)v13 >= *v11)
    {
      v16 = *(char **)(v7 + 32);
      v17 = (v13 - v16) >> 2;
      v18 = v17 + 1;
      if ((unint64_t)(v17 + 1) >> 62)
LABEL_105:
        abort();
      v19 = *v11 - (_QWORD)v16;
      if (v19 >> 1 > v18)
        v18 = v19 >> 1;
      if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFFCLL)
        v20 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v20 = v18;
      if (v20)
      {
        v21 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<float>>(v7 + 48, v20);
        v16 = *(char **)(v7 + 32);
        v13 = *(char **)(v7 + 40);
      }
      else
      {
        v21 = 0;
      }
      v22 = &v21[4 * v17];
      *(_DWORD *)v22 = v14;
      v15 = v22 + 4;
      while (v13 != v16)
      {
        v23 = *((_DWORD *)v13 - 1);
        v13 -= 4;
        *((_DWORD *)v22 - 1) = v23;
        v22 -= 4;
      }
      *(_QWORD *)(v7 + 32) = v22;
      *(_QWORD *)(v7 + 40) = v15;
      *(_QWORD *)(v7 + 48) = &v21[4 * v20];
      if (v16)
        operator delete(v16);
    }
    else
    {
      *(_DWORD *)v13 = v14;
      v15 = v13 + 4;
    }
    *(_QWORD *)(v7 + 40) = v15;
    v12 = *(_DWORD *)(v7 + 24) + 1;
    *(_DWORD *)(v7 + 24) = v12;
    ++v10;
    v13 = v15;
  }
  while (v10 != 16);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::ProtoBasis::ProtoBasis(v99, v2);
  v122[0] = v99;
  v122[1] = &v104;
  v122[2] = &v109;
  v122[3] = &v101;
  v122[4] = &v108;
  v122[5] = &v112;
  v122[6] = &v113;
  v122[7] = &v105;
  v122[8] = &v107;
  v122[9] = v115;
  v122[10] = &v114;
  v122[11] = &v110;
  v122[12] = v103;
  v122[13] = v111;
  v122[14] = &v106;
  v122[15] = &v102;
  v24 = v100;
  v25 = &v118;
  v118 = &v120;
  v119 = 0x1000000010;
  v26 = 16;
  v121 = 0;
  do
  {
    *((_DWORD *)v25 + 4) = 0;
    v25[3] = (uint64_t *)(v25 + 5);
    v25[45] = 0;
    v25[4] = (uint64_t *)0x2800000028;
    v25 += 44;
    --v26;
  }
  while (v26);
  v27 = 0;
  v28 = (char *)&unk_1DD02D578;
  do
  {
    v29 = 0;
    v30 = 4 * v27;
    v31 = v122;
    do
    {
      OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::Clear((void **)&v118[44 * v29 + 44 * v30], v24);
      for (i = 0; i != 16; i += 4)
      {
        v33 = *(float *)&v28[i];
        if (v33 != 0.0)
          OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)&v118[44 * v29 + 44 * v30], (const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v31[i], v33);
      }
      ++v29;
      ++v31;
    }
    while (v29 != 4);
    ++v27;
    v28 += 16;
  }
  while (v27 != 4);
  v34 = 0;
  for (j = 0; j != 4; ++j)
  {
    v36 = 0;
    v37 = (char *)&unk_1DD02D578;
    do
    {
      OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::Point((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v116, v24);
      v39 = 0;
      v40 = v34;
      do
      {
        v41 = *(float *)&v37[v39];
        if (v41 != 0.0)
          OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v116, (const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)((char *)v118 + v40), v41);
        v40 += 352;
        v39 += 4;
      }
      while (v39 != 16);
      OpenSubdiv::v3_1_1::Far::GregoryBasis::AppendToStencilTable((OpenSubdiv::v3_1_1::Far::GregoryBasis *)v116, *(const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point **)v7, v38);
      operator delete(__p);
      ++v36;
      v37 += 16;
    }
    while (v36 != 4);
    v34 += 1408;
  }
  if (*(_QWORD *)(v7 + 8))
  {
    for (k = 0; k != 16; ++k)
    {
      v43 = *(_DWORD *)(v98 + 4 * dword_1DD02D5B8[k]);
      v44 = *(_QWORD **)(v7 + 8);
      v45 = (char *)v44[3];
      v46 = v44[4];
      if ((unint64_t)v45 >= v46)
      {
        v48 = (char *)v44[2];
        v49 = (v45 - v48) >> 2;
        v50 = v49 + 1;
        if ((unint64_t)(v49 + 1) >> 62)
          goto LABEL_105;
        v51 = v46 - (_QWORD)v48;
        if (v51 >> 1 > v50)
          v50 = v51 >> 1;
        if ((unint64_t)v51 >= 0x7FFFFFFFFFFFFFFCLL)
          v52 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v52 = v50;
        if (v52)
        {
          v53 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<float>>((uint64_t)(v44 + 4), v52);
          v48 = (char *)v44[2];
          v45 = (char *)v44[3];
        }
        else
        {
          v53 = 0;
        }
        v54 = &v53[4 * v49];
        *(_DWORD *)v54 = 1;
        v47 = v54 + 4;
        while (v45 != v48)
        {
          v55 = *((_DWORD *)v45 - 1);
          v45 -= 4;
          *((_DWORD *)v54 - 1) = v55;
          v54 -= 4;
        }
        v44[2] = v54;
        v44[3] = v47;
        v44[4] = &v53[4 * v52];
        if (v48)
          operator delete(v48);
      }
      else
      {
        *(_DWORD *)v45 = 1;
        v47 = v45 + 4;
      }
      v56 = v43 + v97;
      v44[3] = v47;
      v57 = *(_QWORD **)(v7 + 8);
      v58 = (char *)v57[9];
      v59 = v57[10];
      if ((unint64_t)v58 >= v59)
      {
        v61 = (char *)v57[8];
        v62 = (v58 - v61) >> 2;
        v63 = v62 + 1;
        if ((unint64_t)(v62 + 1) >> 62)
          goto LABEL_105;
        v64 = v59 - (_QWORD)v61;
        if (v64 >> 1 > v63)
          v63 = v64 >> 1;
        if ((unint64_t)v64 >= 0x7FFFFFFFFFFFFFFCLL)
          v65 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v65 = v63;
        if (v65)
        {
          v66 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<float>>((uint64_t)(v57 + 10), v65);
          v61 = (char *)v57[8];
          v58 = (char *)v57[9];
        }
        else
        {
          v66 = 0;
        }
        v67 = &v66[4 * v62];
        *(_DWORD *)v67 = v56;
        v60 = v67 + 4;
        while (v58 != v61)
        {
          v68 = *((_DWORD *)v58 - 1);
          v58 -= 4;
          *((_DWORD *)v67 - 1) = v68;
          v67 -= 4;
        }
        v57[8] = v67;
        v57[9] = v60;
        v57[10] = &v66[4 * v65];
        if (v61)
          operator delete(v61);
      }
      else
      {
        *(_DWORD *)v58 = v56;
        v60 = v58 + 4;
      }
      v57[9] = v60;
      v69 = *(_QWORD **)(v7 + 8);
      v70 = (char *)v69[12];
      v71 = v69[13];
      if ((unint64_t)v70 >= v71)
      {
        v73 = (char *)v69[11];
        v74 = (v70 - v73) >> 2;
        v75 = v74 + 1;
        if ((unint64_t)(v74 + 1) >> 62)
          goto LABEL_105;
        v76 = v71 - (_QWORD)v73;
        if (v76 >> 1 > v75)
          v75 = v76 >> 1;
        if ((unint64_t)v76 >= 0x7FFFFFFFFFFFFFFCLL)
          v77 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v77 = v75;
        if (v77)
        {
          v78 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<float>>((uint64_t)(v69 + 13), v77);
          v73 = (char *)v69[11];
          v70 = (char *)v69[12];
        }
        else
        {
          v78 = 0;
        }
        v79 = &v78[4 * v74];
        *(_DWORD *)v79 = 1065353216;
        v72 = v79 + 4;
        while (v70 != v73)
        {
          v80 = *((_DWORD *)v70 - 1);
          v70 -= 4;
          *((_DWORD *)v79 - 1) = v80;
          v79 -= 4;
        }
        v69[11] = v79;
        v69[12] = v72;
        v69[13] = &v78[4 * v77];
        if (v73)
          operator delete(v73);
      }
      else
      {
        *(_DWORD *)v70 = 1065353216;
        v72 = v70 + 4;
      }
      v69[12] = v72;
    }
  }
  v81 = *(int *)(v7 + 28);
  *(_DWORD *)(v7 + 28) = v81 + 1;
  v82 = *(_QWORD *)(v7 + 32);
  if ((_DWORD)v119)
  {
    v83 = 0;
    v84 = 43;
    do
    {
      v85 = &v118[v84];
      v86 = &v118[v84 - 42];
      operator delete((void *)v118[v84]);
      *v86 = (uint64_t)(v85 - 40);
      *((_DWORD *)v85 - 81) = 40;
      ++v83;
      v84 += 44;
    }
    while (v83 < v119);
  }
  operator delete(v121);
  for (m = 0; m != -1408; m -= 352)
  {
    v88 = &v99[m];
    operator delete(*(void **)&v115[m + 1752]);
    *((_QWORD *)v88 + 837) = &v115[m + 1432];
    *((_DWORD *)v88 + 1677) = 40;
  }
  for (n = 0; n != -1408; n -= 352)
  {
    v90 = &v99[n];
    operator delete(*(void **)&v115[n + 344]);
    *((_QWORD *)v90 + 661) = &v115[n + 24];
    *((_DWORD *)v90 + 1325) = 40;
  }
  for (ii = 0; ii != -1408; ii -= 352)
  {
    v92 = &v99[ii];
    operator delete(*(void **)&v111[ii + 344]);
    *((_QWORD *)v92 + 485) = v92 + 3896;
    *((_DWORD *)v92 + 973) = 40;
  }
  v93 = 1408;
  do
  {
    v94 = &v99[v93];
    operator delete(*(void **)&v103[v93 + 344]);
    *((_QWORD *)v94 + 133) = v94 + 1080;
    *((_DWORD *)v94 + 269) = 40;
    v93 -= 352;
  }
  while (v93);
  v95 = 1408;
  do
  {
    operator delete(*(void **)&v99[v95 - 8]);
    *(_QWORD *)&v99[v95 - 344] = &v99[v95 - 328];
    *(_DWORD *)&v99[v95 - 332] = 40;
    v95 -= 352;
  }
  while (v95);
  return v82 + (v81 << 6);
}

uint64_t OpenSubdiv::v3_1_1::Far::EndCapBSplineBasisPatchFactory::getPatchPoints(uint64_t a1, uint64_t a2, int a3, int a4, int32x4_t *a5, int a6, unsigned int a7, unsigned int a8)
{
  unsigned int v16;
  int v17;
  uint64_t v18;
  _DWORD *v19;
  uint64_t v20;
  _DWORD *v21;
  uint64_t v22;
  _DWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _DWORD *v38;
  char IndexIn4Tuple;
  char v40;
  uint64_t v41;
  _DWORD *v42;
  unsigned int v43;
  int *v44;
  int v45;
  int v46;
  int v47;
  int v48;
  int v49;
  int v50;
  int v51;
  int v52;
  OpenSubdiv::v3_1_1::Far::StencilTable *v53;
  OpenSubdiv::v3_1_1::Far::TopologyRefiner *v54;
  int NumFVarValuesTotal;
  OpenSubdiv::v3_1_1::Far::GregoryBasis *v56;
  int v57;
  unsigned int v58;
  OpenSubdiv::v3_1_1::Far::GregoryBasis *v59;
  int v60;
  int v61;
  int v62;
  OpenSubdiv::v3_1_1::Far::StencilTable *v63;
  _QWORD *v64;
  int v65;
  int v66;
  int v67;
  int v68;
  OpenSubdiv::v3_1_1::Far::StencilTable *v69;
  _QWORD *v70;
  int v71;
  OpenSubdiv::v3_1_1::Far::StencilTable *v72;
  _QWORD *v73;
  OpenSubdiv::v3_1_1::Far::GregoryBasis *v74;
  int v75;
  OpenSubdiv::v3_1_1::Far::StencilTable *v76;
  _QWORD *v77;
  int v78;
  int v79;
  int v80;
  int v81;
  OpenSubdiv::v3_1_1::Far::StencilTable *v82;
  _QWORD *v83;
  int v84;
  OpenSubdiv::v3_1_1::Far::StencilTable *v85;
  _QWORD *v86;
  int v87;
  OpenSubdiv::v3_1_1::Far::StencilTable *v88;
  _QWORD *v89;
  uint64_t v90;
  _QWORD *v91;
  char *v92;
  uint64_t v93;
  char *v94;
  char *v95;
  uint64_t v96;
  unint64_t v97;
  uint64_t v98;
  unint64_t v99;
  char *v100;
  char *v101;
  int v102;
  uint64_t v103;
  uint64_t v104;
  int v106[2];
  int v107;
  int32x4_t *v108;
  int v109;
  __int32 v110;
  int v111[86];
  void *__p;
  _BYTE v113[344];
  void *v114;
  int v115[86];
  void *v116;
  int v117[86];
  void *v118;
  _BYTE v119[344];
  void *v120;
  int v121[86];
  void *v122;
  _QWORD v123[44];
  _OWORD v124[4];
  unsigned int v125;
  _DWORD *v126;
  void *v127;
  unsigned int v128;
  _DWORD *v129;
  void *v130;
  int v131;
  _DWORD *v132;
  void *v133;
  uint64_t v134;

  v134 = *MEMORY[0x1E0C80C00];
  v16 = 2 * *(_DWORD *)(a2 + 20) + 16;
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::Point((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)&v131, v16);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::Point((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)&v128, v16);
  v17 = OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::Point((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)&v125, v16);
  v109 = a4;
  v107 = a8;
  OpenSubdiv::v3_1_1::Far::EndCapBSplineBasisPatchFactory::computeLimitStencils(v17, (OpenSubdiv::v3_1_1::Vtr::internal::Level *)a2, (uint64_t)a5, a6, a4, a8, (OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)&v131, (int *)&v128, (int *)&v125);
  v18 = v131;
  if (v131 >= 1)
  {
    v19 = v132;
    do
    {
      *v19 += a7;
      v19 += 2;
      --v18;
    }
    while (v18);
  }
  v20 = v128;
  if ((int)v128 >= 1)
  {
    v21 = v129;
    do
    {
      *v21 += a7;
      v21 += 2;
      --v20;
    }
    while (v20);
  }
  v22 = v125;
  if ((int)v125 >= 1)
  {
    v23 = v126;
    do
    {
      *v23 += a7;
      v23 += 2;
      --v22;
    }
    while (v22);
  }
  v24 = 0;
  v108 = a5;
  v25 = *(_QWORD *)(a2 + 24);
  v26 = *(int *)(v25 + 4 * ((2 * a3) | 1));
  v124[0] = vaddq_s32(*a5, vdupq_n_s32(a7));
  v27 = *(_QWORD *)(a2 + 48);
  v28 = v27 + 4 * v26;
  v29 = 4;
  do
  {
    v30 = *(int *)(v28 + 4 * v24);
    v31 = 2 * v30;
    v32 = *(_QWORD *)(a2 + 264);
    v33 = v32 + 8 * v30;
    v34 = *(_QWORD *)(a2 + 288) + 4 * *(int *)(v33 + 4);
    v35 = *(unsigned int *)(v32 + 4 * v31);
    v123[0] = v34;
    v123[1] = v35;
    v36 = *(_QWORD *)(a2 + 312) + 2 * *(int *)(v33 + 4);
    if (v24 == a4)
    {
      if ((int)v35 < 1)
      {
LABEL_16:
        LODWORD(v37) = -1;
      }
      else
      {
        v37 = 0;
        while (*(_DWORD *)(v34 + 4 * v37) != a3)
        {
          if (v35 == ++v37)
            goto LABEL_16;
        }
      }
      *((_DWORD *)v124 + v29) = *(_DWORD *)(v27
                                          + 4
                                          * *(int *)(v25 + 8 * *(int *)(v34 + 4 * (((int)v37 + 1) % (int)v35)) + 4)
                                          + 4
                                          * ((*(_WORD *)(v36 + 2 * (((int)v37 + 1) % (int)v35)) - 1) & 3))
                              + a7;
      v38 = (_DWORD *)(v27
                     + 4 * *(int *)(v25 + 8 * *(int *)(v34 + 4 * (((int)v35 + (int)v37 - 1) % (int)v35)) + 4)
                     + 4 * ((*(_WORD *)(v36 + 2 * (((int)v35 + (int)v37 - 1) % (int)v35)) + 1) & 3));
    }
    else
    {
      IndexIn4Tuple = OpenSubdiv::v3_1_1::Vtr::ConstArray<int>::FindIndexIn4Tuple((uint64_t)v123, a3);
      v40 = *(_WORD *)(v36 + 2 * ((IndexIn4Tuple + 2) & 3));
      v25 = *(_QWORD *)(a2 + 24);
      v27 = *(_QWORD *)(a2 + 48);
      v41 = v27 + 4 * *(int *)(v25 + 8 * *(int *)(v123[0] + 4 * ((IndexIn4Tuple + 2) & 3)) + 4);
      v42 = (_DWORD *)v124 + v29;
      v43 = *(_DWORD *)(v41 + 4 * ((v40 + 2) & 3)) + a7;
      *v42 = *(_DWORD *)(v41 + 4 * ((v40 + 1) & 3)) + a7;
      v42[1] = v43;
      v38 = (_DWORD *)(v41 + 4 * ((v40 - 1) & 3));
    }
    *((_DWORD *)v124 + v29 + 2) = *v38 + a7;
    v29 += 3;
    ++v24;
  }
  while (v24 != 4);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::Point((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v123, v16);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::Point((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v121, v16);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::Point((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v119, v16);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::Point((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v117, v16);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::Point((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v115, v16);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::Point((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v113, v16);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::Point((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v111, v16);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v121, (const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)&v128, 12.0);
  *(_QWORD *)v106 = a4;
  v44 = (int *)((char *)&OpenSubdiv::v3_1_1::Far::EndCapBSplineBasisPatchFactory::getPatchPoints(OpenSubdiv::v3_1_1::Vtr::internal::Level const*,int,int,OpenSubdiv::v3_1_1::Vtr::ConstArray<int>,int,int)::rotation
              + 64 * (uint64_t)a4);
  v45 = *((_DWORD *)v124 + *v44);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v121, v45, -5.3333);
  v46 = *((_DWORD *)v124 + v44[1]);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v121, v46, -2.6667);
  v47 = *((_DWORD *)v124 + v44[2]);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v121, v47, -0.66667);
  v48 = *((_DWORD *)v124 + v44[3]);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v121, v48, -1.3333);
  v49 = *((_DWORD *)v124 + v44[6]);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v121, v49, -0.33333);
  v50 = *((_DWORD *)v124 + v44[7]);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v121, v50, -0.66667);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v119, (const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)&v128, -6.0);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v119, v45, 2.6667);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v119, v46, 1.3333);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v119, v47, 0.33333);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v119, v48, 0.66667);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v119, v49, 0.66667);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v119, v50, 1.3333);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::operator=(v117, v121);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v117, *((_DWORD *)v124 + v44[8]), 1.0);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v117, v49, -1.0);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v115, (const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)&v125, 12.0);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v115, v45, -5.3333);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v115, v46, -1.3333);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v115, v47, -0.66667);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v115, v48, -2.6667);
  v51 = *((_DWORD *)v124 + v44[4]);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v115, v51, -0.33333);
  v52 = *((_DWORD *)v124 + v44[15]);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v115, v52, -0.66667);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v113, (const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)&v125, -6.0);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v113, v45, 2.6667);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v113, v46, 0.66667);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v113, v47, 0.33333);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v113, v48, 1.3333);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v113, v51, 0.66667);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v113, v52, 1.3333);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::operator=(v111, v115);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v111, *((_DWORD *)v124 + v44[14]), 1.0);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v111, v51, -1.0);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v123, (const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)&v131, 36.0);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v123, v45, -16.0);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v123, v46, -4.0);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v123, v48, -4.0);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v123, (const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v115, -4.0);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v123, (const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v121, -4.0);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v123, v47, -1.0);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v123, (const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v119, -1.0);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v123, (const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v113, -1.0);
  v54 = *(OpenSubdiv::v3_1_1::Far::TopologyRefiner **)(a1 + 16);
  if (v107 < 0)
    NumFVarValuesTotal = *((_DWORD *)v54 + 5);
  else
    NumFVarValuesTotal = OpenSubdiv::v3_1_1::Far::TopologyRefiner::GetNumFVarValuesTotal(v54, v107);
  v56 = (OpenSubdiv::v3_1_1::Far::GregoryBasis *)(v108->i32[v109] + a7);
  v57 = v109 + 1;
  v58 = (v109 + 1) & 3;
  v59 = (OpenSubdiv::v3_1_1::Far::GregoryBasis *)(v108->i32[v58] + a7);
  v60 = v109 + 3;
  v110 = v108->i32[(v109 + 3) & 3];
  v61 = *(_DWORD *)(a1 + 24);
  *(_DWORD *)(a1 + 24) = v61 + 1;
  v62 = 3 * v106[0];
  *((_DWORD *)&v124[1] + 3 * *(_QWORD *)v106 + 2) = v61 + NumFVarValuesTotal;
  OpenSubdiv::v3_1_1::Far::GregoryBasis::AppendToStencilTable((OpenSubdiv::v3_1_1::Far::GregoryBasis *)v121, *(const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point **)a1, v53);
  v64 = *(_QWORD **)(a1 + 8);
  if (v64)
    OpenSubdiv::v3_1_1::Far::GregoryBasis::AppendToStencilTable(v56, v64, v63);
  v65 = *(_DWORD *)(a1 + 24);
  *(_DWORD *)(a1 + 24) = v65 + 1;
  v66 = v65 + NumFVarValuesTotal;
  if (v57 <= 0)
    v67 = -(-v57 & 3);
  else
    v67 = v58;
  v68 = 3 * v67;
  *((_DWORD *)&v124[1] + 3 * v67) = v66;
  OpenSubdiv::v3_1_1::Far::GregoryBasis::AppendToStencilTable((OpenSubdiv::v3_1_1::Far::GregoryBasis *)v119, *(const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point **)a1, v63);
  v70 = *(_QWORD **)(a1 + 8);
  if (v70)
    OpenSubdiv::v3_1_1::Far::GregoryBasis::AppendToStencilTable(v59, v70, v69);
  v71 = *(_DWORD *)(a1 + 24);
  *(_DWORD *)(a1 + 24) = v71 + 1;
  *((_DWORD *)&v124[1] + v68 + 1) = v71 + NumFVarValuesTotal;
  OpenSubdiv::v3_1_1::Far::GregoryBasis::AppendToStencilTable((OpenSubdiv::v3_1_1::Far::GregoryBasis *)v117, *(const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point **)a1, v69);
  v73 = *(_QWORD **)(a1 + 8);
  if (v73)
    OpenSubdiv::v3_1_1::Far::GregoryBasis::AppendToStencilTable(v59, v73, v72);
  v74 = (OpenSubdiv::v3_1_1::Far::GregoryBasis *)(v110 + a7);
  v75 = *(_DWORD *)(a1 + 24);
  *(_DWORD *)(a1 + 24) = v75 + 1;
  *((_DWORD *)&v124[1] + v62) = v75 + NumFVarValuesTotal;
  OpenSubdiv::v3_1_1::Far::GregoryBasis::AppendToStencilTable((OpenSubdiv::v3_1_1::Far::GregoryBasis *)v115, *(const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point **)a1, v72);
  v77 = *(_QWORD **)(a1 + 8);
  if (v77)
    OpenSubdiv::v3_1_1::Far::GregoryBasis::AppendToStencilTable(v56, v77, v76);
  v78 = *(_DWORD *)(a1 + 24);
  *(_DWORD *)(a1 + 24) = v78 + 1;
  v79 = v78 + NumFVarValuesTotal;
  if (v60 <= 0)
    v80 = -(-v60 & 3);
  else
    v80 = v60 & 3;
  v81 = 3 * v80;
  *((_DWORD *)&v124[1] + 3 * v80 + 2) = v79;
  OpenSubdiv::v3_1_1::Far::GregoryBasis::AppendToStencilTable((OpenSubdiv::v3_1_1::Far::GregoryBasis *)v113, *(const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point **)a1, v76);
  v83 = *(_QWORD **)(a1 + 8);
  if (v83)
    OpenSubdiv::v3_1_1::Far::GregoryBasis::AppendToStencilTable(v74, v83, v82);
  v84 = *(_DWORD *)(a1 + 24);
  *(_DWORD *)(a1 + 24) = v84 + 1;
  *((_DWORD *)&v124[1] + v81 + 1) = v84 + NumFVarValuesTotal;
  OpenSubdiv::v3_1_1::Far::GregoryBasis::AppendToStencilTable((OpenSubdiv::v3_1_1::Far::GregoryBasis *)v111, *(const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point **)a1, v82);
  v86 = *(_QWORD **)(a1 + 8);
  if (v86)
    OpenSubdiv::v3_1_1::Far::GregoryBasis::AppendToStencilTable(v74, v86, v85);
  v87 = *(_DWORD *)(a1 + 24);
  *(_DWORD *)(a1 + 24) = v87 + 1;
  *((_DWORD *)&v124[1] + v62 + 1) = v87 + NumFVarValuesTotal;
  OpenSubdiv::v3_1_1::Far::GregoryBasis::AppendToStencilTable((OpenSubdiv::v3_1_1::Far::GregoryBasis *)v123, *(const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point **)a1, v85);
  v89 = *(_QWORD **)(a1 + 8);
  if (v89)
    OpenSubdiv::v3_1_1::Far::GregoryBasis::AppendToStencilTable(v56, v89, v88);
  v90 = 0;
  v91 = (_QWORD *)(a1 + 48);
  v92 = *(char **)(a1 + 40);
  do
  {
    v93 = OpenSubdiv::v3_1_1::Far::EndCapBSplineBasisPatchFactory::getPatchPoints(OpenSubdiv::v3_1_1::Vtr::internal::Level const*,int,int,OpenSubdiv::v3_1_1::Vtr::ConstArray<int>,int,int)::permuteRegular[v90];
    if ((unint64_t)v92 >= *v91)
    {
      v95 = *(char **)(a1 + 32);
      v96 = (v92 - v95) >> 2;
      v97 = v96 + 1;
      if ((unint64_t)(v96 + 1) >> 62)
        abort();
      v98 = *v91 - (_QWORD)v95;
      if (v98 >> 1 > v97)
        v97 = v98 >> 1;
      if ((unint64_t)v98 >= 0x7FFFFFFFFFFFFFFCLL)
        v99 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v99 = v97;
      if (v99)
      {
        v100 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<float>>(a1 + 48, v99);
        v95 = *(char **)(a1 + 32);
        v92 = *(char **)(a1 + 40);
      }
      else
      {
        v100 = 0;
      }
      v101 = &v100[4 * v96];
      *(_DWORD *)v101 = *((_DWORD *)v124 + v93);
      v94 = v101 + 4;
      while (v92 != v95)
      {
        v102 = *((_DWORD *)v92 - 1);
        v92 -= 4;
        *((_DWORD *)v101 - 1) = v102;
        v101 -= 4;
      }
      *(_QWORD *)(a1 + 32) = v101;
      *(_QWORD *)(a1 + 40) = v94;
      *(_QWORD *)(a1 + 48) = &v100[4 * v99];
      if (v95)
        operator delete(v95);
    }
    else
    {
      *(_DWORD *)v92 = *((_DWORD *)v124 + v93);
      v94 = v92 + 4;
    }
    *(_QWORD *)(a1 + 40) = v94;
    ++v90;
    v92 = v94;
  }
  while (v90 != 16);
  v103 = *(int *)(a1 + 28);
  *(_DWORD *)(a1 + 28) = v103 + 1;
  v104 = *(_QWORD *)(a1 + 32);
  operator delete(__p);
  operator delete(v114);
  operator delete(v116);
  operator delete(v118);
  operator delete(v120);
  operator delete(v122);
  operator delete((void *)v123[43]);
  operator delete(v127);
  operator delete(v130);
  operator delete(v133);
  return v104 + (v103 << 6);
}

void OpenSubdiv::v3_1_1::Far::GregoryBasis::AppendToStencilTable(OpenSubdiv::v3_1_1::Far::GregoryBasis *this, const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *a2, OpenSubdiv::v3_1_1::Far::StencilTable *a3)
{
  uint64_t v5;
  char *v6;
  unint64_t v7;
  char *v8;
  _DWORD *v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  char *v16;
  char *v17;
  int v18;
  uint64_t i;
  int v20;
  unint64_t v21;
  char *v22;
  _DWORD *v23;
  char *v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char *v29;
  char *v30;
  int v31;
  int v32;
  unint64_t v33;
  char *v34;
  _DWORD *v35;
  char *v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  char *v41;
  char *v42;
  int v43;

  v5 = *(unsigned int *)this;
  v6 = (char *)a2 + 32;
  v7 = *((_QWORD *)a2 + 4);
  v8 = (char *)*((_QWORD *)a2 + 3);
  if ((unint64_t)v8 >= v7)
  {
    v10 = (char *)*((_QWORD *)a2 + 2);
    v11 = (v8 - v10) >> 2;
    v12 = v11 + 1;
    if ((unint64_t)(v11 + 1) >> 62)
LABEL_53:
      abort();
    v13 = v7 - (_QWORD)v10;
    if (v13 >> 1 > v12)
      v12 = v13 >> 1;
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFFCLL)
      v14 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v14 = v12;
    if (v14)
    {
      v15 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<float>>((uint64_t)v6, v14);
      v10 = (char *)*((_QWORD *)a2 + 2);
      v8 = (char *)*((_QWORD *)a2 + 3);
    }
    else
    {
      v15 = 0;
    }
    v16 = &v15[4 * v11];
    v17 = &v15[4 * v14];
    *(_DWORD *)v16 = v5;
    v9 = v16 + 4;
    while (v8 != v10)
    {
      v18 = *((_DWORD *)v8 - 1);
      v8 -= 4;
      *((_DWORD *)v16 - 1) = v18;
      v16 -= 4;
    }
    *((_QWORD *)a2 + 2) = v16;
    *((_QWORD *)a2 + 3) = v9;
    *((_QWORD *)a2 + 4) = v17;
    if (v10)
      operator delete(v10);
  }
  else
  {
    *(_DWORD *)v8 = v5;
    v9 = v8 + 4;
  }
  *((_QWORD *)a2 + 3) = v9;
  if ((int)v5 >= 1)
  {
    for (i = 0; i != v5; ++i)
    {
      v20 = *(_DWORD *)(*((_QWORD *)this + 1) + 8 * i);
      v22 = (char *)*((_QWORD *)a2 + 9);
      v21 = *((_QWORD *)a2 + 10);
      if ((unint64_t)v22 >= v21)
      {
        v24 = (char *)*((_QWORD *)a2 + 8);
        v25 = (v22 - v24) >> 2;
        v26 = v25 + 1;
        if ((unint64_t)(v25 + 1) >> 62)
          goto LABEL_53;
        v27 = v21 - (_QWORD)v24;
        if (v27 >> 1 > v26)
          v26 = v27 >> 1;
        if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFFCLL)
          v28 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v28 = v26;
        if (v28)
        {
          v29 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<float>>((uint64_t)a2 + 80, v28);
          v24 = (char *)*((_QWORD *)a2 + 8);
          v22 = (char *)*((_QWORD *)a2 + 9);
        }
        else
        {
          v29 = 0;
        }
        v30 = &v29[4 * v25];
        *(_DWORD *)v30 = v20;
        v23 = v30 + 4;
        while (v22 != v24)
        {
          v31 = *((_DWORD *)v22 - 1);
          v22 -= 4;
          *((_DWORD *)v30 - 1) = v31;
          v30 -= 4;
        }
        *((_QWORD *)a2 + 8) = v30;
        *((_QWORD *)a2 + 9) = v23;
        *((_QWORD *)a2 + 10) = &v29[4 * v28];
        if (v24)
          operator delete(v24);
      }
      else
      {
        *(_DWORD *)v22 = v20;
        v23 = v22 + 4;
      }
      *((_QWORD *)a2 + 9) = v23;
      v32 = *(_DWORD *)(*((_QWORD *)this + 1) + 8 * i + 4);
      v34 = (char *)*((_QWORD *)a2 + 12);
      v33 = *((_QWORD *)a2 + 13);
      if ((unint64_t)v34 >= v33)
      {
        v36 = (char *)*((_QWORD *)a2 + 11);
        v37 = (v34 - v36) >> 2;
        v38 = v37 + 1;
        if ((unint64_t)(v37 + 1) >> 62)
          goto LABEL_53;
        v39 = v33 - (_QWORD)v36;
        if (v39 >> 1 > v38)
          v38 = v39 >> 1;
        if ((unint64_t)v39 >= 0x7FFFFFFFFFFFFFFCLL)
          v40 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v40 = v38;
        if (v40)
        {
          v41 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<float>>((uint64_t)a2 + 104, v40);
          v36 = (char *)*((_QWORD *)a2 + 11);
          v34 = (char *)*((_QWORD *)a2 + 12);
        }
        else
        {
          v41 = 0;
        }
        v42 = &v41[4 * v37];
        *(_DWORD *)v42 = v32;
        v35 = v42 + 4;
        while (v34 != v36)
        {
          v43 = *((_DWORD *)v34 - 1);
          v34 -= 4;
          *((_DWORD *)v42 - 1) = v43;
          v42 -= 4;
        }
        *((_QWORD *)a2 + 11) = v42;
        *((_QWORD *)a2 + 12) = v35;
        *((_QWORD *)a2 + 13) = &v41[4 * v40];
        if (v36)
          operator delete(v36);
      }
      else
      {
        *(_DWORD *)v34 = v32;
        v35 = v34 + 4;
      }
      *((_QWORD *)a2 + 12) = v35;
    }
  }
}

void OpenSubdiv::v3_1_1::Far::EndCapBSplineBasisPatchFactory::computeLimitStencils(int a1, OpenSubdiv::v3_1_1::Vtr::internal::Level *this, uint64_t a3, int a4, int a5, unsigned int a6, OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *a7, int *a8, int *a9)
{
  int v15;
  _BYTE *v16;
  unsigned int v17;
  int v18;
  int v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int v23;
  int v24;
  int v25;
  int *v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  float v33;
  float v34;
  uint64_t v35;
  uint64_t v36;
  float v37;
  uint64_t v38;
  int v39;
  int v40;
  int v41;
  int v42;
  __float2 v43;
  __float2 v44;
  __float2 v45;
  __float2 v46;
  int *v47;
  uint64_t v48;
  uint64_t v49;
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *v50;
  int v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  void *__p;
  void *v56[3];
  uint64_t v57;
  void *v58;
  void *v59[3];
  uint64_t v60;
  void *v61;
  int *v62;
  uint64_t v63;
  _BYTE v64[160];
  void *v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v15 = *((_DWORD *)this + 5);
  v16 = v64;
  v62 = (int *)v64;
  v63 = 0x2800000000;
  v65 = 0;
  v17 = 2 * v15;
  if (v15)
  {
    if (v17 < 0x29)
      goto LABEL_6;
    operator delete(0);
    v62 = (int *)v64;
    HIDWORD(v63) = 40;
    v16 = operator new(4 * v17);
    v65 = v16;
    v18 = v17;
  }
  else
  {
    operator delete(0);
    v18 = 40;
  }
  v62 = (int *)v16;
  HIDWORD(v63) = v18;
LABEL_6:
  LODWORD(v63) = v17;
  v19 = OpenSubdiv::v3_1_1::Vtr::internal::Level::gatherQuadRegularRingAroundVertex(this, *(_DWORD *)(a3 + 4 * a5), (int *)v16, a6);
  if ((v19 & 1) != 0)
    OpenSubdiv::v3_1_1::Far::EndCapBSplineBasisPatchFactory::computeLimitStencils();
  v47 = a8;
  if (v19 >= 0)
    v20 = v19;
  else
    v20 = v19 + 1;
  if (v19 < 2)
    goto LABEL_32;
  v21 = 0;
  v22 = (v20 >> 1);
  v23 = v19 + 1;
  v24 = a5 + 3 <= 0 ? -(-(a5 + 3) & 3) : (a5 + 3) & 3;
  v25 = a5 + 1 <= 0 ? -(-(a5 + 1) & 3) : (a5 + 1) & 3;
  v26 = v62;
  v27 = *(_DWORD *)(a3 + 4 * v25);
  v28 = *(_DWORD *)(a3 + 4 * v24);
  v29 = -1;
  v30 = -1;
  do
  {
    v32 = *v26;
    v26 += 2;
    v31 = v32;
    if (v32 == v27)
      v29 = v21;
    if (v31 == v28)
      v30 = v21;
    ++v21;
  }
  while (v22 != v21);
  if (v29 < 0 || v30 < 0)
LABEL_32:
    OpenSubdiv::v3_1_1::Far::EndCapBSplineBasisPatchFactory::computeLimitStencils();
  LODWORD(v59[0]) = 0;
  v59[1] = &v60;
  v61 = 0;
  v59[2] = (void *)0x2800000028;
  LODWORD(v56[0]) = 0;
  v56[1] = &v57;
  v58 = 0;
  v56[2] = (void *)0x2800000028;
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::Clear(v59, v23);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::Clear(v56, v23);
  v33 = (float)(int)v22;
  v34 = cosf(6.2832 / (float)(int)v22);
  v35 = 0;
  v49 = a3;
  v36 = 0;
  v37 = 1.0
      / (float)((float)((float)((float)(v34 + 5.0) + sqrtf((float)(v34 + 9.0) * (float)(v34 + 1.0))) * (float)(int)v22)
              * 0.0625);
  v48 = a5;
  v50 = a7;
  do
  {
    v38 = v36 + 1;
    if (v22 - 1 == v36)
      v39 = 0;
    else
      v39 = v36 + 1;
    v40 = v62[v35];
    v41 = v62[v35 + 1];
    v42 = v62[2 * v39];
    v51 = 0;
    v52 = &v54;
    __p = 0;
    v53 = 0x2800000004;
    OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)&v51, *(_DWORD *)(v49 + 4 * v48), v33 / (float)(v33 + 5.0));
    OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)&v51, v42, 2.0 / (float)(v33 + 5.0));
    OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)&v51, v40, 2.0 / (float)(v33 + 5.0));
    OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)&v51, v41, 1.0 / (float)((float)(int)v22 + 5.0));
    OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight(v50, (const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)&v51, 1.0 / v33);
    v43 = __sincosf_stret((float)((float)(int)v36 * 6.2832) / v33);
    v44 = __sincosf_stret((float)((float)v39 * 6.2832) / v33);
    OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v59, (const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)&v51, v37 * (float)((float)(v44.__cosval * 0.5) + (float)(v43.__cosval * 0.5)));
    OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v56, (const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)&v51, v37 * (float)((float)(v44.__sinval * 0.5) + (float)(v43.__sinval * 0.5)));
    operator delete(__p);
    v35 += 2;
    ++v36;
  }
  while (v22 != v38);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::operator=(v47, (int *)v50);
  v45 = __sincosf_stret((float)((float)v29 * 6.2832) / v33);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v47, (const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v59, v45.__cosval);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v47, (const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v56, v45.__sinval);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::operator=(a9, (int *)v50);
  v46 = __sincosf_stret((float)((float)v30 * 6.2832) / v33);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)a9, (const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v59, v46.__cosval);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)a9, (const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v56, v46.__sinval);
  operator delete(v58);
  operator delete(v61);
  operator delete(v65);
}

void OpenSubdiv::v3_1_1::Far::GregoryBasis::AppendToStencilTable(OpenSubdiv::v3_1_1::Far::GregoryBasis *this, _QWORD *a2, OpenSubdiv::v3_1_1::Far::StencilTable *a3)
{
  int v4;
  uint64_t v5;
  unint64_t v6;
  char *v7;
  _DWORD *v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  int v17;
  unint64_t v18;
  char *v19;
  _DWORD *v20;
  char *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char *v26;
  char *v27;
  char *v28;
  int v29;
  unint64_t v30;
  char *v31;
  _DWORD *v32;
  char *v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char *v38;
  char *v39;
  char *v40;
  int v41;

  v4 = (int)this;
  v5 = (uint64_t)(a2 + 4);
  v6 = a2[4];
  v7 = (char *)a2[3];
  if ((unint64_t)v7 >= v6)
  {
    v9 = (char *)a2[2];
    v10 = (v7 - v9) >> 2;
    v11 = v10 + 1;
    if ((unint64_t)(v10 + 1) >> 62)
      goto LABEL_50;
    v12 = v6 - (_QWORD)v9;
    if (v12 >> 1 > v11)
      v11 = v12 >> 1;
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFFCLL)
      v13 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v13 = v11;
    if (v13)
    {
      v14 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<float>>(v5, v13);
      v9 = (char *)a2[2];
      v7 = (char *)a2[3];
    }
    else
    {
      v14 = 0;
    }
    v15 = &v14[4 * v10];
    v16 = &v14[4 * v13];
    *(_DWORD *)v15 = 1;
    v8 = v15 + 4;
    while (v7 != v9)
    {
      v17 = *((_DWORD *)v7 - 1);
      v7 -= 4;
      *((_DWORD *)v15 - 1) = v17;
      v15 -= 4;
    }
    a2[2] = v15;
    a2[3] = v8;
    a2[4] = v16;
    if (v9)
      operator delete(v9);
  }
  else
  {
    *(_DWORD *)v7 = 1;
    v8 = v7 + 4;
  }
  v18 = a2[10];
  a2[3] = v8;
  v19 = (char *)a2[9];
  if ((unint64_t)v19 >= v18)
  {
    v21 = (char *)a2[8];
    v22 = (v19 - v21) >> 2;
    v23 = v22 + 1;
    if ((unint64_t)(v22 + 1) >> 62)
      goto LABEL_50;
    v24 = v18 - (_QWORD)v21;
    if (v24 >> 1 > v23)
      v23 = v24 >> 1;
    if ((unint64_t)v24 >= 0x7FFFFFFFFFFFFFFCLL)
      v25 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v25 = v23;
    if (v25)
    {
      v26 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<float>>((uint64_t)(a2 + 10), v25);
      v21 = (char *)a2[8];
      v19 = (char *)a2[9];
    }
    else
    {
      v26 = 0;
    }
    v27 = &v26[4 * v22];
    v28 = &v26[4 * v25];
    *(_DWORD *)v27 = v4;
    v20 = v27 + 4;
    while (v19 != v21)
    {
      v29 = *((_DWORD *)v19 - 1);
      v19 -= 4;
      *((_DWORD *)v27 - 1) = v29;
      v27 -= 4;
    }
    a2[8] = v27;
    a2[9] = v20;
    a2[10] = v28;
    if (v21)
      operator delete(v21);
  }
  else
  {
    *(_DWORD *)v19 = v4;
    v20 = v19 + 4;
  }
  v30 = a2[13];
  a2[9] = v20;
  v31 = (char *)a2[12];
  if ((unint64_t)v31 < v30)
  {
    *(_DWORD *)v31 = 1065353216;
    v32 = v31 + 4;
    goto LABEL_49;
  }
  v33 = (char *)a2[11];
  v34 = (v31 - v33) >> 2;
  v35 = v34 + 1;
  if ((unint64_t)(v34 + 1) >> 62)
LABEL_50:
    abort();
  v36 = v30 - (_QWORD)v33;
  if (v36 >> 1 > v35)
    v35 = v36 >> 1;
  if ((unint64_t)v36 >= 0x7FFFFFFFFFFFFFFCLL)
    v37 = 0x3FFFFFFFFFFFFFFFLL;
  else
    v37 = v35;
  if (v37)
  {
    v38 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<float>>((uint64_t)(a2 + 13), v37);
    v33 = (char *)a2[11];
    v31 = (char *)a2[12];
  }
  else
  {
    v38 = 0;
  }
  v39 = &v38[4 * v34];
  v40 = &v38[4 * v37];
  *(_DWORD *)v39 = 1065353216;
  v32 = v39 + 4;
  while (v31 != v33)
  {
    v41 = *((_DWORD *)v31 - 1);
    v31 -= 4;
    *((_DWORD *)v39 - 1) = v41;
    v39 -= 4;
  }
  a2[11] = v39;
  a2[12] = v32;
  a2[13] = v40;
  if (v33)
    operator delete(v33);
LABEL_49:
  a2[12] = v32;
}

OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::Point(OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *this, unsigned int a2)
{
  char *v4;
  int v5;

  *(_DWORD *)this = 0;
  v4 = (char *)this + 24;
  *((_QWORD *)this + 1) = (char *)this + 24;
  *((_QWORD *)this + 2) = 0x2800000000;
  *((_QWORD *)this + 43) = 0;
  if (!a2)
  {
    operator delete(0);
    v5 = 40;
    goto LABEL_5;
  }
  if (a2 >= 0x29)
  {
    operator delete(0);
    *((_QWORD *)this + 1) = v4;
    *((_DWORD *)this + 5) = 40;
    v4 = (char *)operator new(8 * a2);
    *((_QWORD *)this + 43) = v4;
    v5 = a2;
LABEL_5:
    *((_QWORD *)this + 1) = v4;
    *((_DWORD *)this + 5) = v5;
  }
  *((_DWORD *)this + 4) = a2;
  return this;
}

void OpenSubdiv::v3_1_1::Far::EndCapBSplineBasisPatchFactory::EndCapBSplineBasisPatchFactory()
{
  __assert_rtn("EndCapBSplineBasisPatchFactory", "endCapBSplineBasisPatchFactory.cpp", 59, "! refiner.IsUniform()");
}

void OpenSubdiv::v3_1_1::Far::EndCapBSplineBasisPatchFactory::computeLimitStencils()
{
  __assert_rtn("computeLimitStencils", "endCapBSplineBasisPatchFactory.cpp", 248, "start > -1 && prev > -1");
}

{
  __assert_rtn("computeLimitStencils", "endCapBSplineBasisPatchFactory.cpp", 234, "(ringSize & 1) == 0");
}

OpenSubdiv::v3_1_1::Far::EndCapGregoryBasisPatchFactory *OpenSubdiv::v3_1_1::Far::EndCapGregoryBasisPatchFactory::EndCapGregoryBasisPatchFactory(OpenSubdiv::v3_1_1::Far::EndCapGregoryBasisPatchFactory *this, const OpenSubdiv::v3_1_1::Far::TopologyRefiner *a2, OpenSubdiv::v3_1_1::Far::StencilTable *a3, OpenSubdiv::v3_1_1::Far::StencilTable *a4, char a5)
{
  unint64_t v5;
  uint64_t v8;
  std::vector<int>::size_type v9;
  int v10;
  int v11;
  uint64_t v12;

  *(_QWORD *)this = a3;
  *((_QWORD *)this + 1) = a4;
  *((_QWORD *)this + 2) = a2;
  *((_BYTE *)this + 24) = a5;
  *((_DWORD *)this + 7) = 0;
  *((_DWORD *)this + 8) = 0;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  v5 = *((unsigned __int8 *)a2 + 8);
  if ((v5 & 1) != 0)
    OpenSubdiv::v3_1_1::Far::EndCapGregoryBasisPatchFactory::EndCapGregoryBasisPatchFactory();
  v8 = **(int **)(*((_QWORD *)a2 + 11) + 24 * ((v5 >> 2) & 0xF));
  v9 = 20 * v8;
  v10 = 320 * v8;
  if (v10 >= 104857600)
    v11 = 104857600;
  else
    v11 = v10;
  std::vector<unsigned int>::reserve((std::vector<int> *)((char *)a3 + 16), v9);
  std::vector<unsigned int>::reserve((std::vector<int> *)((char *)a3 + 64), v11);
  std::vector<float>::reserve((void **)a3 + 11, v11);
  v12 = *((_QWORD *)this + 1);
  if (v12)
  {
    std::vector<unsigned int>::reserve((std::vector<int> *)(v12 + 16), v9);
    std::vector<unsigned int>::reserve((std::vector<int> *)(v12 + 64), v9);
    std::vector<float>::reserve((void **)(v12 + 88), v9);
  }
  return this;
}

uint64_t OpenSubdiv::v3_1_1::Far::EndCapGregoryBasisPatchFactory::addPatchBasis(uint64_t a1)
{
  double v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  OpenSubdiv::v3_1_1::Far::StencilTable *v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t i;
  _BYTE *v18;
  uint64_t j;
  _BYTE *v20;
  uint64_t k;
  _BYTE *v22;
  uint64_t v23;
  _BYTE *v24;
  uint64_t v25;
  _BYTE v27[7056];

  v1 = MEMORY[0x1E0C80A78](a1);
  v3 = v2;
  v5 = v4;
  OpenSubdiv::v3_1_1::Far::GregoryBasis::ProtoBasis::ProtoBasis(v27, v1);
  v7 = 0;
  v8 = (_BYTE *)(v3 + 2);
  v9 = 5632;
  v10 = 7040;
  v11 = 4224;
  do
  {
    if (*(v8 - 2))
    {
      OpenSubdiv::v3_1_1::Far::GregoryBasis::AppendToStencilTable((OpenSubdiv::v3_1_1::Far::GregoryBasis *)&v27[v7], *(const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point **)v5, v6);
      v12 = *(_QWORD **)(v5 + 8);
      if (v12)
        OpenSubdiv::v3_1_1::Far::GregoryBasis::AppendToStencilTable((OpenSubdiv::v3_1_1::Far::GregoryBasis *)*(unsigned int *)&v27[v10], v12, v6);
    }
    if (*(v8 - 1))
    {
      OpenSubdiv::v3_1_1::Far::GregoryBasis::AppendToStencilTable((OpenSubdiv::v3_1_1::Far::GregoryBasis *)&v27[v7 + 1408], *(const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point **)v5, v6);
      v13 = *(_QWORD **)(v5 + 8);
      if (v13)
        OpenSubdiv::v3_1_1::Far::GregoryBasis::AppendToStencilTable((OpenSubdiv::v3_1_1::Far::GregoryBasis *)*(unsigned int *)&v27[v10], v13, v6);
    }
    if (*v8)
    {
      OpenSubdiv::v3_1_1::Far::GregoryBasis::AppendToStencilTable((OpenSubdiv::v3_1_1::Far::GregoryBasis *)&v27[v7 + 2816], *(const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point **)v5, v6);
      v14 = *(_QWORD **)(v5 + 8);
      if (v14)
        OpenSubdiv::v3_1_1::Far::GregoryBasis::AppendToStencilTable((OpenSubdiv::v3_1_1::Far::GregoryBasis *)*(unsigned int *)&v27[v10], v14, v6);
    }
    if (v8[1])
    {
      OpenSubdiv::v3_1_1::Far::GregoryBasis::AppendToStencilTable((OpenSubdiv::v3_1_1::Far::GregoryBasis *)&v27[v11], *(const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point **)v5, v6);
      v15 = *(_QWORD **)(v5 + 8);
      if (v15)
        OpenSubdiv::v3_1_1::Far::GregoryBasis::AppendToStencilTable((OpenSubdiv::v3_1_1::Far::GregoryBasis *)*(unsigned int *)&v27[v10], v15, v6);
    }
    if (v8[2])
    {
      OpenSubdiv::v3_1_1::Far::GregoryBasis::AppendToStencilTable((OpenSubdiv::v3_1_1::Far::GregoryBasis *)&v27[v9], *(const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point **)v5, v6);
      v16 = *(_QWORD **)(v5 + 8);
      if (v16)
        OpenSubdiv::v3_1_1::Far::GregoryBasis::AppendToStencilTable((OpenSubdiv::v3_1_1::Far::GregoryBasis *)*(unsigned int *)&v27[v10], v16, v6);
    }
    v7 += 352;
    v8 += 5;
    v9 += 352;
    v10 += 4;
    v11 += 352;
  }
  while (v7 != 1408);
  for (i = 0; i != -1408; i -= 352)
  {
    v18 = &v27[i];
    operator delete(*(void **)&v27[i + 7032]);
    *((_QWORD *)v18 + 837) = &v27[i + 6712];
    *((_DWORD *)v18 + 1677) = 40;
  }
  for (j = 0; j != -1408; j -= 352)
  {
    v20 = &v27[j];
    operator delete(*(void **)&v27[j + 5624]);
    *((_QWORD *)v20 + 661) = &v27[j + 5304];
    *((_DWORD *)v20 + 1325) = 40;
  }
  for (k = 0; k != -1408; k -= 352)
  {
    v22 = &v27[k];
    operator delete(*(void **)&v27[k + 4216]);
    *((_QWORD *)v22 + 485) = v22 + 3896;
    *((_DWORD *)v22 + 973) = 40;
  }
  v23 = 1408;
  do
  {
    v24 = &v27[v23];
    operator delete(*(void **)&v27[v23 + 1400]);
    *((_QWORD *)v24 + 133) = v24 + 1080;
    *((_DWORD *)v24 + 269) = 40;
    v23 -= 352;
  }
  while (v23);
  v25 = 1408;
  do
  {
    operator delete(*(void **)&v27[v25 - 8]);
    *(_QWORD *)&v27[v25 - 344] = &v27[v25 - 328];
    *(_DWORD *)&v27[v25 - 332] = 40;
    v25 -= 352;
  }
  while (v25);
  return 1;
}

uint64_t OpenSubdiv::v3_1_1::Far::EndCapGregoryBasisPatchFactory::GetPatchPoints(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, unsigned int a6)
{
  int v9;
  _QWORD *v10;
  char *v11;
  char *v12;
  char *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  char *v19;
  int v20;
  uint64_t v21;
  OpenSubdiv::v3_1_1::Far::TopologyRefiner *v22;
  int NumFVarValuesTotal;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int IndexIn4Tuple;
  int v39;
  void *v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  int *v44;
  uint64_t i;
  uint64_t v46;
  int v47;
  unint64_t v48;
  int *v49;
  _DWORD *v50;
  int *v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  unint64_t v55;
  char *v56;
  int *v57;
  char *v58;
  int v59;
  uint64_t v60;
  _QWORD *v61;
  uint64_t v62;
  uint64_t j;
  char v64;
  int v67;
  int __key;
  _BYTE v69[4];
  _QWORD v70[4];

  v9 = 0;
  v70[3] = *MEMORY[0x1E0C80C00];
  v10 = (_QWORD *)(a1 + 56);
  v11 = *(char **)(a1 + 48);
  do
  {
    if ((unint64_t)v11 >= *v10)
    {
      v13 = *(char **)(a1 + 40);
      v14 = (v11 - v13) >> 2;
      v15 = v14 + 1;
      if ((unint64_t)(v14 + 1) >> 62)
        goto LABEL_70;
      v16 = *v10 - (_QWORD)v13;
      if (v16 >> 1 > v15)
        v15 = v16 >> 1;
      if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFFCLL)
        v17 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v17 = v15;
      if (v17)
      {
        v18 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<float>>((uint64_t)v10, v17);
        v13 = *(char **)(a1 + 40);
        v11 = *(char **)(a1 + 48);
      }
      else
      {
        v18 = 0;
      }
      v19 = &v18[4 * v14];
      *(_DWORD *)v19 = -1;
      v12 = v19 + 4;
      while (v11 != v13)
      {
        v20 = *((_DWORD *)v11 - 1);
        v11 -= 4;
        *((_DWORD *)v19 - 1) = v20;
        v19 -= 4;
      }
      *(_QWORD *)(a1 + 40) = v19;
      *(_QWORD *)(a1 + 48) = v12;
      *(_QWORD *)(a1 + 56) = &v18[4 * v17];
      if (v13)
        operator delete(v13);
    }
    else
    {
      *(_DWORD *)v11 = -1;
      v12 = v11 + 4;
    }
    *(_QWORD *)(a1 + 48) = v12;
    ++v9;
    v11 = v12;
  }
  while (v9 != 20);
  v21 = *(_QWORD *)(a1 + 40) + 80 * *(int *)(a1 + 32);
  v22 = *(OpenSubdiv::v3_1_1::Far::TopologyRefiner **)(a1 + 16);
  if ((a6 & 0x80000000) != 0)
    NumFVarValuesTotal = *((_DWORD *)v22 + 5);
  else
    NumFVarValuesTotal = OpenSubdiv::v3_1_1::Far::TopologyRefiner::GetNumFVarValuesTotal(v22, a6);
  if (!*(_BYTE *)(a1 + 24))
    goto LABEL_59;
  v24 = *(_QWORD *)(a2 + 24);
  if (*(_DWORD *)(v24 + 8 * a3) != 4)
    OpenSubdiv::v3_1_1::Far::EndCapGregoryBasisPatchFactory::GetPatchPoints();
  v25 = *(_QWORD *)(a2 + 72) + 4 * *(int *)(v24 + 8 * a3 + 4);
  v26 = *(_DWORD *)(a2 + 12);
  OpenSubdiv::v3_1_1::Vtr::internal::Level::getFaceETags((_QWORD *)a2, a3, v69, a6);
  v27 = 0;
  v67 = v26 << 28;
  v28 = (char *)&OpenSubdiv::v3_1_1::Far::EndCapGregoryBasisPatchFactory::GetPatchPoints(OpenSubdiv::v3_1_1::Vtr::internal::Level const*,int,OpenSubdiv::v3_1_1::Vtr::internal::Level::VSpan const*,int,int)::gregoryEdgeVerts;
  do
  {
    if ((v69[v27] & 2) != 0)
      goto LABEL_41;
    v29 = *(int *)(v25 + 4 * v27);
    v30 = *(_QWORD *)(a2 + 144);
    v31 = *(unsigned int *)(v30 + 8 * v29);
    if ((int)v31 < 1)
    {
LABEL_30:
      v34 = 0;
    }
    else
    {
      v32 = 0;
      v33 = *(_QWORD *)(a2 + 168) + 4 * *(int *)(v30 + 4 * (int)((2 * v29) | 1));
      while (*(_DWORD *)(v33 + 4 * v32) != a3)
      {
        if (v31 == ++v32)
          goto LABEL_30;
      }
      v34 = *(_DWORD *)(v33 + 4 * (((int)v32 + 1) % (int)v31));
    }
    if (v34 == -1 || v34 >= a3)
      goto LABEL_41;
    if (*(_QWORD *)(a1 + 64) == *(_QWORD *)(a1 + 72))
      break;
    v35 = *(_QWORD *)(a2 + 24);
    v36 = *(int *)(v35 + 8 * v34 + 4);
    v37 = *(unsigned int *)(v35 + 8 * v34);
    v70[0] = *(_QWORD *)(a2 + 72) + 4 * v36;
    v70[1] = v37;
    IndexIn4Tuple = OpenSubdiv::v3_1_1::Vtr::ConstArray<int>::FindIndexIn4Tuple((uint64_t)v70, v29);
    if (IndexIn4Tuple == -1)
      OpenSubdiv::v3_1_1::Far::EndCapGregoryBasisPatchFactory::GetPatchPoints();
    v39 = IndexIn4Tuple;
    __key = v34 | v67;
    v40 = bsearch(&__key, *(const void **)(a1 + 64), (uint64_t)(*(_QWORD *)(a1 + 72) - *(_QWORD *)(a1 + 64)) >> 2, 4uLL, (int (__cdecl *)(const void *, const void *))OpenSubdiv::v3_1_1::Far::EndCapGregoryBasisPatchFactory::GetPatchPoints(OpenSubdiv::v3_1_1::Vtr::internal::Level const*,int,OpenSubdiv::v3_1_1::Vtr::internal::Level::VSpan const*,int,int)::LevelAndFaceIndex::compare);
    if (!v40)
      break;
    v41 = *(_QWORD *)(a1 + 64);
    v42 = ((unint64_t)v40 - v41) >> 2;
    if ((v42 & 0x80000000) != 0 || (int)v42 >= (int)((unint64_t)(*(_QWORD *)(a1 + 72) - v41) >> 2))
      OpenSubdiv::v3_1_1::Far::EndCapGregoryBasisPatchFactory::GetPatchPoints();
    v43 = *(_QWORD *)(a1 + 40) + ((uint64_t)((unint64_t)(5 * v42) << 34) >> 30);
    v44 = (int *)((char *)&OpenSubdiv::v3_1_1::Far::EndCapGregoryBasisPatchFactory::GetPatchPoints(OpenSubdiv::v3_1_1::Vtr::internal::Level const*,int,OpenSubdiv::v3_1_1::Vtr::internal::Level::VSpan const*,int,int)::gregoryEdgeVerts
                + 16 * v39);
    for (i = 12; i != -4; i -= 4)
    {
      v46 = *v44++;
      *(_DWORD *)(v21 + 4 * *(int *)&v28[i]) = *(_DWORD *)(v43 + 4 * v46);
    }
LABEL_41:
    ++v27;
    v28 += 16;
  }
  while (v27 != 4);
  v47 = v67 | a3;
  v48 = *(_QWORD *)(a1 + 80);
  v49 = *(int **)(a1 + 72);
  if ((unint64_t)v49 < v48)
  {
    *v49 = v47;
    v50 = v49 + 1;
    goto LABEL_58;
  }
  v51 = *(int **)(a1 + 64);
  v52 = v49 - v51;
  v53 = v52 + 1;
  if ((unint64_t)(v52 + 1) >> 62)
LABEL_70:
    abort();
  v54 = v48 - (_QWORD)v51;
  if (v54 >> 1 > v53)
    v53 = v54 >> 1;
  if ((unint64_t)v54 >= 0x7FFFFFFFFFFFFFFCLL)
    v55 = 0x3FFFFFFFFFFFFFFFLL;
  else
    v55 = v53;
  if (v55)
  {
    v56 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<float>>(a1 + 80, v55);
    v51 = *(int **)(a1 + 64);
    v49 = *(int **)(a1 + 72);
  }
  else
  {
    v56 = 0;
  }
  v57 = (int *)&v56[4 * v52];
  v58 = &v56[4 * v55];
  *v57 = v47;
  v50 = v57 + 1;
  while (v49 != v51)
  {
    v59 = *--v49;
    *--v57 = v59;
  }
  *(_QWORD *)(a1 + 64) = v57;
  *(_QWORD *)(a1 + 72) = v50;
  *(_QWORD *)(a1 + 80) = v58;
  if (v51)
    operator delete(v51);
LABEL_58:
  *(_QWORD *)(a1 + 72) = v50;
LABEL_59:
  v60 = 0;
  v61 = v70;
  v62 = v21;
  do
  {
    for (j = 0; j != 5; ++j)
    {
      if (*(_DWORD *)(v62 + 4 * j) == -1)
      {
        *(_DWORD *)(v62 + 4 * j) = *(_DWORD *)(a1 + 28) + NumFVarValuesTotal;
        ++*(_DWORD *)(a1 + 28);
        v64 = 1;
      }
      else
      {
        v64 = 0;
      }
      *((_BYTE *)v61 + j) = v64;
    }
    ++v60;
    v61 = (_QWORD *)((char *)v61 + 5);
    v62 += 20;
  }
  while (v60 != 4);
  OpenSubdiv::v3_1_1::Far::EndCapGregoryBasisPatchFactory::addPatchBasis(a1);
  ++*(_DWORD *)(a1 + 32);
  return v21;
}

uint64_t OpenSubdiv::v3_1_1::Far::EndCapGregoryBasisPatchFactory::GetPatchPoints(OpenSubdiv::v3_1_1::Vtr::internal::Level const*,int,OpenSubdiv::v3_1_1::Vtr::internal::Level::VSpan const*,int,int)::LevelAndFaceIndex::compare(_DWORD *a1, _DWORD *a2)
{
  return (*a1 - *a2);
}

void OpenSubdiv::v3_1_1::Far::EndCapGregoryBasisPatchFactory::EndCapGregoryBasisPatchFactory()
{
  __assert_rtn("EndCapGregoryBasisPatchFactory", "endCapGregoryBasisPatchFactory.cpp", 53, "! refiner.IsUniform()");
}

void OpenSubdiv::v3_1_1::Far::EndCapGregoryBasisPatchFactory::GetPatchPoints()
{
  __assert_rtn("GetPatchPoints", "endCapGregoryBasisPatchFactory.cpp", 191, "aedge!=Vtr::INDEX_INVALID");
}

{
  __assert_rtn("GetPatchPoints", "endCapGregoryBasisPatchFactory.cpp", 205, "adjPatchIndex>=0 && adjPatchIndex<(int)_levelAndFaceIndices.size()");
}

{
  __assert_rtn("GetPatchPoints", "endCapGregoryBasisPatchFactory.cpp", 156, "fedges.size()==4");
}

void OpenSubdiv::v3_1_1::Vtr::internal::SparseSelector::selectFace(OpenSubdiv::v3_1_1::Vtr::internal::Refinement **this, int a2)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  int *v10;
  uint64_t v11;
  uint64_t v12;

  if (!*((_BYTE *)this + 8))
  {
    OpenSubdiv::v3_1_1::Vtr::internal::Refinement::initializeSparseSelectionTags(*this);
    *((_BYTE *)this + 8) = 1;
  }
  v4 = *((_QWORD *)*this + 51);
  if ((*(_BYTE *)(v4 + a2) & 1) == 0)
  {
    *(_BYTE *)(v4 + a2) |= 1u;
    v5 = (_QWORD *)*((_QWORD *)*this + 1);
    v6 = v5[3];
    v7 = *(unsigned int *)(v6 + 8 * a2);
    if ((int)v7 >= 1)
    {
      v8 = *(int *)(v6 + 8 * a2 + 4);
      v9 = (int *)(v5[9] + 4 * v8);
      v10 = (int *)(v5[6] + 4 * v8);
      do
      {
        v11 = *v9++;
        *(_BYTE *)(*((_QWORD *)*this + 54) + v11) |= 1u;
        v12 = *v10++;
        *(_BYTE *)(*((_QWORD *)*this + 57) + v12) |= 1u;
        --v7;
      }
      while (v7);
    }
  }
}

double OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::QuadRefinement(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  _QWORD *v4;
  double result;

  v4 = (_QWORD *)OpenSubdiv::v3_1_1::Vtr::internal::Refinement::Refinement(a1, a2, a3, a4);
  *v4 = &off_1EA5985D0;
  *(_QWORD *)&result = 0x400000000;
  *(_QWORD *)((char *)v4 + 28) = 0x400000000;
  return result;
}

void OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::~QuadRefinement(OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement *this)
{
  OpenSubdiv::v3_1_1::Vtr::internal::Refinement::~Refinement(this);
  JUMPOUT(0x1DF0D41C0);
}

void OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::allocateParentChildIndices(std::vector<int> *this)
{
  std::vector<int>::pointer end;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  std::vector<int>::size_type v6;
  std::vector<int>::size_type v7;
  std::vector<int>::size_type v8;
  int *v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  std::vector<int>::value_type __x;

  end = this->__end_;
  v3 = *((_QWORD *)end + 7) - *((_QWORD *)end + 6);
  v4 = *((_QWORD *)end + 10) - *((_QWORD *)end + 9);
  v5 = *((_QWORD *)end + 16) - *((_QWORD *)end + 15);
  v6 = *end;
  v7 = end[1];
  v8 = end[2];
  __x = 0;
  v9 = (int *)*((_QWORD *)end + 3);
  v10 = (*((_QWORD *)end + 4) - (_QWORD)v9) >> 2;
  this[3].__end_cap_.__value_ = v9;
  LODWORD(this[4].__begin_) = v10;
  v11 = (int *)*((_QWORD *)end + 3);
  v12 = (*((_QWORD *)end + 4) - (_QWORD)v11) >> 2;
  this[4].__end_ = v11;
  LODWORD(this[4].__end_cap_.__value_) = v12;
  std::vector<int>::resize(this + 5, (int)(v3 >> 2), &__x);
  std::vector<int>::resize(this + 6, (int)(v4 >> 2), &__x);
  std::vector<int>::resize(this + 8, (int)(v5 >> 2), &__x);
  std::vector<int>::resize(this + 7, v6, &__x);
  std::vector<int>::resize(this + 9, v7, &__x);
  std::vector<int>::resize(this + 10, v8, &__x);
}

_QWORD *OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateFaceVertexRelation(OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement *this)
{
  std::vector<unsigned int> *v2;

  v2 = (std::vector<unsigned int> *)*((_QWORD *)this + 2);
  if (v2[1].__end_ == v2[1].__begin_)
  {
    OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateFaceVertexCountsAndOffsets(this);
    v2 = (std::vector<unsigned int> *)*((_QWORD *)this + 2);
  }
  std::vector<int>::resize(v2 + 2, 4 * SLODWORD(v2->__begin_));
  return OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateFaceVerticesFromParentFaces(this);
}

void OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateFaceVertexCountsAndOffsets(OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement *this)
{
  int *v2;
  int v3;
  uint64_t v4;
  _DWORD *v5;

  std::vector<int>::resize((std::vector<unsigned int> *)(*((_QWORD *)this + 2) + 24), 2 * **((int **)this + 2));
  v2 = (int *)*((_QWORD *)this + 2);
  if (*v2 >= 1)
  {
    v3 = 0;
    v4 = 0;
    v5 = (_DWORD *)(*((_QWORD *)v2 + 3) + 4);
    do
    {
      *(v5 - 1) = 4;
      *v5 = v3;
      ++v4;
      v3 += 4;
      v5 += 2;
    }
    while (v4 < *v2);
  }
}

_QWORD *OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateFaceVerticesFromParentFaces(_QWORD *this)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  int v22;
  int v23;
  _DWORD *v24;
  uint64_t v25;
  int v26;

  v1 = this[1];
  v2 = *(_DWORD *)v1;
  if (*(int *)v1 >= 1)
  {
    v3 = 0;
    v4 = *(_QWORD *)(v1 + 24);
    v5 = *(_QWORD *)(v1 + 48);
    v6 = *(_QWORD *)(v1 + 72);
    v7 = this[11];
    v8 = this[15];
    do
    {
      v9 = *(unsigned int *)(v4 + 8 * v3);
      if ((int)v9 >= 1)
      {
        v10 = 0;
        v11 = (8 * v3) | 4;
        v12 = *(int *)(v4 + v11);
        v13 = v5 + 4 * v12;
        v14 = v6 + 4 * v12;
        v15 = v8 + 4 * *(int *)(v7 + v11);
        do
        {
          v16 = *(_DWORD *)(v15 + 4 * v10);
          if (v16 != -1)
          {
            if (v10)
              v17 = v10;
            else
              v17 = v9;
            v18 = *(_DWORD *)(this[21] + 4 * v3);
            LODWORD(v19) = v17 - 1;
            v20 = this[27];
            v21 = *(_DWORD *)(v20 + 4 * *(int *)(v14 + 4 * (v17 - 1)));
            v22 = *(_DWORD *)(this[30] + 4 * *(int *)(v13 + 4 * v10));
            v23 = *(_DWORD *)(v20 + 4 * *(int *)(v14 + 4 * v10));
            v24 = (_DWORD *)(*(_QWORD *)(this[2] + 48)
                           + 4 * *(int *)(*(_QWORD *)(this[2] + 24) + 4 * ((2 * v16) | 1)));
            if ((_DWORD)v9 == 4)
            {
              v19 = (int)v19;
              LODWORD(v25) = v17 - 2;
              if (!(_DWORD)v19)
                LODWORD(v25) = 3;
              v24[v10] = v22;
              if ((_DWORD)v25)
                v26 = v25 - 1;
              else
                v26 = 3;
              v24[v26] = v23;
              v25 = (int)v25;
            }
            else
            {
              *v24 = v22;
              v24[1] = v23;
              v25 = 2;
              v19 = 3;
            }
            v24[v25] = v18;
            v24[v19] = v21;
          }
          ++v10;
        }
        while (v9 != v10);
        v2 = *(_DWORD *)v1;
      }
      ++v3;
    }
    while (v3 < v2);
  }
  return this;
}

_QWORD *OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateFaceEdgeRelation(OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement *this)
{
  std::vector<unsigned int> *v2;

  v2 = (std::vector<unsigned int> *)*((_QWORD *)this + 2);
  if (v2[1].__end_ == v2[1].__begin_)
  {
    OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateFaceVertexCountsAndOffsets(this);
    v2 = (std::vector<unsigned int> *)*((_QWORD *)this + 2);
  }
  std::vector<int>::resize(v2 + 3, 4 * SLODWORD(v2->__begin_));
  return OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateFaceEdgesFromParentFaces(this);
}

_QWORD *OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateFaceEdgesFromParentFaces(_QWORD *this)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _DWORD *v24;
  uint64_t v25;
  int v26;
  _DWORD *v27;
  _BOOL4 v29;
  _BOOL4 v31;
  uint64_t v32;
  int v33;
  int v34;
  int v35;
  int v36;
  _DWORD *v37;
  uint64_t v38;
  int v39;

  v1 = this[1];
  v2 = *(_DWORD *)v1;
  if (*(int *)v1 >= 1)
  {
    v3 = 0;
    v4 = *(_QWORD *)(v1 + 24);
    v5 = *(_QWORD *)(v1 + 48);
    v6 = *(_QWORD *)(v1 + 72);
    v7 = this[11];
    v8 = this[15];
    v9 = this[13];
    v10 = this[18];
    do
    {
      v11 = *(unsigned int *)(v4 + 8 * v3);
      if ((int)v11 >= 1)
      {
        v12 = 0;
        v13 = (8 * v3) | 4;
        v14 = *(int *)(v4 + v13);
        v15 = v5 + 4 * v14;
        v16 = v6 + 4 * v14;
        v17 = v8 + 4 * *(int *)(v7 + v13);
        v18 = v10 + 4 * *(int *)(v9 + v13);
        do
        {
          v19 = *(_DWORD *)(v17 + 4 * v12);
          if (v19 != -1)
          {
            if (v12)
              v20 = v12;
            else
              v20 = v11;
            LODWORD(v21) = v20 - 1;
            v22 = *(int *)(v16 + 4 * (v20 - 1));
            v23 = *(_QWORD *)(v1 + 120);
            v24 = (_DWORD *)(v23 + 8 * v22);
            v25 = *(int *)(v16 + 4 * v12);
            v26 = *(_DWORD *)(v15 + 4 * v12);
            v27 = (_DWORD *)(v23 + 8 * v25);
            v29 = *v24 == v24[1] || *v24 != v26;
            v31 = *v27 != v27[1] && *v27 != v26;
            v32 = this[24];
            v33 = *(_DWORD *)(v32 + 8 * v22 + 4 * v29);
            v34 = *(_DWORD *)(v32 + 8 * v25 + 4 * v31);
            v35 = *(_DWORD *)(v18 + 4 * (int)v21);
            v36 = *(_DWORD *)(v18 + 4 * v12);
            v37 = (_DWORD *)(*(_QWORD *)(this[2] + 72)
                           + 4 * *(int *)(*(_QWORD *)(this[2] + 24) + 4 * ((2 * v19) | 1)));
            if ((_DWORD)v11 == 4)
            {
              v21 = (int)v21;
              LODWORD(v38) = v20 - 2;
              if (!(_DWORD)v21)
                LODWORD(v38) = 3;
              v37[v12] = v34;
              if ((_DWORD)v38)
                v39 = v38 - 1;
              else
                v39 = 3;
              v37[v39] = v36;
              v38 = (int)v38;
            }
            else
            {
              *v37 = v34;
              v37[1] = v36;
              v38 = 2;
              v21 = 3;
            }
            v37[v38] = v35;
            v37[v21] = v33;
          }
          ++v12;
        }
        while (v11 != v12);
        v2 = *(_DWORD *)v1;
      }
      ++v3;
    }
    while (v3 < v2);
  }
  return this;
}

_QWORD *OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateEdgeVertexRelation(OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement *this)
{
  std::vector<int>::resize((std::vector<unsigned int> *)(*((_QWORD *)this + 2) + 120), 2 * *(int *)(*((_QWORD *)this + 2) + 4));
  OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateEdgeVerticesFromParentFaces(this);
  return OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateEdgeVerticesFromParentEdges(this);
}

_QWORD *OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateEdgeVerticesFromParentFaces(_QWORD *this)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int *v10;
  int *v11;
  uint64_t v12;
  uint64_t v13;
  _DWORD *v14;

  v1 = this[1];
  v2 = *(_DWORD *)v1;
  if (*(int *)v1 >= 1)
  {
    v3 = 0;
    v4 = *(_QWORD *)(v1 + 24);
    v5 = *(_QWORD *)(v1 + 72);
    v6 = this[13];
    v7 = this[18];
    do
    {
      v8 = *(unsigned int *)(v4 + 8 * v3);
      if ((int)v8 >= 1)
      {
        v9 = (8 * v3) | 4;
        v10 = (int *)(v5 + 4 * *(int *)(v4 + v9));
        v11 = (int *)(v7 + 4 * *(int *)(v6 + v9));
        do
        {
          v13 = *v11++;
          v12 = v13;
          if ((_DWORD)v13 != -1)
          {
            v14 = (_DWORD *)(*(_QWORD *)(this[2] + 120) + 8 * v12);
            *v14 = *(_DWORD *)(this[21] + 4 * v3);
            v14[1] = *(_DWORD *)(this[27] + 4 * *v10);
          }
          ++v10;
          --v8;
        }
        while (v8);
        v2 = *(_DWORD *)v1;
      }
      ++v3;
    }
    while (v3 < v2);
  }
  return this;
}

_QWORD *OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateEdgeVerticesFromParentEdges(_QWORD *this)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  char v7;
  uint64_t v8;
  _DWORD *v9;

  v1 = this[1];
  if (*(int *)(v1 + 4) >= 1)
  {
    v2 = 0;
    v3 = *(_QWORD *)(v1 + 120);
    v4 = this[24];
    do
    {
      v5 = 0;
      v6 = 1;
      do
      {
        v7 = v6;
        v8 = *(int *)(v4 + 8 * v2 + 4 * v5);
        if ((_DWORD)v8 != -1)
        {
          v9 = (_DWORD *)(*(_QWORD *)(this[2] + 120) + 8 * v8);
          *v9 = *(_DWORD *)(this[27] + 4 * v2);
          v9[1] = *(_DWORD *)(this[30] + 4 * *(int *)(v3 + 8 * v2 + 4 * v5));
        }
        v6 = 0;
        v5 = 1;
      }
      while ((v7 & 1) != 0);
      ++v2;
    }
    while (v2 < *(int *)(v1 + 4));
  }
  return this;
}

void OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateEdgeFaceRelation(OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement *this)
{
  int v2;
  uint64_t v3;
  int *v4;
  std::vector<unsigned int>::size_type v5;

  v2 = 2
     * (((*(_QWORD *)(*((_QWORD *)this + 1) + 176) - *(_QWORD *)(*((_QWORD *)this + 1) + 168)) >> 2)
      + ((*(_QWORD *)(*((_QWORD *)this + 1) + 56) - *(_QWORD *)(*((_QWORD *)this + 1) + 48)) >> 2));
  std::vector<int>::resize((std::vector<unsigned int> *)(*((_QWORD *)this + 2) + 144), 2 * *(int *)(*((_QWORD *)this + 2) + 4));
  std::vector<int>::resize((std::vector<unsigned int> *)(*((_QWORD *)this + 2) + 168), v2);
  std::vector<unsigned short>::resize(*((_QWORD *)this + 2) + 192, v2);
  *(_DWORD *)(*((_QWORD *)this + 2) + 16) = *(_DWORD *)(*((_QWORD *)this + 1) + 16);
  OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateEdgeFacesFromParentFaces(this);
  OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateEdgeFacesFromParentEdges(this);
  v3 = *((_QWORD *)this + 2);
  v4 = (int *)(*(_QWORD *)(v3 + 144) + 4 * (2 * *(_DWORD *)(v3 + 4) - 2));
  v5 = v4[1] + (uint64_t)*v4;
  std::vector<int>::resize((std::vector<unsigned int> *)(v3 + 168), v5);
  std::vector<unsigned short>::resize(*((_QWORD *)this + 2) + 192, v5);
}

_QWORD *OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateEdgeFacesFromParentFaces(_QWORD *this)
{
  int *v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _DWORD *v16;
  int v17;
  int v18;
  int v19;
  uint64_t v20;
  _DWORD *v21;
  __int16 *v22;
  uint64_t v23;
  unsigned int v24;
  int v25;
  __int16 v26;
  uint64_t v27;
  int v28;
  __int16 v29;

  v1 = (int *)this[1];
  v2 = *v1;
  if (*v1 >= 1)
  {
    v3 = 0;
    v4 = this[11];
    v5 = this[15];
    v6 = this[13];
    v7 = this[18];
    do
    {
      v8 = *(unsigned int *)(v4 + 8 * v3);
      if ((int)v8 >= 1)
      {
        v9 = 0;
        v10 = (8 * v3) | 4;
        v11 = v5 + 4 * *(int *)(v4 + v10);
        v12 = v7 + 4 * *(int *)(v6 + v10);
        do
        {
          v13 = *(int *)(v12 + 4 * v9);
          if ((_DWORD)v13 == -1)
          {
            ++v9;
          }
          else
          {
            v14 = this[2];
            v15 = *(_QWORD *)(v14 + 144);
            v16 = (_DWORD *)(v15 + 8 * v13);
            *v16 = 2;
            if ((_DWORD)v13)
              v17 = *(v16 - 1) + *(v16 - 2);
            else
              v17 = 0;
            v18 = 2 * v13;
            v16[1] = v17;
            v19 = *(_DWORD *)(v14 + 16);
            if (v19 <= 2)
              v19 = 2;
            *(_DWORD *)(v14 + 16) = v19;
            v20 = *(int *)(v15 + 4 * (v18 | 1));
            v21 = (_DWORD *)(*(_QWORD *)(v14 + 168) + 4 * v20);
            v22 = (__int16 *)(*(_QWORD *)(v14 + 192) + 2 * v20);
            v23 = v9 + 1;
            if (v9 + 1 >= v8)
              v24 = 0;
            else
              v24 = v9 + 1;
            v25 = *(_DWORD *)(v11 + 4 * v9);
            if (v25 == -1)
            {
              v27 = 0;
            }
            else
            {
              *v21 = v25;
              if ((_DWORD)v8 == 4)
                v26 = v24;
              else
                v26 = 1;
              *v22 = v26;
              v27 = 1;
            }
            v28 = *(_DWORD *)(v11 + 4 * v24);
            if (v28 != -1)
            {
              v21[v27] = v28;
              v29 = ((_BYTE)v24 + 2) & 3;
              if ((_DWORD)v8 != 4)
                v29 = 2;
              v22[v27] = v29;
              LODWORD(v27) = v27 + 1;
            }
            *v16 = v27;
            v9 = v23;
          }
        }
        while (v9 != v8);
        v2 = *v1;
      }
      ++v3;
    }
    while (v3 < v2);
  }
  return this;
}

_QWORD *OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateEdgeFacesFromParentEdges(_QWORD *this)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  _DWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _DWORD *v12;
  char v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _DWORD *v18;
  int v19;
  int v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int *v29;
  unsigned __int16 *v30;
  uint64_t v31;
  uint64_t v32;
  unsigned int v33;
  uint64_t v34;
  _BOOL4 v35;
  int v36;
  uint64_t v37;
  unsigned int v38;
  int v39;
  int v40;
  __int16 v41;

  v1 = this[1];
  v2 = *(_DWORD *)(v1 + 4);
  if (v2 >= 1)
  {
    v3 = 0;
    v4 = this[24];
    do
    {
      v5 = (_DWORD *)(v4 + 8 * v3);
      if (*v5 != -1 || v5[1] != -1)
      {
        v6 = 0;
        v7 = *(_QWORD *)(v1 + 144);
        v8 = *(int *)(v7 + ((8 * v3) | 4));
        v9 = *(unsigned int *)(v7 + 8 * v3);
        v10 = *(_QWORD *)(v1 + 168) + 4 * v8;
        v11 = *(_QWORD *)(v1 + 192) + 2 * v8;
        v12 = (_DWORD *)(*(_QWORD *)(v1 + 120) + 8 * v3);
        v13 = 1;
        do
        {
          v14 = v13;
          v15 = (int)v5[v6];
          if ((_DWORD)v15 != -1)
          {
            v16 = this[2];
            v17 = *(_QWORD *)(v16 + 144);
            v18 = (_DWORD *)(v17 + 8 * v15);
            *v18 = v9;
            if ((_DWORD)v15)
              v19 = *(v18 - 1) + *(v18 - 2);
            else
              v19 = 0;
            v18[1] = v19;
            v20 = *(_DWORD *)(v16 + 16);
            if (v20 <= (int)v9)
              v20 = v9;
            *(_DWORD *)(v16 + 16) = v20;
            if ((int)v9 < 1)
            {
              v21 = 0;
            }
            else
            {
              v21 = 0;
              v22 = *(int *)(v17 + 4 * (int)((2 * v15) | 1));
              v23 = *(_QWORD *)(v16 + 168) + 4 * v22;
              v24 = *(_QWORD *)(v16 + 192) + 2 * v22;
              v25 = *(_QWORD *)(v1 + 24);
              v26 = this[11];
              v27 = this[15];
              v28 = v9;
              v29 = (int *)v10;
              v30 = (unsigned __int16 *)v11;
              do
              {
                v32 = *v29++;
                v31 = v32;
                LODWORD(v32) = *v30++;
                v33 = v32;
                v34 = (2 * v31) | 1;
                v35 = v6;
                if (*v12 != v12[1])
                  v35 = *(_DWORD *)(*(_QWORD *)(v1 + 48) + 4 * *(int *)(v25 + 4 * v34) + 4 * v33) != v12[v6];
                v36 = 2 * v31;
                v37 = v27 + 4 * *(int *)(v26 + 4 * v34);
                if (v35 + v33 == *(_DWORD *)(v26 + 4 * v36))
                  v38 = 0;
                else
                  v38 = v35 + v33;
                v39 = *(_DWORD *)(v37 + 4 * v38);
                if (v39 != -1)
                {
                  v40 = *(_DWORD *)(v25 + 4 * v36);
                  *(_DWORD *)(v23 + 4 * v21) = v39;
                  if (v35)
                    v41 = 3;
                  else
                    v41 = 0;
                  if (v40 != 4)
                    LOWORD(v33) = v41;
                  *(_WORD *)(v24 + 2 * v21++) = v33;
                }
                --v28;
              }
              while (v28);
            }
            *v18 = v21;
          }
          v13 = 0;
          v6 = 1;
        }
        while ((v14 & 1) != 0);
        v2 = *(_DWORD *)(v1 + 4);
      }
      ++v3;
    }
    while (v3 < v2);
  }
  return this;
}

void OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateVertexFaceRelation(OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement *this)
{
  _QWORD *v2;
  int v3;
  uint64_t v4;
  int *v5;
  std::vector<unsigned int>::size_type v6;

  v2 = (_QWORD *)*((_QWORD *)this + 1);
  v3 = (((v2[22] - v2[21]) >> 1) & 0xFFFFFFFE) + ((v2[7] - v2[6]) >> 2) + ((v2[37] - v2[36]) >> 2);
  std::vector<int>::resize((std::vector<unsigned int> *)(*((_QWORD *)this + 2) + 264), 2 * *(int *)(*((_QWORD *)this + 2) + 8));
  std::vector<int>::resize((std::vector<unsigned int> *)(*((_QWORD *)this + 2) + 288), v3);
  std::vector<unsigned short>::resize(*((_QWORD *)this + 2) + 312, v3);
  if (*((_DWORD *)this + 21))
  {
    OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateVertexFacesFromParentFaces(this);
    OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateVertexFacesFromParentEdges(this);
    OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateVertexFacesFromParentVertices(this);
  }
  else
  {
    OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateVertexFacesFromParentVertices(this);
    OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateVertexFacesFromParentFaces(this);
    OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateVertexFacesFromParentEdges(this);
  }
  v4 = *((_QWORD *)this + 2);
  v5 = (int *)(*(_QWORD *)(v4 + 264) + 4 * (2 * *(_DWORD *)(v4 + 8) - 2));
  v6 = v5[1] + (uint64_t)*v5;
  std::vector<int>::resize((std::vector<unsigned int> *)(v4 + 288), v6);
  std::vector<unsigned short>::resize(*((_QWORD *)this + 2) + 312, v6);
}

_QWORD *OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateVertexFacesFromParentVertices(_QWORD *this)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _DWORD *v12;
  int v13;
  int v14;
  int *v15;
  unsigned __int16 *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int16 v23;
  int v24;
  int v25;

  v1 = this[1];
  v2 = *(_DWORD *)(v1 + 8);
  if (v2 >= 1)
  {
    v3 = 0;
    v4 = this[30];
    do
    {
      v5 = *(int *)(v4 + 4 * v3);
      if ((_DWORD)v5 != -1)
      {
        v6 = *(_QWORD *)(v1 + 288);
        v7 = (unsigned int *)(*(_QWORD *)(v1 + 264) + 8 * v3);
        v8 = *v7;
        v9 = (int)v7[1];
        v10 = *(_QWORD *)(v1 + 312);
        v11 = (_QWORD *)this[2];
        v12 = (_DWORD *)(v11[33] + 8 * v5);
        *v12 = v8;
        if ((_DWORD)v5)
          v13 = *(v12 - 1) + *(v12 - 2);
        else
          v13 = 0;
        v12[1] = v13;
        if ((int)v8 < 1)
        {
          v14 = 0;
        }
        else
        {
          v14 = 0;
          v15 = (int *)(v6 + 4 * v9);
          v16 = (unsigned __int16 *)(v10 + 2 * v9);
          v17 = v11[36] + 4 * v13;
          v18 = v11[39] + 2 * v13;
          v19 = this[11];
          v20 = this[15];
          do
          {
            v22 = *v15++;
            v21 = v22;
            LODWORD(v22) = *v16++;
            v23 = v22;
            v24 = *(_DWORD *)(v20 + 4 * *(int *)(v19 + 8 * v21 + 4) + 4 * v22);
            if (v24 != -1)
            {
              v25 = *(_DWORD *)(v19 + 8 * (_DWORD)v21);
              *(_DWORD *)(v17 + 4 * v14) = v24;
              if (v25 != 4)
                v23 = 0;
              *(_WORD *)(v18 + 2 * v14++) = v23;
            }
            --v8;
          }
          while (v8);
        }
        *v12 = v14;
        v2 = *(_DWORD *)(v1 + 8);
      }
      ++v3;
    }
    while (v3 < v2);
  }
  return this;
}

_QWORD *OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateVertexFacesFromParentFaces(_QWORD *this)
{
  int *v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _DWORD *v11;
  int v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  __int16 v19;

  v1 = (int *)this[1];
  v2 = *v1;
  if (*v1 >= 1)
  {
    v3 = 0;
    v4 = this[21];
    do
    {
      v5 = *(int *)(v4 + 4 * v3);
      if ((_DWORD)v5 != -1)
      {
        v6 = (unsigned int *)(this[11] + 8 * v3);
        v7 = this[15];
        v8 = *v6;
        v9 = (int)v6[1];
        v10 = (_QWORD *)this[2];
        v11 = (_DWORD *)(v10[33] + 8 * v5);
        *v11 = v8;
        if ((_DWORD)v5)
          v12 = *(v11 - 1) + *(v11 - 2);
        else
          v12 = 0;
        v11[1] = v12;
        if ((int)v8 < 1)
        {
          v14 = 0;
        }
        else
        {
          v13 = 0;
          v14 = 0;
          v15 = v7 + 4 * v9;
          v16 = v10[36] + 4 * v12;
          v17 = v10[39] + 2 * v12;
          do
          {
            v18 = *(_DWORD *)(v15 + 4 * v13);
            if (v18 != -1)
            {
              *(_DWORD *)(v16 + 4 * v14) = v18;
              v19 = ((_BYTE)v13 + 2) & 3;
              if ((_DWORD)v8 != 4)
                v19 = 2;
              *(_WORD *)(v17 + 2 * v14++) = v19;
            }
            ++v13;
          }
          while (v8 != v13);
        }
        *v11 = v14;
        v2 = *v1;
      }
      ++v3;
    }
    while (v3 < v2);
  }
  return this;
}

_QWORD *OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateVertexFacesFromParentEdges(_QWORD *this)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _DWORD *v12;
  int v13;
  int v14;
  int *v15;
  unsigned __int16 *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  unsigned int v26;
  int v27;
  __int16 v28;
  int v29;
  __int16 v30;

  v1 = this[1];
  v2 = *(_DWORD *)(v1 + 4);
  if (v2 >= 1)
  {
    v3 = 0;
    v4 = this[27];
    do
    {
      v5 = *(int *)(v4 + 4 * v3);
      if ((_DWORD)v5 != -1)
      {
        v6 = *(_QWORD *)(v1 + 168);
        v7 = (unsigned int *)(*(_QWORD *)(v1 + 144) + 8 * v3);
        v8 = *v7;
        v9 = (int)v7[1];
        v10 = *(_QWORD *)(v1 + 192);
        v11 = (_QWORD *)this[2];
        v12 = (_DWORD *)(v11[33] + 8 * v5);
        *v12 = 2 * v8;
        if ((_DWORD)v5)
          v13 = *(v12 - 1) + *(v12 - 2);
        else
          v13 = 0;
        v12[1] = v13;
        if ((int)v8 < 1)
        {
          v14 = 0;
        }
        else
        {
          v14 = 0;
          v15 = (int *)(v6 + 4 * v9);
          v16 = (unsigned __int16 *)(v10 + 2 * v9);
          v17 = v11[36] + 4 * v13;
          v18 = v11[39] + 2 * v13;
          v19 = this[11];
          v20 = this[15];
          do
          {
            v22 = *v15++;
            v21 = v22;
            LODWORD(v22) = *v16++;
            v23 = v22;
            v24 = v20 + 4 * *(int *)(v19 + 8 * v21 + 4);
            v25 = *(_DWORD *)(v19 + 8 * (_DWORD)v21);
            if ((_DWORD)v22 + 1 == v25)
              v26 = 0;
            else
              v26 = v23 + 1;
            v27 = *(_DWORD *)(v24 + 4 * v26);
            if (v27 != -1)
            {
              *(_DWORD *)(v17 + 4 * v14) = v27;
              if (v25 == 4)
                v28 = v23;
              else
                v28 = 3;
              *(_WORD *)(v18 + 2 * v14++) = v28;
            }
            v29 = *(_DWORD *)(v24 + 4 * v23);
            if (v29 != -1)
            {
              *(_DWORD *)(v17 + 4 * v14) = v29;
              if (v25 == 4)
                v30 = v26;
              else
                v30 = 1;
              *(_WORD *)(v18 + 2 * v14++) = v30;
            }
            --v8;
          }
          while (v8);
        }
        *v12 = v14;
        v2 = *(_DWORD *)(v1 + 4);
      }
      ++v3;
    }
    while (v3 < v2);
  }
  return this;
}

void OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateVertexEdgeRelation(OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement *this)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  int *v5;
  std::vector<unsigned int>::size_type v6;

  v2 = *((_QWORD *)this + 1);
  v3 = ((*(_QWORD *)(v2 + 56) - *(_QWORD *)(v2 + 48)) >> 2)
     + 2 * *(_DWORD *)(v2 + 4)
     + ((*(_QWORD *)(v2 + 176) - *(_QWORD *)(v2 + 168)) >> 2)
     + ((*(_QWORD *)(v2 + 368) - *(_QWORD *)(v2 + 360)) >> 2);
  std::vector<int>::resize((std::vector<unsigned int> *)(*((_QWORD *)this + 2) + 336), 2 * *(int *)(*((_QWORD *)this + 2) + 8));
  std::vector<int>::resize((std::vector<unsigned int> *)(*((_QWORD *)this + 2) + 360), v3);
  std::vector<unsigned short>::resize(*((_QWORD *)this + 2) + 384, v3);
  if (*((_DWORD *)this + 21))
  {
    OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateVertexEdgesFromParentFaces(this);
    OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateVertexEdgesFromParentEdges(this);
    OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateVertexEdgesFromParentVertices(this);
  }
  else
  {
    OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateVertexEdgesFromParentVertices(this);
    OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateVertexEdgesFromParentFaces(this);
    OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateVertexEdgesFromParentEdges(this);
  }
  v4 = *((_QWORD *)this + 2);
  v5 = (int *)(*(_QWORD *)(v4 + 336) + 4 * (2 * *(_DWORD *)(v4 + 8) - 2));
  v6 = v5[1] + (uint64_t)*v5;
  std::vector<int>::resize((std::vector<unsigned int> *)(v4 + 360), v6);
  std::vector<unsigned short>::resize(*((_QWORD *)this + 2) + 384, v6);
}

_QWORD *OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateVertexEdgesFromParentVertices(_QWORD *this)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _DWORD *v13;
  int v14;
  int v15;
  int v16;
  int *v17;
  unsigned __int16 *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;

  v1 = this[1];
  v2 = *(_DWORD *)(v1 + 8);
  if (v2 >= 1)
  {
    v3 = 0;
    v4 = this[30];
    do
    {
      v5 = *(int *)(v4 + 4 * v3);
      if ((_DWORD)v5 != -1)
      {
        v6 = *(_QWORD *)(v1 + 360);
        v7 = (unsigned int *)(*(_QWORD *)(v1 + 336) + 8 * v3);
        v8 = *v7;
        v9 = (int)v7[1];
        v10 = *(_QWORD *)(v1 + 384);
        v11 = this[2];
        v12 = *(_QWORD *)(v11 + 336);
        v13 = (_DWORD *)(v12 + 8 * v5);
        *v13 = v8;
        if ((_DWORD)v5)
          v14 = *(v13 - 1) + *(v13 - 2);
        else
          v14 = 0;
        v13[1] = v14;
        v15 = *(_DWORD *)(v11 + 20);
        if (v15 <= (int)v8)
          v15 = v8;
        *(_DWORD *)(v11 + 20) = v15;
        if ((int)v8 < 1)
        {
          v16 = 0;
        }
        else
        {
          v16 = 0;
          v17 = (int *)(v6 + 4 * v9);
          v18 = (unsigned __int16 *)(v10 + 2 * v9);
          v19 = *(int *)(v12 + 4 * (int)((2 * v5) | 1));
          v20 = *(_QWORD *)(v11 + 360) + 4 * v19;
          v21 = *(_QWORD *)(v11 + 384) + 2 * v19;
          v22 = this[24];
          do
          {
            v24 = *v17++;
            v23 = v24;
            LODWORD(v24) = *v18++;
            v25 = *(_DWORD *)(v22 + 8 * v23 + 4 * v24);
            if (v25 != -1)
            {
              *(_DWORD *)(v20 + 4 * v16) = v25;
              *(_WORD *)(v21 + 2 * v16++) = 1;
            }
            --v8;
          }
          while (v8);
        }
        *v13 = v16;
        v2 = *(_DWORD *)(v1 + 8);
      }
      ++v3;
    }
    while (v3 < v2);
  }
  return this;
}

_QWORD *OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateVertexEdgesFromParentFaces(_QWORD *this)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int *v11;
  int v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  int v21;

  v1 = this[1];
  v2 = *(_DWORD *)v1;
  if (*(int *)v1 >= 1)
  {
    v3 = 0;
    v4 = this[21];
    do
    {
      v5 = *(int *)(v4 + 4 * v3);
      if ((_DWORD)v5 != -1)
      {
        v6 = *(_DWORD *)(*(_QWORD *)(v1 + 24) + 8 * v3);
        v7 = *(int *)(this[13] + 8 * v3 + 4);
        v8 = this[18];
        v9 = this[2];
        v10 = *(_QWORD *)(v9 + 336);
        v11 = (int *)(v10 + 8 * v5);
        *v11 = v6;
        if ((_DWORD)v5)
          v12 = *(v11 - 1) + *(v11 - 2);
        else
          v12 = 0;
        v11[1] = v12;
        v13 = *(_DWORD *)(v9 + 20);
        if (v13 <= v6)
          v13 = v6;
        *(_DWORD *)(v9 + 20) = v13;
        if (v6 < 1)
        {
          v15 = 0;
        }
        else
        {
          v14 = 0;
          v15 = 0;
          v16 = v8 + 4 * v7;
          v17 = *(int *)(v10 + 4 * (int)((2 * v5) | 1));
          v18 = *(_QWORD *)(v9 + 360) + 4 * v17;
          v19 = *(_QWORD *)(v9 + 384) + 2 * v17;
          do
          {
            if (v14)
              v20 = v14;
            else
              v20 = v6;
            v21 = *(_DWORD *)(v16 + 4 * (v20 - 1));
            if (v21 != -1)
            {
              *(_DWORD *)(v18 + 4 * v15) = v21;
              *(_WORD *)(v19 + 2 * v15++) = 0;
            }
            ++v14;
          }
          while (v6 != v14);
        }
        *v11 = v15;
        v2 = *(_DWORD *)v1;
      }
      ++v3;
    }
    while (v3 < v2);
  }
  return this;
}

_QWORD *OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateVertexEdgesFromParentEdges(_QWORD *this)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  int *v15;
  int v16;
  int *v17;
  int v18;
  uint64_t v19;
  int *v20;
  __int16 *v21;
  int v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _DWORD *v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  int v33;
  __int16 v34;
  int v35;
  int v36;
  __int16 v37;

  v1 = this[1];
  v2 = *(_DWORD *)(v1 + 4);
  if (v2 >= 1)
  {
    v3 = 0;
    v4 = this[27];
    do
    {
      v5 = *(int *)(v4 + 4 * v3);
      if ((_DWORD)v5 != -1)
      {
        v6 = *(_QWORD *)(v1 + 168);
        v7 = *(unsigned int *)(*(_QWORD *)(v1 + 144) + 8 * v3);
        v8 = *(int *)(*(_QWORD *)(v1 + 144) + 8 * v3 + 4);
        v9 = *(_QWORD *)(v1 + 192);
        v10 = *(_QWORD *)(v1 + 120);
        v11 = this[24];
        v12 = this[2];
        v13 = v7 + 2;
        v14 = *(_QWORD *)(v12 + 336);
        v15 = (int *)(v14 + 8 * v5);
        *v15 = v7 + 2;
        if ((_DWORD)v5)
          v16 = *(v15 - 1) + *(v15 - 2);
        else
          v16 = 0;
        v17 = (int *)(v11 + 8 * v3);
        v18 = 2 * v5;
        v15[1] = v16;
        if (*(_DWORD *)(v12 + 20) > v13)
          v13 = *(_DWORD *)(v12 + 20);
        *(_DWORD *)(v12 + 20) = v13;
        v19 = *(int *)(v14 + 4 * (v18 | 1));
        v20 = (int *)(*(_QWORD *)(v12 + 360) + 4 * v19);
        v21 = (__int16 *)(*(_QWORD *)(v12 + 384) + 2 * v19);
        if (*v17 == -1)
        {
          v22 = 0;
        }
        else
        {
          *v20 = *v17;
          *v21 = 0;
          v22 = 1;
        }
        v23 = v17[1];
        if (v23 != -1)
        {
          v20[v22] = v23;
          v21[v22++] = 0;
        }
        if ((int)v7 >= 1)
        {
          v24 = 0;
          v25 = v6 + 4 * v8;
          v26 = v9 + 2 * v8;
          v27 = this[13];
          v28 = this[18];
          v29 = (_DWORD *)(v10 + 8 * v3);
          do
          {
            v30 = *(unsigned __int16 *)(v26 + 2 * v24);
            v31 = (2 * *(int *)(v25 + 4 * v24)) | 1;
            v32 = *(_DWORD *)(v28 + 4 * *(int *)(v27 + 4 * v31) + 4 * v30);
            if (v32 != -1)
            {
              v20[v22] = v32;
              v21[v22++] = 1;
              if (!v24 && v22 == 3)
              {
                if (*v29 == v29[1])
                {
                  v33 = v20[1];
                  v34 = v21[1];
                }
                else
                {
                  v35 = *(_DWORD *)(*(_QWORD *)(v1 + 48) + 4 * *(int *)(*(_QWORD *)(v1 + 24) + 4 * v31) + 4 * v30);
                  v33 = v20[1];
                  v34 = v21[1];
                  if (v35 == *v29)
                  {
                    v36 = *v20;
                    *v20 = v33;
                    v37 = *v21;
                    *v21 = v34;
                    v34 = v37;
                    v33 = v36;
                  }
                }
                v20[1] = v20[2];
                v20[2] = v33;
                v21[1] = v21[2];
                v21[2] = v34;
                v22 = 3;
              }
            }
            ++v24;
          }
          while (v7 != v24);
        }
        *v15 = v22;
        v2 = *(_DWORD *)(v1 + 4);
      }
      ++v3;
    }
    while (v3 < v2);
  }
  return this;
}

uint64_t OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::markSparseFaceChildren(uint64_t this)
{
  int *v1;
  uint64_t i;
  uint64_t v3;
  _DWORD *v4;
  _DWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int *v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  int v18;
  int v19;
  char v20;
  int v21;
  char v22;
  int v23;
  uint64_t v24;

  if (*(_QWORD *)(this + 416) == *(_QWORD *)(this + 408))
    OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::markSparseFaceChildren();
  if (*(_DWORD *)(this + 28))
    OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::markSparseFaceChildren();
  v1 = *(int **)(this + 8);
  if (*v1 >= 1)
  {
    for (i = 0; i < *v1; ++i)
    {
      v3 = (2 * i) | 1;
      v4 = (_DWORD *)(*(_QWORD *)(this + 120) + 4 * *(int *)(*(_QWORD *)(this + 88) + 4 * v3));
      v5 = (_DWORD *)(*(_QWORD *)(this + 144) + 4 * *(int *)(*(_QWORD *)(this + 104) + 4 * v3));
      v6 = *((_QWORD *)v1 + 3);
      v7 = *(unsigned int *)(v6 + 8 * i);
      v8 = *(_QWORD *)(this + 408);
      if ((*(_BYTE *)(v8 + i) & 1) != 0)
      {
        if ((int)v7 >= 1)
        {
          do
          {
            *v4++ = 2;
            *v5++ = 2;
            --v7;
          }
          while (v7);
        }
        *(_DWORD *)(*(_QWORD *)(this + 168) + 4 * i) = 2;
        v22 = *(_BYTE *)(v8 + i) & 0xE1;
      }
      else
      {
        if ((int)v7 < 1)
          goto LABEL_24;
        v9 = 0;
        v10 = 0;
        v11 = *((_QWORD *)v1 + 6) + 4 * *(int *)(v6 + 4 * v3);
        v12 = *(_QWORD *)(this + 456);
        do
        {
          if ((*(_BYTE *)(v12 + *(int *)(v11 + 4 * v9)) & 1) != 0)
          {
            v10 = 1;
            v4[v9] = 1;
            if (v9)
              v13 = v9;
            else
              v13 = v7;
            v5[v9] = 1;
            v5[v13 - 1] = 1;
          }
          ++v9;
        }
        while (v7 != v9);
        if (!v10)
          goto LABEL_24;
        *(_DWORD *)(*(_QWORD *)(this + 168) + 4 * i) = 1;
        v14 = (int *)(*((_QWORD *)v1 + 9) + 4 * *(int *)(v6 + 4 * v3));
        v15 = *(unsigned int *)(v6 + 8 * i);
        if ((_DWORD)v15 == 3)
        {
          v21 = *(_BYTE *)(*(_QWORD *)(this + 432) + v14[1]) & 0xE | (*(unsigned __int8 *)(*(_QWORD *)(this + 432) + *v14) >> 1) & 0xF | (2 * *(unsigned __int8 *)(*(_QWORD *)(this + 432) + v14[2])) & 0xC;
          v20 = *(_BYTE *)(v8 + i);
        }
        else
        {
          if ((_DWORD)v15 != 4)
          {
            v23 = *(_BYTE *)(v8 + i) & 0xE1;
            *(_BYTE *)(v8 + i) &= 0xE1u;
            if ((int)v15 >= 1)
            {
              do
              {
                v24 = *v14++;
                v23 |= *(_BYTE *)(*(_QWORD *)(this + 432) + v24) & 0x1E;
                *(_BYTE *)(v8 + i) = v23;
                --v15;
              }
              while (v15);
            }
            goto LABEL_24;
          }
          v16 = *(_QWORD *)(this + 432);
          v17 = *(unsigned __int8 *)(v16 + *v14);
          v18 = *(_BYTE *)(v16 + v14[1]) & 0xE;
          v19 = (2 * *(unsigned __int8 *)(v16 + v14[2])) & 0xC;
          LOBYTE(v16) = 4 * *(_BYTE *)(v16 + v14[3]);
          v20 = *(_BYTE *)(v8 + i);
          v21 = v18 | (v17 >> 1) & 0xF | v19 | v16 & 8;
        }
        v22 = v20 & 0xE1 | (2 * (v21 & 0xF));
      }
      *(_BYTE *)(v8 + i) = v22;
LABEL_24:
      v1 = *(int **)(this + 8);
    }
  }
  return this;
}

void OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::markSparseFaceChildren()
{
  __assert_rtn("markSparseFaceChildren", "quadRefinement.cpp", 920, "_parentFaceTag.size() > 0");
}

{
  __assert_rtn("markSparseFaceChildren", "quadRefinement.cpp", 931, "_splitType == Sdc::SPLIT_TO_QUADS");
}

uint64_t OpenSubdiv::v3_1_1::Far::TopologyRefiner::TopologyRefiner(uint64_t a1, int a2, int a3)
{
  char **v4;
  OpenSubdiv::v3_1_1::Vtr::internal::Level *v5;
  unint64_t v6;
  OpenSubdiv::v3_1_1::Vtr::internal::Level **v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  OpenSubdiv::v3_1_1::Vtr::internal::Level **v14;
  char *v15;
  char *v16;
  char *v17;
  OpenSubdiv::v3_1_1::Vtr::internal::Level *v18;

  *(_DWORD *)a1 = a2;
  *(_DWORD *)(a1 + 4) = a3;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a1 + 8) & 0xC0 | 1;
  *(_BYTE *)(a1 + 12) &= 0xC0u;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a1 + 16) & 0xF000 | 0xF0;
  v4 = (char **)(a1 + 40);
  *(_OWORD *)(a1 + 20) = 0u;
  *(_OWORD *)(a1 + 36) = 0u;
  *(_OWORD *)(a1 + 52) = 0u;
  *(_OWORD *)(a1 + 68) = 0u;
  *(_OWORD *)(a1 + 84) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  std::vector<OpenSubdiv::v3_1_1::Vtr::internal::Level *>::reserve((void **)(a1 + 40), 0xAuLL);
  v5 = (OpenSubdiv::v3_1_1::Vtr::internal::Level *)operator new();
  OpenSubdiv::v3_1_1::Vtr::internal::Level::Level(v5);
  v6 = *(_QWORD *)(a1 + 56);
  v7 = *(OpenSubdiv::v3_1_1::Vtr::internal::Level ***)(a1 + 48);
  if ((unint64_t)v7 >= v6)
  {
    v9 = ((char *)v7 - *v4) >> 3;
    if ((unint64_t)(v9 + 1) >> 61)
      abort();
    v10 = v6 - (_QWORD)*v4;
    v11 = v10 >> 2;
    if (v10 >> 2 <= (unint64_t)(v9 + 1))
      v11 = v9 + 1;
    if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF8)
      v12 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v12 = v11;
    if (v12)
      v13 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<Statement *>>(a1 + 56, v12);
    else
      v13 = 0;
    v14 = (OpenSubdiv::v3_1_1::Vtr::internal::Level **)&v13[8 * v9];
    v15 = &v13[8 * v12];
    *v14 = v5;
    v8 = v14 + 1;
    v17 = *(char **)(a1 + 40);
    v16 = *(char **)(a1 + 48);
    if (v16 != v17)
    {
      do
      {
        v18 = (OpenSubdiv::v3_1_1::Vtr::internal::Level *)*((_QWORD *)v16 - 1);
        v16 -= 8;
        *--v14 = v18;
      }
      while (v16 != v17);
      v16 = *v4;
    }
    *(_QWORD *)(a1 + 40) = v14;
    *(_QWORD *)(a1 + 48) = v8;
    *(_QWORD *)(a1 + 56) = v15;
    if (v16)
      operator delete(v16);
  }
  else
  {
    *v7 = v5;
    v8 = v7 + 1;
  }
  *(_QWORD *)(a1 + 48) = v8;
  std::vector<OpenSubdiv::v3_1_1::Far::TopologyLevel>::reserve((void **)(a1 + 88), 0xAuLL);
  OpenSubdiv::v3_1_1::Far::TopologyRefiner::assembleFarLevels((OpenSubdiv::v3_1_1::Far::TopologyRefiner *)a1);
  return a1;
}

{
  return OpenSubdiv::v3_1_1::Far::TopologyRefiner::TopologyRefiner(a1, a2, a3);
}

void std::vector<OpenSubdiv::v3_1_1::Vtr::internal::Level *>::reserve(void **a1, unint64_t a2)
{
  uint64_t v3;
  _BYTE *v4;
  int64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  uint64_t v13;

  v4 = a1[2];
  v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (_BYTE *)*a1) >> 3)
  {
    if (a2 >> 61)
      abort();
    v5 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    v6 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<Statement *>>(v3, a2);
    v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    v9 = &v6[8 * v8];
    v11 = (char *)*a1;
    v10 = (char *)a1[1];
    v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        v13 = *((_QWORD *)v10 - 1);
        v10 -= 8;
        *((_QWORD *)v12 - 1) = v13;
        v12 -= 8;
      }
      while (v10 != v11);
      v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
      operator delete(v10);
  }
}

void std::vector<OpenSubdiv::v3_1_1::Far::TopologyLevel>::reserve(void **a1, unint64_t a2)
{
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  __int128 v13;

  v4 = a1[2];
  v3 = (uint64_t)(a1 + 2);
  if (0xAAAAAAAAAAAAAAABLL * ((v4 - (_BYTE *)*a1) >> 3) < a2)
  {
    if (a2 >= 0xAAAAAAAAAAAAAABLL)
      abort();
    v5 = ((_BYTE *)a1[1] - (_BYTE *)*a1) / 24;
    v6 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::string>>(v3, a2);
    v7 = &v6[24 * v5];
    v9 = &v6[24 * v8];
    v11 = (char *)*a1;
    v10 = (char *)a1[1];
    v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        v13 = *(_OWORD *)(v10 - 24);
        *((_QWORD *)v12 - 1) = *((_QWORD *)v10 - 1);
        *(_OWORD *)(v12 - 24) = v13;
        v12 -= 24;
        v10 -= 24;
      }
      while (v10 != v11);
      v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
      operator delete(v10);
  }
}

void OpenSubdiv::v3_1_1::Far::TopologyRefiner::assembleFarLevels(OpenSubdiv::v3_1_1::Far::TopologyRefiner *this)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;

  std::vector<OpenSubdiv::v3_1_1::Far::TopologyLevel>::resize((uint64_t)this + 88, (uint64_t)(*((_QWORD *)this + 6) - *((_QWORD *)this + 5)) >> 3);
  v2 = (_QWORD *)*((_QWORD *)this + 11);
  v2[1] = 0;
  v3 = (_QWORD *)*((_QWORD *)this + 5);
  *v2 = *v3;
  v2[2] = 0;
  v4 = (_QWORD *)*((_QWORD *)this + 8);
  v5 = *((_QWORD *)this + 9) - (_QWORD)v4;
  v6 = v5 >> 3;
  if ((v5 >> 3))
  {
    v2[2] = *v4;
    if ((int)v6 >= 2)
    {
      v7 = (v5 >> 3) - 1;
      v8 = v2 + 5;
      v9 = v3 + 1;
      v10 = v4 + 1;
      do
      {
        *(v8 - 1) = *(v10 - 1);
        v11 = *v9++;
        *(v8 - 2) = v11;
        v12 = *v10++;
        *v8 = v12;
        v8 += 3;
        --v7;
      }
      while (v7);
    }
    v13 = &v2[3 * (int)v6];
    v13[1] = *(_QWORD *)((char *)v4 + ((uint64_t)((v5 << 29) - 0x100000000) >> 29));
    *v13 = *(_QWORD *)((char *)v3 + ((uint64_t)(v5 << 29) >> 29));
    v13[2] = 0;
  }
}

void OpenSubdiv::v3_1_1::Far::TopologyRefiner::~TopologyRefiner(OpenSubdiv::v3_1_1::Far::TopologyRefiner *this)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  OpenSubdiv::v3_1_1::Vtr::internal::Level *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v3 = *((_QWORD *)this + 5);
  v2 = *((_QWORD *)this + 6);
  if ((int)((unint64_t)(v2 - v3) >> 3) >= 1)
  {
    v4 = 0;
    do
    {
      v5 = *(OpenSubdiv::v3_1_1::Vtr::internal::Level **)(v3 + 8 * v4);
      if (v5)
      {
        OpenSubdiv::v3_1_1::Vtr::internal::Level::~Level(v5);
        MEMORY[0x1DF0D41C0]();
        v3 = *((_QWORD *)this + 5);
        v2 = *((_QWORD *)this + 6);
      }
      ++v4;
    }
    while (v4 < (int)((unint64_t)(v2 - v3) >> 3));
  }
  v6 = (_QWORD *)*((_QWORD *)this + 8);
  v7 = *((_QWORD *)this + 9);
  if ((int)((unint64_t)(v7 - (_QWORD)v6) >> 3) >= 1)
  {
    v8 = 0;
    do
    {
      v9 = v6[v8];
      if (v9)
      {
        (*(void (**)(_QWORD))(*(_QWORD *)v9 + 8))(v6[v8]);
        v6 = (_QWORD *)*((_QWORD *)this + 8);
        v7 = *((_QWORD *)this + 9);
      }
      ++v8;
    }
    while (v8 < (int)((unint64_t)(v7 - (_QWORD)v6) >> 3));
  }
  v10 = (void *)*((_QWORD *)this + 11);
  if (v10)
  {
    *((_QWORD *)this + 12) = v10;
    operator delete(v10);
    v6 = (_QWORD *)*((_QWORD *)this + 8);
  }
  if (v6)
  {
    *((_QWORD *)this + 9) = v6;
    operator delete(v6);
  }
  v11 = (void *)*((_QWORD *)this + 5);
  if (v11)
  {
    *((_QWORD *)this + 6) = v11;
    operator delete(v11);
  }
}

int32x2_t OpenSubdiv::v3_1_1::Far::TopologyRefiner::initializeInventory(OpenSubdiv::v3_1_1::Far::TopologyRefiner *this)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  int32x2_t result;
  uint64_t v5;

  v1 = (uint64_t *)*((_QWORD *)this + 5);
  v2 = (uint64_t)(*((_QWORD *)this + 6) - (_QWORD)v1) >> 3;
  if (v2)
  {
    if (v2 != 1)
      OpenSubdiv::v3_1_1::Far::TopologyRefiner::initializeInventory();
    v3 = *v1;
    result = vrev64_s32(*(int32x2_t *)(v3 + 4));
    *(int32x2_t *)((char *)this + 20) = result;
    v5 = (*(_QWORD *)(v3 + 56) - *(_QWORD *)(v3 + 48)) >> 2;
    *((_DWORD *)this + 7) = *(_DWORD *)v3;
    *((_DWORD *)this + 8) = v5;
    *((_DWORD *)this + 9) = *(_DWORD *)(v3 + 20);
  }
  else
  {
    *(_QWORD *)((char *)this + 28) = 0;
    *(_QWORD *)((char *)this + 20) = 0;
    *((_DWORD *)this + 9) = 0;
  }
  return result;
}

uint64_t OpenSubdiv::v3_1_1::Far::TopologyRefiner::updateInventory(uint64_t this, const OpenSubdiv::v3_1_1::Vtr::internal::Level *a2)
{
  int v2;
  int v3;

  *(int32x2_t *)(this + 20) = vadd_s32(*(int32x2_t *)(this + 20), vrev64_s32(*(int32x2_t *)((char *)a2 + 4)));
  v2 = *(_DWORD *)(this + 32) + ((*((_QWORD *)a2 + 7) - *((_QWORD *)a2 + 6)) >> 2);
  *(_DWORD *)(this + 28) += *(_DWORD *)a2;
  *(_DWORD *)(this + 32) = v2;
  v3 = *((_DWORD *)a2 + 5);
  if (*(_DWORD *)(this + 36) > v3)
    v3 = *(_DWORD *)(this + 36);
  *(_DWORD *)(this + 36) = v3;
  return this;
}

uint64_t OpenSubdiv::v3_1_1::Far::TopologyRefiner::appendLevel(OpenSubdiv::v3_1_1::Far::TopologyRefiner *this, OpenSubdiv::v3_1_1::Vtr::internal::Level *a2)
{
  char *v4;
  unint64_t v5;
  unint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  uint64_t v19;

  v6 = *((_QWORD *)this + 7);
  v4 = (char *)this + 56;
  v5 = v6;
  v7 = (_QWORD *)*((_QWORD *)v4 - 1);
  if ((unint64_t)v7 >= v6)
  {
    v9 = *((_QWORD *)this + 5);
    v10 = ((uint64_t)v7 - v9) >> 3;
    if ((unint64_t)(v10 + 1) >> 61)
      abort();
    v11 = v5 - v9;
    v12 = v11 >> 2;
    if (v11 >> 2 <= (unint64_t)(v10 + 1))
      v12 = v10 + 1;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8)
      v13 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v13 = v12;
    if (v13)
      v14 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<Statement *>>((uint64_t)v4, v13);
    else
      v14 = 0;
    v15 = &v14[8 * v10];
    v16 = &v14[8 * v13];
    *(_QWORD *)v15 = a2;
    v8 = v15 + 8;
    v18 = (char *)*((_QWORD *)this + 5);
    v17 = (char *)*((_QWORD *)this + 6);
    if (v17 != v18)
    {
      do
      {
        v19 = *((_QWORD *)v17 - 1);
        v17 -= 8;
        *((_QWORD *)v15 - 1) = v19;
        v15 -= 8;
      }
      while (v17 != v18);
      v17 = (char *)*((_QWORD *)this + 5);
    }
    *((_QWORD *)this + 5) = v15;
    *((_QWORD *)this + 6) = v8;
    *((_QWORD *)this + 7) = v16;
    if (v17)
      operator delete(v17);
  }
  else
  {
    *v7 = a2;
    v8 = v7 + 1;
  }
  *((_QWORD *)this + 6) = v8;
  return OpenSubdiv::v3_1_1::Far::TopologyRefiner::updateInventory((uint64_t)this, a2);
}

void OpenSubdiv::v3_1_1::Far::TopologyRefiner::appendRefinement(OpenSubdiv::v3_1_1::Far::TopologyRefiner *this, OpenSubdiv::v3_1_1::Vtr::internal::Refinement *a2)
{
  char *v4;
  unint64_t v5;
  unint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  uint64_t v19;

  v6 = *((_QWORD *)this + 10);
  v4 = (char *)this + 80;
  v5 = v6;
  v7 = (_QWORD *)*((_QWORD *)v4 - 1);
  if ((unint64_t)v7 >= v6)
  {
    v9 = *((_QWORD *)this + 8);
    v10 = ((uint64_t)v7 - v9) >> 3;
    if ((unint64_t)(v10 + 1) >> 61)
      abort();
    v11 = v5 - v9;
    v12 = v11 >> 2;
    if (v11 >> 2 <= (unint64_t)(v10 + 1))
      v12 = v10 + 1;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8)
      v13 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v13 = v12;
    if (v13)
      v14 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<Statement *>>((uint64_t)v4, v13);
    else
      v14 = 0;
    v15 = &v14[8 * v10];
    v16 = &v14[8 * v13];
    *(_QWORD *)v15 = a2;
    v8 = v15 + 8;
    v18 = (char *)*((_QWORD *)this + 8);
    v17 = (char *)*((_QWORD *)this + 9);
    if (v17 != v18)
    {
      do
      {
        v19 = *((_QWORD *)v17 - 1);
        v17 -= 8;
        *((_QWORD *)v15 - 1) = v19;
        v15 -= 8;
      }
      while (v17 != v18);
      v17 = (char *)*((_QWORD *)this + 8);
    }
    *((_QWORD *)this + 8) = v15;
    *((_QWORD *)this + 9) = v8;
    *((_QWORD *)this + 10) = v16;
    if (v17)
      operator delete(v17);
  }
  else
  {
    *v7 = a2;
    v8 = v7 + 1;
  }
  *((_QWORD *)this + 9) = v8;
}

void std::vector<OpenSubdiv::v3_1_1::Far::TopologyLevel>::resize(uint64_t a1, unint64_t a2)
{
  unint64_t v2;
  BOOL v3;
  unint64_t v4;

  v2 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 3);
  v3 = a2 >= v2;
  v4 = a2 - v2;
  if (v4 != 0 && v3)
  {
    std::vector<OpenSubdiv::v3_1_1::Far::TopologyLevel>::__append((char **)a1, v4);
  }
  else if (!v3)
  {
    *(_QWORD *)(a1 + 8) = *(_QWORD *)a1 + 24 * a2;
  }
}

uint64_t OpenSubdiv::v3_1_1::Far::TopologyRefiner::GetNumFVarValuesTotal(OpenSubdiv::v3_1_1::Far::TopologyRefiner *this, int a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;

  v2 = *((_QWORD *)this + 5);
  if ((int)((unint64_t)(*((_QWORD *)this + 6) - v2) >> 3) < 1)
    return 0;
  v5 = 0;
  LODWORD(v6) = 0;
  do
  {
    v6 = OpenSubdiv::v3_1_1::Vtr::internal::Level::getNumFVarValues(*(OpenSubdiv::v3_1_1::Vtr::internal::Level **)(v2 + 8 * v5++), a2)+ v6;
    v2 = *((_QWORD *)this + 5);
  }
  while (v5 < (int)((unint64_t)(*((_QWORD *)this + 6) - v2) >> 3));
  return v6;
}

void OpenSubdiv::v3_1_1::Far::TopologyRefiner::RefineUniform(unsigned int *a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  const char *v10;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v17;
  uint64_t v18;
  OpenSubdiv::v3_1_1::Vtr::internal::Level *v19;
  std::vector<unsigned int> *v20;
  int TopologicalSplitType;
  char v22;

  if (!*(_DWORD *)(**((_QWORD **)a1 + 5) + 8))
  {
    v10 = "Failure in TopologyRefiner::RefineUniform() -- base level is uninitialized.";
    goto LABEL_5;
  }
  if (*((_QWORD *)a1 + 9) != *((_QWORD *)a1 + 8))
  {
    v10 = "Failure in TopologyRefiner::RefineUniform() -- previous refinements already applied.";
LABEL_5:
    OpenSubdiv::v3_1_1::Far::Error(4, (uint64_t)v10, a3, a4, a5, a6, a7, a8, a9);
    return;
  }
  *((_BYTE *)a1 + 12) = a2;
  v22 = a2;
  v12 = a2 & 0xF;
  *((_BYTE *)a1 + 8) = a1[2] & 0xC3 | (4 * (a2 & 0xF)) | 1;
  TopologicalSplitType = OpenSubdiv::v3_1_1::Sdc::SchemeTypeTraits::GetTopologicalSplitType((OpenSubdiv::v3_1_1::Sdc *)*a1);
  if (v12)
  {
    v13 = 0;
    v14 = (a2 >> 3) & 2;
    v15 = 8 * (a2 & 0xF);
    do
    {
      if (v15 - 8 == v13 && (v22 & 0x20) == 0)
        v17 = 4;
      else
        v17 = 0;
      v18 = *(_QWORD *)(*((_QWORD *)a1 + 5) + v13);
      v19 = (OpenSubdiv::v3_1_1::Vtr::internal::Level *)operator new();
      OpenSubdiv::v3_1_1::Vtr::internal::Level::Level(v19);
      v20 = (std::vector<unsigned int> *)operator new();
      if (TopologicalSplitType)
        OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::TriRefinement((uint64_t)v20, v18, (uint64_t)v19, (int *)a1 + 1);
      else
        OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::QuadRefinement((uint64_t)v20, v18, (uint64_t)v19, (int *)a1 + 1);
      OpenSubdiv::v3_1_1::Vtr::internal::Refinement::refine(v20, v17 | v14);
      OpenSubdiv::v3_1_1::Far::TopologyRefiner::appendLevel((OpenSubdiv::v3_1_1::Far::TopologyRefiner *)a1, v19);
      OpenSubdiv::v3_1_1::Far::TopologyRefiner::appendRefinement((OpenSubdiv::v3_1_1::Far::TopologyRefiner *)a1, (OpenSubdiv::v3_1_1::Vtr::internal::Refinement *)v20);
      v13 += 8;
    }
    while (v15 != v13);
  }
  OpenSubdiv::v3_1_1::Far::TopologyRefiner::assembleFarLevels((OpenSubdiv::v3_1_1::Far::TopologyRefiner *)a1);
}

uint64_t OpenSubdiv::v3_1_1::Far::internal::FeatureMask::InitializeFeatures(uint64_t result, _WORD *a2, OpenSubdiv::v3_1_1::Sdc *a3)
{
  _WORD *v4;
  int v5;
  _BOOL4 v6;
  int v7;
  int v8;
  unsigned int v9;
  unsigned int v10;

  v4 = (_WORD *)result;
  v5 = 15;
  if ((*a2 & 0x100) != 0)
  {
    result = OpenSubdiv::v3_1_1::Sdc::SchemeTypeTraits::GetRegularFaceSize(a3);
    v6 = result == 4;
    if ((_DWORD)result == 4)
      v5 = 11;
    else
      v5 = 15;
  }
  else
  {
    v6 = 0;
  }
  v7 = v5 | *v4 & 0xFFF0;
  *v4 = v5 | *v4 & 0xFFF0;
  if (v6 | ((unsigned __int16)(*a2 & 0x200) >> 9))
    v8 = 0;
  else
    v8 = 16;
  v9 = v8 | v7 & 0xFFFFFFEF;
  *v4 = v9;
  v10 = (v9 & 0xFFFFFC1F | ((unsigned __int16)*a2 >> 4) & 0x20) ^ 0x3E0;
  *v4 = v10;
  *v4 = v10 & 0xFBFF | *a2 & 0x400;
  return result;
}

void OpenSubdiv::v3_1_1::Far::TopologyRefiner::RefineAdaptive(unsigned int *a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  const char *v11;
  unsigned int v12;
  unsigned int v13;
  __int16 v14;
  unint64_t v15;
  uint64_t *v16;
  unint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  int TopologicalSplitType;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  OpenSubdiv::v3_1_1::Vtr::internal::Level *v27;
  OpenSubdiv::v3_1_1::Vtr::internal::Refinement *v28;
  int v29;
  int *v30;
  uint64_t v31;
  OpenSubdiv::v3_1_1::Vtr::internal::Refinement *v32;
  char v33;
  int v34;
  int v35;
  int v36;

  v36 = a2;
  if (!*(_DWORD *)(**((_QWORD **)a1 + 5) + 8))
  {
    v11 = "Failure in TopologyRefiner::RefineAdaptive() -- base level is uninitialized.";
    goto LABEL_30;
  }
  if (*((_QWORD *)a1 + 9) != *((_QWORD *)a1 + 8))
  {
    v11 = "Failure in TopologyRefiner::RefineAdaptive() -- previous refinements already applied.";
LABEL_30:
    OpenSubdiv::v3_1_1::Far::Error(4, (uint64_t)v11, a3, a4, a5, a6, a7, a8, a9);
    return;
  }
  if (*a1 != 1)
  {
    v11 = "Failure in TopologyRefiner::RefineAdaptive() -- currently only supported for Catmark scheme.";
    goto LABEL_30;
  }
  *((_BYTE *)a1 + 8) &= ~1u;
  *((_WORD *)a1 + 8) = a2;
  v12 = a2 >> 4;
  v13 = a2 & 0xF;
  OpenSubdiv::v3_1_1::Far::internal::FeatureMask::InitializeFeatures((uint64_t)&v35, &v36, (OpenSubdiv::v3_1_1::Sdc *)1);
  v34 = v35;
  v14 = v35;
  if (v13 >= v12)
    v15 = v12;
  else
    v15 = v13;
  if (v13 > v12)
  {
    v14 = v35 & 0xFFFC;
    LOWORD(v34) = v35 & 0xFFFC;
    if ((a2 & 0x200) != 0)
    {
      v14 = v35 & 0xFF0C;
      LOWORD(v34) = v35 & 0xFF0C;
    }
  }
  if ((v35 & 0x400) != 0)
  {
    v16 = *(uint64_t **)(**((_QWORD **)a1 + 5) + 456);
    v17 = *(_QWORD *)(**((_QWORD **)a1 + 5) + 464) - (_QWORD)v16;
    if ((int)(v17 >> 3) < 1)
      goto LABEL_17;
    v18 = 0;
    v19 = (v17 >> 3);
    do
    {
      v20 = *v16++;
      v18 |= *(_BYTE *)(v20 + 12) == 0;
      --v19;
    }
    while (v19);
    if ((v18 & 1) == 0)
    {
LABEL_17:
      LOWORD(v35) = v35 & 0xFBFF;
      LOWORD(v34) = v14 & 0xFBFF;
    }
  }
  TopologicalSplitType = OpenSubdiv::v3_1_1::Sdc::SchemeTypeTraits::GetTopologicalSplitType((OpenSubdiv::v3_1_1::Sdc *)*a1);
  if (v13)
  {
    v22 = TopologicalSplitType;
    v23 = 0;
    v24 = (a2 >> 10) & 2 | 1;
    v25 = a2 & 0xF;
    while (1)
    {
      v26 = *(_QWORD *)(*((_QWORD *)a1 + 5) + 8 * v23);
      v27 = (OpenSubdiv::v3_1_1::Vtr::internal::Level *)operator new();
      OpenSubdiv::v3_1_1::Vtr::internal::Level::Level(v27);
      v28 = (OpenSubdiv::v3_1_1::Vtr::internal::Refinement *)operator new();
      if (v22)
        OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::TriRefinement((uint64_t)v28, v26, (uint64_t)v27, (int *)a1 + 1);
      else
        OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::QuadRefinement((uint64_t)v28, v26, (uint64_t)v27, (int *)a1 + 1);
      v32 = v28;
      v33 = 0;
      v30 = v23 + 1 <= v15 ? &v35 : &v34;
      OpenSubdiv::v3_1_1::Far::TopologyRefiner::selectFeatureAdaptiveComponents(v29, &v32, v30);
      if (!v33)
        break;
      OpenSubdiv::v3_1_1::Vtr::internal::Refinement::refine((std::vector<unsigned int> *)v28, v24);
      OpenSubdiv::v3_1_1::Far::TopologyRefiner::appendLevel((OpenSubdiv::v3_1_1::Far::TopologyRefiner *)a1, v27);
      OpenSubdiv::v3_1_1::Far::TopologyRefiner::appendRefinement((OpenSubdiv::v3_1_1::Far::TopologyRefiner *)a1, v28);
      if (v25 == ++v23)
        goto LABEL_32;
    }
    (*(void (**)(OpenSubdiv::v3_1_1::Vtr::internal::Refinement *))(*(_QWORD *)v28 + 8))(v28);
    OpenSubdiv::v3_1_1::Vtr::internal::Level::~Level(v27);
    MEMORY[0x1DF0D41C0](v31);
  }
LABEL_32:
  *((_BYTE *)a1 + 8) = ((a1[18] - a1[16]) >> 1) & 0x3C | a1[2] & 0xC3;
  OpenSubdiv::v3_1_1::Far::TopologyRefiner::assembleFarLevels((OpenSubdiv::v3_1_1::Far::TopologyRefiner *)a1);
}

void OpenSubdiv::v3_1_1::Far::TopologyRefiner::selectFeatureAdaptiveComponents(int a1, OpenSubdiv::v3_1_1::Vtr::internal::Refinement **this, _DWORD *a3)
{
  int *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int *v22;
  unsigned __int16 *v23;
  uint64_t v24;
  int v25;
  unsigned int v26;
  unsigned int v27;
  int v28;
  int v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int *v36;
  int v37;
  int isSingleCreasePatch;
  unsigned __int16 *v39;
  __int16 v40;
  int v41;
  int v42;
  int v43;
  uint64_t v44;
  unsigned __int16 v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  if (*a3)
  {
    v4 = (int *)*((_QWORD *)*this + 1);
    v5 = (*a3 & 0x400) != 0 ? (*((_QWORD *)v4 + 58) - *((_QWORD *)v4 + 57)) >> 3 : 0;
    if (*v4 >= 1)
    {
      v6 = 0;
      v7 = v4[3];
      v42 = v7;
      v43 = *((_DWORD *)*this + 8);
      do
      {
        if ((*(_BYTE *)(*((_QWORD *)v4 + 12) + v6) & 1) != 0)
          goto LABEL_72;
        v8 = *((_QWORD *)v4 + 3);
        v9 = 2 * v6;
        if (!v7)
        {
          v10 = *(unsigned int *)(v8 + 8 * v6);
          if ((_DWORD)v10 != v43)
          {
            if ((int)v10 >= 1)
            {
              v31 = 0;
              v32 = *((_QWORD *)v4 + 6) + 4 * *(int *)(v8 + ((8 * v6) | 4));
              do
              {
                v33 = *(int *)(v32 + 4 * v31);
                v34 = *((_QWORD *)v4 + 33);
                v35 = *(unsigned int *)(v34 + 8 * (_DWORD)v33);
                if ((int)v35 >= 1)
                {
                  v36 = (int *)(*((_QWORD *)v4 + 36) + 4 * *(int *)(v34 + 8 * v33 + 4));
                  do
                  {
                    v37 = *v36++;
                    OpenSubdiv::v3_1_1::Vtr::internal::SparseSelector::selectFace(this, v37);
                    --v35;
                  }
                  while (v35);
                }
                ++v31;
              }
              while (v31 != v10);
            }
            goto LABEL_72;
          }
        }
        v11 = *(unsigned int *)(v8 + 8 * v6);
        OpenSubdiv::v3_1_1::Vtr::internal::Level::getFaceVTags(v4, v6, &v46, 0xFFFFFFFF);
        v12 = OpenSubdiv::v3_1_1::Vtr::internal::Level::VTag::BitwiseOr(&v46, v11);
        if ((v12 & 0x800) != 0)
          goto LABEL_16;
        if ((v12 & 1) != 0 && (*(_WORD *)a3 & 0x200) != 0)
          goto LABEL_71;
        if ((v12 & 2) != 0 && (*(_WORD *)a3 & 1) != 0)
        {
          if ((v12 & 0x780) == 0x80)
            goto LABEL_71;
          if (v4[3] <= 1 && (int)v11 >= 1)
          {
            v39 = &v46;
            do
            {
              v40 = *v39++;
              if ((v40 & 0x782) == 0x82)
                goto LABEL_71;
              --v11;
            }
            while (v11);
          }
        }
        if ((v12 & 0x780) == 0x80)
        {
LABEL_16:
          LOWORD(v13) = *(_WORD *)a3;
          goto LABEL_17;
        }
        if ((v12 & 0x80) == 0)
          goto LABEL_71;
        if ((v12 & 0x60) != 0)
        {
          if ((~*(unsigned __int16 *)a3 & 0xC) == 0)
            goto LABEL_71;
          isSingleCreasePatch = OpenSubdiv::v3_1_1::Vtr::internal::Level::isSingleCreasePatch((OpenSubdiv::v3_1_1::Vtr::internal::Level *)v4, v6, 0, 0);
          LOWORD(v13) = *(_WORD *)a3;
          if (isSingleCreasePatch)
          {
            if ((v13 & 4) != 0)
              goto LABEL_71;
          }
          else if ((v13 & 8) != 0)
          {
            goto LABEL_71;
          }
        }
        else
        {
          if ((v12 & 0x1010) == 0)
            goto LABEL_16;
          if ((v12 & 0x4000) != 0)
          {
            if (((v12 >> 7) & 0xF) >= 8)
            {
              LOWORD(v13) = *(_WORD *)a3;
              if ((*(_WORD *)a3 & 0x100) != 0)
                goto LABEL_71;
            }
            else if (((v12 >> 7) & 4) != 0)
            {
              v13 = *(unsigned __int16 *)a3;
              if ((v12 & 4) != 0)
                v41 = 2;
              else
                v41 = 128;
              if ((v13 & v41) != 0)
                goto LABEL_71;
            }
            else
            {
              if (((v12 >> 7) & 2) == 0)
                goto LABEL_16;
              LOWORD(v13) = *(_WORD *)a3;
              if ((*(_WORD *)a3 & 0x40) != 0)
                goto LABEL_71;
            }
          }
          else
          {
            if ((v12 & 4) != 0)
            {
              if ((v12 & 0x400) == 0)
                goto LABEL_16;
              LOWORD(v13) = *(_WORD *)a3;
              if ((v12 & 8) != 0)
                goto LABEL_17;
            }
            else
            {
              LOWORD(v13) = *(_WORD *)a3;
              if ((v12 & 0x400) == 0)
              {
                if ((v13 & 0x10) != 0)
                  goto LABEL_71;
                goto LABEL_17;
              }
            }
            if ((v13 & 0x20) != 0)
              goto LABEL_71;
          }
        }
LABEL_17:
        if ((v13 & 0x400) != 0 && (int)v5 >= 1)
        {
          v14 = 0;
          LOBYTE(v15) = 0;
          v44 = v9 | 1;
          while (1)
          {
            if (OpenSubdiv::v3_1_1::Vtr::internal::Level::doesFaceFVarTopologyMatch((OpenSubdiv::v3_1_1::Vtr::internal::Level *)v4, v6, v14))
            {
              goto LABEL_53;
            }
            v16 = *((_QWORD *)v4 + 3);
            v17 = *(int *)(v16 + 4 * v44);
            v18 = *((_QWORD *)v4 + 6);
            v19 = *(unsigned int *)(v16 + 4 * v9);
            if (OpenSubdiv::v3_1_1::Vtr::internal::Level::doesFaceFVarTopologyMatch((OpenSubdiv::v3_1_1::Vtr::internal::Level *)v4, v6, v14))
            {
              OpenSubdiv::v3_1_1::Far::TopologyRefiner::selectFeatureAdaptiveComponents();
            }
            v20 = v5;
            v21 = v9;
            if ((int)v19 >= 1)
            {
              v22 = (int *)(v18 + 4 * v17);
              v23 = &v46;
              v24 = v19;
              do
              {
                v25 = *v22++;
                *v23++ = OpenSubdiv::v3_1_1::Vtr::internal::Level::getVertexCompositeFVarVTag((OpenSubdiv::v3_1_1::Vtr::internal::Level *)v4, v25, v14);
                --v24;
              }
              while (v24);
            }
            v26 = OpenSubdiv::v3_1_1::Vtr::internal::Level::VTag::BitwiseOr(&v46, v19);
            if ((v26 & 1) != 0 && (*(_WORD *)a3 & 0x200) != 0)
            {
              LOBYTE(v15) = 1;
              v9 = v21;
LABEL_38:
              v5 = v20;
              goto LABEL_53;
            }
            if ((v26 & 2) != 0)
            {
              LOBYTE(v15) = 1;
              v9 = v21;
              if ((v26 & 0x80) == 0)
                goto LABEL_38;
              v5 = v20;
              if ((*(_WORD *)a3 & 1) != 0)
                goto LABEL_53;
            }
            else
            {
              v9 = v21;
              v5 = v20;
              if ((v26 & 0x80) == 0)
              {
                LOBYTE(v15) = 1;
                goto LABEL_53;
              }
            }
            if ((v26 & 0x4000) == 0)
              break;
            if (((v26 >> 7) & 0xF) < 8)
            {
              if (((v26 >> 7) & 4) != 0)
              {
                if ((v26 & 4) != 0)
                  v30 = 2;
                else
                  v30 = 128;
                LOBYTE(v15) = (unsigned __int16)(*(_WORD *)a3 & v30) != 0;
                goto LABEL_53;
              }
              if (((v26 >> 7) & 2) != 0)
              {
                v15 = (*(unsigned __int16 *)a3 >> 6) & 1;
                goto LABEL_53;
              }
              goto LABEL_44;
            }
            v15 = HIBYTE(*(unsigned __int16 *)a3) & 1;
LABEL_53:
            if ((v15 & 1) == 0 && ++v14 < (int)v5)
              continue;
            v7 = v42;
            if ((v15 & 1) == 0)
              goto LABEL_72;
LABEL_71:
            OpenSubdiv::v3_1_1::Vtr::internal::SparseSelector::selectFace(this, v6);
            goto LABEL_72;
          }
          if ((v26 & 4) == 0)
          {
            v27 = *(unsigned __int16 *)a3;
            v28 = (v27 >> 4) & 1;
            v29 = (v27 >> 5) & 1;
            if ((v26 & 0x400) != 0)
              LOBYTE(v15) = v29;
            else
              LOBYTE(v15) = v28;
            goto LABEL_53;
          }
          if ((v26 & 0x400) != 0)
          {
            LOBYTE(v15) = (v26 & 8) == 0 && (*(_WORD *)a3 & 0x20) != 0;
            goto LABEL_53;
          }
LABEL_44:
          LOBYTE(v15) = 0;
          goto LABEL_53;
        }
LABEL_72:
        ++v6;
      }
      while (v6 < *v4);
    }
  }
}

void std::vector<OpenSubdiv::v3_1_1::Far::TopologyLevel>::__append(char **a1, unint64_t a2)
{
  uint64_t v4;
  char *v5;
  char *v6;
  char *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  char *v12;
  char *v13;
  char *v14;
  char *v15;
  __int128 v16;

  v4 = (uint64_t)(a1 + 2);
  v5 = a1[2];
  v6 = a1[1];
  if (0xAAAAAAAAAAAAAAABLL * ((v5 - v6) >> 3) >= a2)
  {
    a1[1] = &v6[24 * (24 * a2 / 0x18)];
  }
  else
  {
    v7 = *a1;
    v8 = 0xAAAAAAAAAAAAAAABLL * ((v6 - *a1) >> 3);
    v9 = v8 + a2;
    if (v8 + a2 > 0xAAAAAAAAAAAAAAALL)
      abort();
    v10 = 0xAAAAAAAAAAAAAAABLL * ((v5 - v7) >> 3);
    if (2 * v10 > v9)
      v9 = 2 * v10;
    if (v10 >= 0x555555555555555)
      v11 = 0xAAAAAAAAAAAAAAALL;
    else
      v11 = v9;
    if (v11)
    {
      v12 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::string>>(v4, v11);
      v7 = *a1;
      v6 = a1[1];
    }
    else
    {
      v12 = 0;
    }
    v13 = &v12[24 * v8];
    v14 = &v12[24 * v11];
    v15 = &v13[24 * (24 * a2 / 0x18)];
    if (v6 != v7)
    {
      do
      {
        v16 = *(_OWORD *)(v6 - 24);
        *((_QWORD *)v13 - 1) = *((_QWORD *)v6 - 1);
        *(_OWORD *)(v13 - 24) = v16;
        v13 -= 24;
        v6 -= 24;
      }
      while (v6 != v7);
      v7 = *a1;
    }
    *a1 = v13;
    a1[1] = v15;
    a1[2] = v14;
    if (v7)
      operator delete(v7);
  }
}

void OpenSubdiv::v3_1_1::Far::TopologyRefiner::initializeInventory()
{
  __assert_rtn("initializeInventory", "topologyRefiner.cpp", 103, "_levels.size() == 1");
}

void OpenSubdiv::v3_1_1::Far::TopologyRefiner::selectFeatureAdaptiveComponents()
{
  __assert_rtn("doesFaceHaveDistinctFaceVaryingFeatures", "topologyRefiner.cpp", 618, "!level.doesFaceFVarTopologyMatch(face, fvarChannel)");
}

double OpenSubdiv::v3_1_1::Far::EndCapLegacyGregoryPatchFactory::EndCapLegacyGregoryPatchFactory(OpenSubdiv::v3_1_1::Far::EndCapLegacyGregoryPatchFactory *this, const OpenSubdiv::v3_1_1::Far::TopologyRefiner *a2)
{
  double result;

  *(_QWORD *)this = a2;
  result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  *(_OWORD *)((char *)this + 88) = 0u;
  return result;
}

char *OpenSubdiv::v3_1_1::Far::EndCapLegacyGregoryPatchFactory::GetPatchPoints(_QWORD *a1, OpenSubdiv::v3_1_1::Vtr::internal::Level *this, int a3, int a4, int a5, int a6)
{
  int *FaceFVarValues;
  int *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char **v15;
  void **v16;
  _QWORD *v17;
  int v18;
  char *v19;
  char *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char *v25;
  char *v26;
  int v27;
  unint64_t v28;
  char *v29;
  _DWORD *v30;
  char *v31;
  void **v32;
  _QWORD *v33;
  int v34;
  char *v35;
  char *v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  char *v41;
  char *v42;
  int v43;
  unint64_t v44;
  char *v45;
  _DWORD *v46;
  char *v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  unint64_t v51;
  char *v52;
  char *v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  unint64_t v57;
  char *v58;
  int *v59;
  char *v60;
  int v61;
  int *v62;
  char *v63;
  int v64;
  int v66;
  int *v67[2];

  if (a6 < 0)
  {
    v12 = *((_QWORD *)this + 3);
    FaceFVarValues = (int *)(*((_QWORD *)this + 6) + 4 * *(int *)(v12 + 8 * a3 + 4));
    v11 = (int *)*(unsigned int *)(v12 + 8 * a3);
  }
  else
  {
    FaceFVarValues = (int *)OpenSubdiv::v3_1_1::Vtr::internal::Level::getFaceFVarValues(this, a3, a6);
  }
  v66 = a3;
  v67[0] = FaceFVarValues;
  v67[1] = v11;
  v13 = 0;
  if ((OpenSubdiv::v3_1_1::Vtr::internal::Level::getFaceCompositeVTag((uint64_t)this, v67) & 4) != 0)
  {
    v15 = (char **)(a1 + 5);
    v31 = (char *)a1[5];
    v32 = (void **)(a1 + 4);
    v33 = a1 + 6;
    do
    {
      v34 = v67[0][v13] + a5;
      if ((unint64_t)v31 >= *v33)
      {
        v36 = (char *)*v32;
        v37 = (v31 - (_BYTE *)*v32) >> 2;
        v38 = v37 + 1;
        if ((unint64_t)(v37 + 1) >> 62)
          goto LABEL_76;
        v39 = *v33 - (_QWORD)v36;
        if (v39 >> 1 > v38)
          v38 = v39 >> 1;
        if ((unint64_t)v39 >= 0x7FFFFFFFFFFFFFFCLL)
          v40 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v40 = v38;
        if (v40)
        {
          v41 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<float>>((uint64_t)(a1 + 6), v40);
          v31 = *v15;
          v36 = (char *)*v32;
        }
        else
        {
          v41 = 0;
        }
        v42 = &v41[4 * v37];
        *(_DWORD *)v42 = v34;
        v35 = v42 + 4;
        while (v31 != v36)
        {
          v43 = *((_DWORD *)v31 - 1);
          v31 -= 4;
          *((_DWORD *)v42 - 1) = v43;
          v42 -= 4;
        }
        *v32 = v42;
        *v15 = v35;
        *v33 = &v41[4 * v40];
        if (v36)
          operator delete(v36);
      }
      else
      {
        *(_DWORD *)v31 = v34;
        v35 = v31 + 4;
      }
      *v15 = v35;
      ++v13;
      v31 = v35;
    }
    while (v13 != 4);
    v44 = a1[12];
    v45 = (char *)a1[11];
    if ((unint64_t)v45 >= v44)
    {
      v53 = (char *)a1[10];
      v54 = (v45 - v53) >> 2;
      v55 = v54 + 1;
      if ((unint64_t)(v54 + 1) >> 62)
        goto LABEL_76;
      v56 = v44 - (_QWORD)v53;
      if (v56 >> 1 > v55)
        v55 = v56 >> 1;
      if ((unint64_t)v56 >= 0x7FFFFFFFFFFFFFFCLL)
        v57 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v57 = v55;
      if (v57)
      {
        v58 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<float>>((uint64_t)(a1 + 12), v57);
        v53 = (char *)a1[10];
        v45 = (char *)a1[11];
      }
      else
      {
        v58 = 0;
      }
      v62 = (int *)&v58[4 * v54];
      v63 = &v58[4 * v57];
      *v62 = v66;
      v46 = v62 + 1;
      while (v45 != v53)
      {
        v64 = *((_DWORD *)v45 - 1);
        v45 -= 4;
        *--v62 = v64;
      }
      a1[10] = v62;
      a1[11] = v46;
      a1[12] = v63;
      if (v53)
        operator delete(v53);
    }
    else
    {
      *(_DWORD *)v45 = v66;
      v46 = v45 + 4;
    }
    a1[11] = v46;
    return *v15 - 16;
  }
  v15 = (char **)(a1 + 2);
  v14 = (char *)a1[2];
  v16 = (void **)(a1 + 1);
  v17 = a1 + 3;
  do
  {
    v18 = v67[0][v13] + a5;
    if ((unint64_t)v14 >= *v17)
    {
      v20 = (char *)*v16;
      v21 = (v14 - (_BYTE *)*v16) >> 2;
      v22 = v21 + 1;
      if ((unint64_t)(v21 + 1) >> 62)
        goto LABEL_76;
      v23 = *v17 - (_QWORD)v20;
      if (v23 >> 1 > v22)
        v22 = v23 >> 1;
      if ((unint64_t)v23 >= 0x7FFFFFFFFFFFFFFCLL)
        v24 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v24 = v22;
      if (v24)
      {
        v25 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<float>>((uint64_t)(a1 + 3), v24);
        v14 = *v15;
        v20 = (char *)*v16;
      }
      else
      {
        v25 = 0;
      }
      v26 = &v25[4 * v21];
      *(_DWORD *)v26 = v18;
      v19 = v26 + 4;
      while (v14 != v20)
      {
        v27 = *((_DWORD *)v14 - 1);
        v14 -= 4;
        *((_DWORD *)v26 - 1) = v27;
        v26 -= 4;
      }
      *v16 = v26;
      *v15 = v19;
      *v17 = &v25[4 * v24];
      if (v20)
        operator delete(v20);
    }
    else
    {
      *(_DWORD *)v14 = v18;
      v19 = v14 + 4;
    }
    *v15 = v19;
    ++v13;
    v14 = v19;
  }
  while (v13 != 4);
  v28 = a1[9];
  v29 = (char *)a1[8];
  if ((unint64_t)v29 >= v28)
  {
    v47 = (char *)a1[7];
    v48 = (v29 - v47) >> 2;
    v49 = v48 + 1;
    if (!((unint64_t)(v48 + 1) >> 62))
    {
      v50 = v28 - (_QWORD)v47;
      if (v50 >> 1 > v49)
        v49 = v50 >> 1;
      if ((unint64_t)v50 >= 0x7FFFFFFFFFFFFFFCLL)
        v51 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v51 = v49;
      if (v51)
      {
        v52 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<float>>((uint64_t)(a1 + 9), v51);
        v47 = (char *)a1[7];
        v29 = (char *)a1[8];
      }
      else
      {
        v52 = 0;
      }
      v59 = (int *)&v52[4 * v48];
      v60 = &v52[4 * v51];
      *v59 = v66;
      v30 = v59 + 1;
      while (v29 != v47)
      {
        v61 = *((_DWORD *)v29 - 1);
        v29 -= 4;
        *--v59 = v61;
      }
      a1[7] = v59;
      a1[8] = v30;
      a1[9] = v60;
      if (v47)
        operator delete(v47);
      goto LABEL_67;
    }
LABEL_76:
    abort();
  }
  *(_DWORD *)v29 = v66;
  v30 = v29 + 4;
LABEL_67:
  a1[8] = v30;
  return *v15 - 16;
}

void OpenSubdiv::v3_1_1::Far::EndCapLegacyGregoryPatchFactory::Finalize(_QWORD *a1, int a2, std::vector<unsigned int> *this, std::vector<unsigned int> *a4, unsigned int *a5)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  OpenSubdiv::v3_1_1::Far *v14;
  std::vector<unsigned int>::pointer begin;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  OpenSubdiv::v3_1_1::Vtr::internal::Level *v26;
  int v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  std::vector<unsigned int>::pointer v31;
  int *v32;
  int v33;
  uint64_t v34;
  std::vector<unsigned int>::pointer v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  _QWORD *v41;
  uint64_t v43;

  v8 = a1;
  v10 = a1[7];
  v9 = a1[8];
  v11 = v9 - v10;
  v37 = a1[10];
  v39 = a1[11];
  v12 = (v39 - v37) >> 2;
  v13 = v12 + ((v9 - v10) >> 2);
  v14 = *(OpenSubdiv::v3_1_1::Far **)(*(_QWORD *)(*a1 + 40)
                                    + 8 * (((unint64_t)*(unsigned __int8 *)(*a1 + 8) >> 2) & 0xF));
  std::vector<int>::resize(this, 4 * v13);
  if (v13)
  {
    begin = this->__begin_;
    if (v9 != v10)
    {
      v16 = 0;
      if ((unint64_t)(v11 >> 2) <= 1)
        v17 = 1;
      else
        v17 = v11 >> 2;
      do
      {
        OpenSubdiv::v3_1_1::Far::getQuadOffsets(v14, (const OpenSubdiv::v3_1_1::Vtr::internal::Level *)*(unsigned int *)(v8[7] + 4 * v16), (uint64_t)begin, a5);
        begin += 4;
        ++v16;
      }
      while (v17 != v16);
    }
    if (v39 != v37)
    {
      v18 = 0;
      if (v12 <= 1)
        v12 = 1;
      do
      {
        OpenSubdiv::v3_1_1::Far::getQuadOffsets(v14, (const OpenSubdiv::v3_1_1::Vtr::internal::Level *)*(unsigned int *)(v8[10] + 4 * v18), (uint64_t)begin, a5);
        begin += 4;
        ++v18;
      }
      while (v12 != v18);
    }
  }
  v19 = (2 * a2) | 1;
  std::vector<int>::resize(a4, *(int *)(*v8 + 20) * v19);
  v20 = 0;
  v21 = 0;
  v22 = ((unint64_t)*(unsigned __int8 *)(*v8 + 8) >> 2) & 0xF;
  v23 = (int)v19;
  v24 = (v22 + 1);
  v25 = (8 * ((unint64_t)(2 * a2) >> 1)) | 4;
  v40 = v22;
  v41 = v8;
  v38 = v24;
  do
  {
    v26 = *(OpenSubdiv::v3_1_1::Vtr::internal::Level **)(*(_QWORD *)(*v8 + 40) + 8 * v20);
    v27 = *((_DWORD *)v26 + 2);
    if (v20 == v22 && v27 >= 1)
    {
      v43 = v20;
      v28 = 0;
      v29 = v21 * (int)v23;
      v30 = 4 * v29 + 4;
      do
      {
        v31 = a4->__begin_;
        v32 = (int *)&a4->__begin_[v29];
        *v32 = 0;
        v33 = OpenSubdiv::v3_1_1::Vtr::internal::Level::gatherQuadRegularRingAroundVertex(v26, v28, v32 + 1, 0xFFFFFFFF);
        if (v33 >= 1)
        {
          v34 = v33;
          v35 = (std::vector<unsigned int>::pointer)((char *)v31 + v30);
          do
          {
            *v35++ += v21;
            --v34;
          }
          while (v34);
        }
        if ((v33 & 1) != 0)
        {
          v32[v33 + 1] = v32[v33];
          v33 = ~v33;
        }
        if (v33 >= 0)
          v36 = v33;
        else
          v36 = v33 + 1;
        *v32 = v36 >> 1;
        v29 += v23;
        ++v28;
        v27 = *((_DWORD *)v26 + 2);
        v30 += v25;
      }
      while (v28 < v27);
      v8 = v41;
      v20 = v43;
      v24 = v38;
      v22 = v40;
    }
    v21 += v27;
    ++v20;
  }
  while (v20 != v24);
}

uint64_t OpenSubdiv::v3_1_1::Far::getQuadOffsets(OpenSubdiv::v3_1_1::Far *this, const OpenSubdiv::v3_1_1::Vtr::internal::Level *a2, uint64_t a3, unsigned int *a4)
{
  int v5;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;

  v5 = (int)a2;
  if ((a4 & 0x80000000) != 0)
    result = *((_QWORD *)this + 6) + 4 * *(int *)(*((_QWORD *)this + 3) + 4 * ((2 * (int)a2) | 1));
  else
    result = OpenSubdiv::v3_1_1::Vtr::internal::Level::getFaceFVarValues(this, (int)a2, (int)a4);
  v8 = 0;
  v9 = *((_QWORD *)this + 36);
  v10 = *((_QWORD *)this + 33);
  v11 = *((_QWORD *)this + 42);
  do
  {
    v12 = *(int *)(result + 4 * v8);
    v13 = 2 * v12;
    v14 = *(unsigned int *)(v10 + 8 * (_DWORD)v12);
    if ((int)v14 < 1)
LABEL_12:
      OpenSubdiv::v3_1_1::Far::getQuadOffsets();
    v15 = 0;
    v16 = v9 + 4 * *(int *)(v10 + 8 * v12 + 4);
    v17 = *(_DWORD *)(v11 + 4 * v13);
    while (*(_DWORD *)(v16 + 4 * v15) != v5)
    {
      if (v14 == ++v15)
        goto LABEL_12;
    }
    *(_DWORD *)(a3 + 4 * v8++) = v15 | ((((int)v15 + 1) % v17) << 8);
  }
  while (v8 != 4);
  return result;
}

void OpenSubdiv::v3_1_1::Far::getQuadOffsets()
{
  __assert_rtn("getQuadOffsets", "endCapLegacyGregoryPatchFactory.cpp", 92, "thisFaceInVFaces != -1");
}

uint64_t OpenSubdiv::v3_1_1::Far::TopologyRefinerFactory<OpenSubdiv::v3_1_1::Far::TopologyDescriptor>::resizeComponentTopology(uint64_t a1, int *a2)
{
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  std::vector<unsigned int> *v7;
  char *begin;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _DWORD *v13;
  int v14;
  int v15;

  v4 = *a2;
  v5 = **(_QWORD **)(a1 + 40);
  *(_DWORD *)(v5 + 8) = v4;
  std::vector<int>::resize((std::vector<unsigned int> *)(v5 + 264), 2 * v4);
  std::vector<int>::resize((std::vector<unsigned int> *)(v5 + 336), 2 * v4);
  std::vector<float>::resize(v5 + 408, v4);
  std::vector<OpenSubdiv::v3_1_1::Vtr::internal::Level::VTag>::resize(v5 + 432, v4);
  bzero(*(void **)(v5 + 432), 2 * *(int *)(v5 + 8));
  v6 = a2[1];
  v7 = **(std::vector<unsigned int> ***)(a1 + 40);
  LODWORD(v7->__begin_) = v6;
  std::vector<int>::resize(v7 + 1, 2 * v6);
  begin = (char *)v7[4].__begin_;
  v9 = (char *)v7[4].__end_ - begin;
  if (v6 <= v9)
  {
    if (v6 < v9)
      v7[4].__end_ = (std::vector<unsigned int>::pointer)&begin[v6];
  }
  else
  {
    std::vector<OpenSubdiv::v3_1_1::Vtr::internal::Level::FTag>::__append((void **)&v7[4].__begin_, v6 - v9);
    begin = (char *)v7[4].__begin_;
  }
  bzero(begin, SLODWORD(v7->__begin_));
  if (a2[1] >= 1)
  {
    v10 = 0;
    v11 = *((_QWORD *)a2 + 1);
    v12 = **(_QWORD **)(a1 + 40);
    v13 = *(_DWORD **)(v12 + 24);
    do
    {
      v14 = *(_DWORD *)(v11 + 4 * v10);
      *v13 = v14;
      if (v10)
        v15 = *(v13 - 1) + *(v13 - 2);
      else
        v15 = 0;
      v13[1] = v15;
      if (*(_DWORD *)(v12 + 20) > v14)
        v14 = *(_DWORD *)(v12 + 20);
      *(_DWORD *)(v12 + 20) = v14;
      ++v10;
      v13 += 2;
    }
    while (v10 < a2[1]);
  }
  return 1;
}

uint64_t OpenSubdiv::v3_1_1::Far::TopologyRefinerFactory<OpenSubdiv::v3_1_1::Far::TopologyDescriptor>::assignComponentTopology(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  unsigned int *v9;
  uint64_t v10;
  _DWORD *v11;
  unint64_t v12;
  int *v13;
  int v14;
  int *v15;
  int v16;

  if (*(int *)(a2 + 4) >= 1)
  {
    v2 = 0;
    v3 = 0;
    v4 = **(_QWORD **)(a1 + 40);
    v5 = *(_QWORD *)(v4 + 24);
    v6 = *(_QWORD *)(v4 + 48);
    v7 = *(unsigned __int8 *)(a2 + 88);
    v8 = *(_QWORD *)(a2 + 16);
    do
    {
      v9 = (unsigned int *)(v5 + 8 * v2);
      v10 = *v9;
      v11 = (_DWORD *)(v6 + 4 * (int)v9[1]);
      if (v7)
      {
        *v11 = *(_DWORD *)(v8 + 4 * v3++);
        if ((int)v10 >= 2)
        {
          v12 = v10 + 1;
          v13 = (int *)(v8 + 4 * v3);
          do
          {
            v14 = *v13++;
            v11[(v12-- - 2)] = v14;
            ++v3;
          }
          while (v12 > 2);
        }
      }
      else if ((int)v10 >= 1)
      {
        v15 = (int *)(v8 + 4 * v3);
        v3 += v10;
        do
        {
          v16 = *v15++;
          *v11++ = v16;
          --v10;
        }
        while (v10);
      }
      ++v2;
    }
    while (v2 < *(int *)(a2 + 4));
  }
  return 1;
}

uint64_t OpenSubdiv::v3_1_1::Far::TopologyRefinerFactory<OpenSubdiv::v3_1_1::Far::TopologyDescriptor>::assignComponentTags(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  int *v6;
  int Edge;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char __str[1024];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (*(int *)(a2 + 24) >= 1)
  {
    v4 = *(_QWORD *)(a2 + 32);
    if (v4)
    {
      if (*(_QWORD *)(a2 + 40))
      {
        v5 = 0;
        v6 = (int *)(v4 + 4);
        do
        {
          Edge = OpenSubdiv::v3_1_1::Vtr::internal::Level::findEdge(**(OpenSubdiv::v3_1_1::Vtr::internal::Level ***)(a1 + 40), *(v6 - 1), *v6);
          if (Edge == -1)
          {
            snprintf(__str, 0x400uLL, "Edge %d specified to be sharp does not exist (%d, %d)", v5, *(v6 - 1), *v6);
            OpenSubdiv::v3_1_1::Far::Warning((OpenSubdiv::v3_1_1::Far *)"%s", v8, __str);
          }
          else
          {
            *(_DWORD *)(*(_QWORD *)(**(_QWORD **)(a1 + 40) + 216) + 4 * Edge) = *(_DWORD *)(*(_QWORD *)(a2 + 40)
                                                                                              + 4 * v5);
          }
          ++v5;
          v6 += 2;
        }
        while (v5 < *(int *)(a2 + 24));
      }
    }
  }
  if (*(int *)(a2 + 48) >= 1 && *(_QWORD *)(a2 + 56) && *(_QWORD *)(a2 + 64))
  {
    v9 = 0;
    do
    {
      v10 = *(unsigned int *)(*(_QWORD *)(a2 + 56) + 4 * v9);
      if ((v10 & 0x80000000) != 0 || (v11 = **(_QWORD **)(a1 + 40), (int)v10 >= *(_DWORD *)(v11 + 8)))
      {
        snprintf(__str, 0x400uLL, "Vertex %d specified to be sharp does not exist", *(_DWORD *)(*(_QWORD *)(a2 + 56) + 4 * v9));
        OpenSubdiv::v3_1_1::Far::Warning((OpenSubdiv::v3_1_1::Far *)"%s", v12, __str);
      }
      else
      {
        *(_DWORD *)(*(_QWORD *)(v11 + 408) + 4 * v10) = *(_DWORD *)(*(_QWORD *)(a2 + 64) + 4 * v9);
      }
      ++v9;
    }
    while (v9 < *(int *)(a2 + 48));
  }
  if (*(int *)(a2 + 72) >= 1)
  {
    v13 = 0;
    do
    {
      v14 = *(int *)(*(_QWORD *)(a2 + 80) + 4 * v13);
      v15 = *(_QWORD *)(**(_QWORD **)(a1 + 40) + 96);
      *(_BYTE *)(v15 + v14) |= 1u;
      *(_BYTE *)(a1 + 8) |= 2u;
      ++v13;
    }
    while (v13 < *(int *)(a2 + 72));
  }
  return 1;
}

uint64_t OpenSubdiv::v3_1_1::Far::TopologyRefinerFactory<OpenSubdiv::v3_1_1::Far::TopologyDescriptor>::reportInvalidTopology(uint64_t a1, const char *a2)
{
  return OpenSubdiv::v3_1_1::Far::Warning((OpenSubdiv::v3_1_1::Far *)"%s", a2, a2);
}

uint64_t OpenSubdiv::v3_1_1::Far::TopologyRefinerFactory<OpenSubdiv::v3_1_1::Far::TopologyDescriptor>::assignFaceVaryingTopology(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _WORD *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  _DWORD *FaceFVarValues;
  int v11;
  unint64_t v12;
  int *v13;
  int v14;
  uint64_t v15;
  int *v16;
  int v17;

  if (*(int *)(a2 + 92) >= 1)
  {
    v4 = 0;
    v5 = (_WORD *)(a1 + 4);
    do
    {
      v6 = *(_QWORD *)(a2 + 96) + 16 * v4;
      v7 = *(_QWORD *)(v6 + 8);
      OpenSubdiv::v3_1_1::Vtr::internal::Level::createFVarChannel(**(_QWORD ***)(a1 + 40), *(_DWORD *)v6, v5);
      if (*(int *)(a2 + 4) >= 1)
      {
        v8 = 0;
        v9 = 0;
        do
        {
          FaceFVarValues = (_DWORD *)OpenSubdiv::v3_1_1::Vtr::internal::Level::getFaceFVarValues(**(OpenSubdiv::v3_1_1::Vtr::internal::Level ***)(a1 + 40), v9, v4);
          if (*(_BYTE *)(a2 + 88))
          {
            *FaceFVarValues = *(_DWORD *)(v7 + 4 * v8++);
            if (v11 >= 2)
            {
              v12 = v11 + 1;
              v13 = (int *)(v7 + 4 * v8);
              do
              {
                v14 = *v13++;
                FaceFVarValues[(v12-- - 2)] = v14;
                ++v8;
              }
              while (v12 > 2);
            }
          }
          else if (v11 >= 1)
          {
            v15 = v11;
            v16 = (int *)(v7 + 4 * v8);
            v8 += v11;
            do
            {
              v17 = *v16++;
              *FaceFVarValues++ = v17;
              --v15;
            }
            while (v15);
          }
          ++v9;
        }
        while (v9 < *(_DWORD *)(a2 + 4));
      }
      ++v4;
    }
    while (v4 < *(int *)(a2 + 92));
  }
  return 1;
}

void OpenSubdiv::v3_1_1::Osd::CPUMTLVertexBuffer::~CPUMTLVertexBuffer(id *this)
{

}

BOOL OpenSubdiv::v3_1_1::Osd::CPUMTLVertexBuffer::allocate(OpenSubdiv::v3_1_1::Osd::CPUMTLVertexBuffer *this, MTLContext *a2)
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(a2->var0, "newBufferWithLength:options:", 4 * *((_DWORD *)this + 1) * *(_DWORD *)this, 0);
  v4 = v3;
  *((_QWORD *)this + 1) = v3;
  if (v3)
  {
    *((_BYTE *)this + 16) = 1;
    objc_msgSend(v3, "setLabel:", CFSTR("OSD VertexBuffer"));
  }
  return v4 != 0;
}

uint64_t OpenSubdiv::v3_1_1::Osd::CPUMTLVertexBuffer::Create(OpenSubdiv::v3_1_1::Osd::CPUMTLVertexBuffer *this, int a2, MTLContext *a3, MTLContext *a4)
{
  int v6;
  uint64_t v7;

  v6 = (int)this;
  v7 = operator new();
  *(_DWORD *)v7 = v6;
  *(_DWORD *)(v7 + 4) = a2;
  *(_QWORD *)(v7 + 8) = 0;
  *(_BYTE *)(v7 + 16) = 1;
  if (!OpenSubdiv::v3_1_1::Osd::CPUMTLVertexBuffer::allocate((OpenSubdiv::v3_1_1::Osd::CPUMTLVertexBuffer *)v7, a3))
  {

    MEMORY[0x1DF0D41C0](v7, 0x1080C40E0210B95);
    return 0;
  }
  return v7;
}

void sub_1DCFBCEB4(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1DF0D41C0](v1, 0x1080C40E0210B95);
  _Unwind_Resume(a1);
}

void *OpenSubdiv::v3_1_1::Osd::CPUMTLVertexBuffer::UpdateData(OpenSubdiv::v3_1_1::Osd::CPUMTLVertexBuffer *this, const float *a2, uint64_t a3, uint64_t a4, MTLContext *a5)
{
  *((_BYTE *)this + 16) = 1;
  return memcpy((void *)(objc_msgSend(*((id *)this + 1), "contents", a3, a4, a5) + 4 * *(_DWORD *)this * (int)a3), a2, 4 * *(_DWORD *)this * (int)a4);
}

uint64_t AnimCodec::AnimDecoder::getInfo(uint64_t a1, unint64_t a2, uint64_t a3)
{
  int v4;
  uint64_t v5;

  v5 = 0;
  return AnimCodec::AnimDecoder::getInfo(a1, a2, &v5, &v4, a3);
}

uint64_t AnimCodec::AnimDecoder::getInfo(uint64_t a1, unint64_t a2, uint64_t *a3, _DWORD *a4, uint64_t a5)
{
  uint64_t i;
  uint64_t j;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  int v21;
  int v22;
  int v24;

  if (a2 < 0x18)
    return 3;
  for (i = 0; i != 4; ++i)
  {
    *a3 = i + 1;
    *((_BYTE *)&v24 + i) = *(_BYTE *)(a1 + i);
  }
  if (v24 != 179426549)
    return 3;
  for (j = 0; j != 4; ++j)
  {
    *a3 = j + 5;
    *((_BYTE *)&v24 + j) = *(_BYTE *)(a1 + 4 + j);
  }
  v7 = 0;
  v8 = 0;
  *a4 = v24;
  *a3 = 9;
  *(_BYTE *)(a5 + 8) = *(_BYTE *)(a1 + 8);
  v9 = (*a3)++;
  *(_BYTE *)(a5 + 9) = *(_BYTE *)(a1 + v9);
  v10 = *a3;
  v11 = a1 + *a3;
  v12 = *a3 + 1;
  v13 = 1;
  do
  {
    *a3 = v12 + v7;
    v14 = v13;
    *((_BYTE *)&v24 + v8) = *(_BYTE *)(v11 + v7++);
    v8 = 1;
    v13 = 0;
  }
  while ((v14 & 1) != 0);
  v15 = 0;
  *(_WORD *)(a5 + 10) = v24;
  v16 = -v7;
  do
  {
    *a3 = v10 + v7 + 1 + v15;
    *((_BYTE *)&v24 + v15) = *(_BYTE *)(a1 + v10 + v15 + v7);
    ++v15;
    --v16;
  }
  while (v15 != 4);
  v17 = 0;
  *(_DWORD *)a5 = v24;
  v18 = -v16;
  do
  {
    *a3 = v10 + v18 + 1;
    v19 = *(_BYTE *)(a1 + v10 + v18++);
    *((_BYTE *)&v24 + v17++) = v19;
  }
  while (v17 != 4);
  *(_DWORD *)(a5 + 4) = v24;
  v20 = v10 + v18;
  *a3 = v20 + 1;
  v21 = *(unsigned __int8 *)(v20 + a1);
  *a3 = v20 + 2;
  v22 = *(unsigned __int8 *)(v20 + a1 + 1);
  *a3 = v20 + 4;
  *(_DWORD *)(a5 + 12) = v21;
  *(_DWORD *)(a5 + 16) = v22;
  if (v20 != 20)
    AnimCodec::AnimDecoder::getInfo();
  return 0;
}

uint64_t AnimCodec::AnimDecoder::decompress(AnimCodec::AnimDecoder *this, const unsigned __int8 *a2, unint64_t a3, AnimCodec *a4, int *a5, uint64_t a6, const int *a7, int a8, unint64_t a9, int *a10)
{
  uint64_t Info;
  int v18;
  int v19;
  AnimCodec::StaticAdjacencyInformation *v20;
  uint64_t v21;
  uint64_t v22;
  std::vector<unsigned int> __p;
  _BYTE v25[64];
  uint64_t v26;
  int v27;
  _QWORD v28[2];
  uint64_t v29;
  unsigned int v30;
  int v31;
  char v32;
  char v33;

  v28[0] = a2;
  v28[1] = a3;
  v29 = 0;
  v27 = 0;
  Info = AnimCodec::AnimDecoder::getInfo((uint64_t)a2, a3, &v29, &v27, (uint64_t)&v30);
  if (!(_DWORD)Info)
  {
    if (v32 == 1 && v33 == 0)
    {
      Info = 2;
      if (a6)
      {
        if (a7)
        {
          v18 = v31;
          if (v31)
          {
            if (v30 <= a3
              && (v19 = v27,
                  v19 == AnimCodec::ComputeCRC32(v28[0] + 8, (const unsigned __int8 *)(v30 - 8))))
            {
              v26 = 0;
              memset(v25, 0, sizeof(v25));
              memset(&__p, 0, sizeof(__p));
              Info = AnimCodec::ComputeAdjacencyInfo(a4, a5, a7, a8, a9, (std::vector<unsigned int> *)v25, v20);
              if (!(_DWORD)Info)
              {
                v21 = AnimCodec::ComputeTraversalOrder((AnimCodec::StaticAdjacencyInformation *)v25, &__p);
                Info = v21;
                if (!(_DWORD)v21)
                  Info = AnimCodec::AnimDecoder::decompress(v21, (AnimCodec::StaticAdjacencyInformation *)v25, &__p, v22, a6, v18, (uint64_t)v28, (uint64_t)a10);
              }
              if (__p.__begin_)
              {
                __p.__end_ = __p.__begin_;
                operator delete(__p.__begin_);
              }
              vmesh::StaticAdjacencyInformation<Pair>::~StaticAdjacencyInformation((uint64_t)v25);
            }
            else
            {
              return 3;
            }
          }
        }
      }
    }
    else
    {
      return 4;
    }
  }
  return Info;
}

uint64_t AnimCodec::AnimDecoder::decompress(uint64_t a1, AnimCodec::StaticAdjacencyInformation *a2, _QWORD *a3, uint64_t a4, int a5, int a6, uint64_t a7, uint64_t a8)
{
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  int v19;
  int started;
  int v21;
  unsigned int v22;
  uint64_t v23;
  std::vector<unsigned int>::pointer begin;
  uint64_t v25;
  int v26;
  int *v27;
  uint64_t v28;
  std::vector<unsigned int>::pointer v29;
  int v30;
  std::vector<unsigned int>::pointer v31;
  uint64_t v32;
  int v33;
  int v34;
  BOOL v35;
  BOOL v36;
  uint64_t v37;
  _BOOL4 v38;
  _BOOL4 v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  std::vector<unsigned int>::pointer v45;
  std::vector<unsigned int>::pointer v46;
  std::vector<unsigned int>::pointer v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  int v51;
  int v52;
  unsigned int v53;
  BOOL v54;
  uint64_t v55;
  uint64_t v57;
  uint64_t v58;
  uint64_t v60;
  uint64_t v61;
  AnimCodec::StaticAdjacencyInformation *v62;
  char v63;
  std::vector<unsigned int> v64;
  std::vector<unsigned int> v65;
  std::vector<unsigned int> v66;
  void *__p;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  uint64_t v78;
  __int16 v79;
  unsigned int v80;
  uint64_t v81;

  v12 = *(_QWORD *)(a7 + 16);
  v13 = *(_DWORD *)(a7 + 8) - v12;
  v14 = *(_QWORD *)a7 + v12;
  v80 = v13;
  v81 = v14;
  AnimCodec::ArithmeticDecoder::start((AnimCodec::ArithmeticDecoder *)&v80);
  v62 = a2;
  v15 = *((_QWORD *)a2 + 4) - *((_QWORD *)a2 + 3);
  v16 = v15 >> 2;
  if ((int)(v15 >> 2) < 1)
    return 2;
  v79 = 0x8000;
  v76 = 0;
  v77 = 0;
  v78 = 0;
  v73 = 0;
  v74 = 0;
  v75 = 0;
  v70 = 0;
  v71 = 0;
  v72 = 0;
  __p = 0;
  v68 = 0;
  v69 = 0;
  std::vector<AnimCodec::ArithmeticContext>::resize((uint64_t)&v76, a5);
  std::vector<AnimCodec::ArithmeticContext>::resize((uint64_t)&v73, a5);
  std::vector<AnimCodec::ArithmeticContext>::resize((uint64_t)&v70, a5);
  std::vector<AnimCodec::ArithmeticContext>::resize((uint64_t)&__p, 31 * a5);
  memset(&v66, 0, sizeof(v66));
  memset(&v65, 0, sizeof(v65));
  memset(&v64, 0, sizeof(v64));
  std::vector<int>::resize(&v66, a5);
  std::vector<int>::resize(&v65, a5);
  std::vector<int>::resize(&v64, a5);
  if (a6 < 1)
  {
    v55 = 0;
    goto LABEL_47;
  }
  v57 = a6;
  v58 = 0;
  v60 = (v15 >> 2);
  v61 = 4 * a5;
  v17 = a3;
  do
  {
    v18 = 0;
    v63 = 1;
    do
    {
      v19 = *(_DWORD *)(*v17 + 4 * v18);
      if (a5 >= 1)
        bzero(v65.__begin_, v61);
      started = AnimCodec::StaticAdjacencyInformation::neighborsStartIndex(v62, v19);
      v21 = AnimCodec::StaticAdjacencyInformation::neighborsEndIndex(v62, v19);
      if (v21 > started)
      {
        v22 = 0;
        v23 = *((_QWORD *)v62 + 6);
        begin = v65.__begin_;
        v25 = started;
        while (1)
        {
          v26 = *(_DWORD *)(v23 + 4 * v25);
          if (v26 < 0)
            break;
          if (v26 >= (int)v16)
          {
            v55 = 2;
            goto LABEL_47;
          }
          if (a5 >= 1)
          {
            v27 = (int *)(a8 + 4 * v26 * a5);
            v28 = a5;
            v29 = begin;
            do
            {
              v30 = *v27++;
              *v29++ += v30;
              --v28;
            }
            while (v28);
          }
          ++v22;
          ++v25;
          if (v22 == v21 - started)
          {
            v22 = v21 - started;
            break;
          }
        }
        if (v22 < 2)
          goto LABEL_20;
        if (a5 < 1)
        {
          v54 = AnimCodec::ArithmeticDecoder::decode(&v80, &v79) != (v63 & 1);
          goto LABEL_40;
        }
        v31 = v65.__begin_;
        v32 = a5;
        do
        {
          *v31 = (int)(*v31 + (v22 >> 1)) / (int)v22;
          ++v31;
          --v32;
        }
        while (v32);
      }
LABEL_20:
      v33 = AnimCodec::ArithmeticDecoder::decode(&v80, &v79);
      v34 = v63 & 1;
      v35 = v33 == v34;
      v36 = v33 != v34;
      if (v35)
      {
        if (a5 < 1)
        {
          v63 = 0;
          goto LABEL_41;
        }
        v63 = v36;
        v37 = 0;
        do
        {
          if (AnimCodec::ArithmeticDecoder::decode(&v80, (_WORD *)v70 + v37))
          {
            v38 = AnimCodec::ArithmeticDecoder::decode(&v80, (_WORD *)v76 + v37);
            v39 = AnimCodec::ArithmeticDecoder::decode(&v80, (_WORD *)__p + (31 * v37));
            v40 = v39 + 2 * AnimCodec::ArithmeticDecoder::decode(&v80, (_WORD *)__p + 31 * (int)v37 + v39 + 1);
            v41 = v40 + 4 * AnimCodec::ArithmeticDecoder::decode(&v80, (_WORD *)__p + 31 * (int)v37 + v40 + 3);
            v42 = v41 + 8 * AnimCodec::ArithmeticDecoder::decode(&v80, (_WORD *)__p + 31 * (int)v37 + v41 + 7);
            v43 = v42 + 16 * AnimCodec::ArithmeticDecoder::decode(&v80, (_WORD *)__p + 31 * (int)v37 + v42 + 15);
            if (v43 > 30)
              v44 = AnimCodec::ArithmeticDecoder::decodeExpGolomb(&v80, 6, (_WORD *)v73 + v37) + 32;
            else
              v44 = v43 + 1;
            if (!v38)
              v44 = -v44;
          }
          else
          {
            v44 = 0;
          }
          v64.__begin_[v37++] = v44;
        }
        while (v37 != a5);
        v17 = a3;
        goto LABEL_34;
      }
      if (a5 >= 1)
      {
        v63 = v36;
        bzero(v64.__begin_, v61);
LABEL_34:
        v45 = v65.__begin_;
        v46 = v64.__begin_;
        v47 = v66.__begin_;
        v48 = 4 * v19 * a5;
        v49 = a5;
        do
        {
          v51 = *v45++;
          v50 = v51;
          v52 = *v46++;
          v53 = v52 + v50;
          *v47++ = v53;
          *(_DWORD *)(a8 + v48) = v53;
          v48 += 4;
          --v49;
        }
        while (v49);
        goto LABEL_41;
      }
      v54 = 1;
LABEL_40:
      v63 = v54;
LABEL_41:
      ++v18;
    }
    while (v18 != v60);
    v55 = 0;
    a8 += 4 * (int)v16 * a5;
    ++v58;
  }
  while (v58 != v57);
LABEL_47:
  if (v64.__begin_)
  {
    v64.__end_ = v64.__begin_;
    operator delete(v64.__begin_);
  }
  if (v65.__begin_)
  {
    v65.__end_ = v65.__begin_;
    operator delete(v65.__begin_);
  }
  if (v66.__begin_)
  {
    v66.__end_ = v66.__begin_;
    operator delete(v66.__begin_);
  }
  if (__p)
  {
    v68 = __p;
    operator delete(__p);
  }
  if (v70)
  {
    v71 = v70;
    operator delete(v70);
  }
  if (v73)
  {
    v74 = v73;
    operator delete(v73);
  }
  if (v76)
  {
    v77 = v76;
    operator delete(v76);
  }
  return v55;
}

void std::vector<AnimCodec::ArithmeticContext>::resize(uint64_t a1, unint64_t a2)
{
  unint64_t v2;

  v2 = (uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 1;
  if (a2 <= v2)
  {
    if (a2 < v2)
      *(_QWORD *)(a1 + 8) = *(_QWORD *)a1 + 2 * a2;
  }
  else
  {
    std::vector<AnimCodec::ArithmeticContext>::__append((char **)a1, a2 - v2);
  }
}

uint64_t AnimCodec::StaticAdjacencyInformation::neighborsStartIndex(AnimCodec::StaticAdjacencyInformation *this, int a2)
{
  if ((int)((*((_QWORD *)this + 4) - *((_QWORD *)this + 3)) >> 2) <= a2)
    AnimCodec::StaticAdjacencyInformation::neighborsStartIndex();
  return *(unsigned int *)(*(_QWORD *)this + 4 * a2);
}

uint64_t AnimCodec::StaticAdjacencyInformation::neighborsEndIndex(AnimCodec::StaticAdjacencyInformation *this, int a2)
{
  uint64_t v2;

  v2 = *((_QWORD *)this + 3);
  if ((int)((unint64_t)(*((_QWORD *)this + 4) - v2) >> 2) <= a2)
    AnimCodec::StaticAdjacencyInformation::neighborsEndIndex();
  return (*(_DWORD *)(v2 + 4 * a2) + *(_DWORD *)(*(_QWORD *)this + 4 * a2));
}

BOOL AnimCodec::ArithmeticDecoder::decode(unsigned int *a1, _WORD *a2)
{
  unsigned int v2;
  unsigned int v3;
  int v4;
  uint64_t v5;
  unint64_t v6;
  int v7;
  unint64_t v8;
  int v9;
  unsigned int v10;
  BOOL v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  _BOOL8 v15;
  unsigned int v16;

  v2 = a1[7];
  v3 = a1[8];
  if (v2 > 0x40000000)
  {
    v10 = a1[7];
  }
  else
  {
    v4 = a1[10];
    do
    {
      v3 *= 2;
      a1[10] = --v4;
      if (!v4)
      {
        v5 = *((_QWORD *)a1 + 2);
        *((_QWORD *)a1 + 2) = v5 + 1;
        v6 = *a1;
        if (v5 + 1 >= v6)
          v7 = 65280;
        else
          v7 = *(unsigned __int8 *)(*((_QWORD *)a1 + 1) + v5 + 1) << 8;
        v8 = v5 + 2;
        *((_QWORD *)a1 + 2) = v8;
        if (v8 >= v6)
          v9 = 255;
        else
          v9 = *(unsigned __int8 *)(*((_QWORD *)a1 + 1) + v8);
        v3 |= v7 | v9;
        v4 = 16;
        a1[10] = 16;
      }
      v10 = 2 * v2;
      v11 = v2 >= 0x20000001;
      v2 *= 2;
    }
    while (!v11);
  }
  v12 = (unsigned __int16)*a2;
  v13 = (HIWORD(v10) * v12) & 0xFFFF0000;
  v14 = v10 - v13;
  v15 = v3 >= v13;
  *a2 = *((_WORD *)a1 + ((v12 >> 7) & 0x1FE | v15) + 24) + v12;
  if (v3 < v13)
    v16 = v13;
  else
    v16 = v14;
  if (v3 < v13)
    v13 = 0;
  a1[7] = v16;
  a1[8] = v3 - v13;
  return v15;
}

uint64_t AnimCodec::ArithmeticDecoder::decodeExpGolomb(unsigned int *a1, int a2, _WORD *a3)
{
  int v6;
  int v7;
  _BOOL4 v8;
  int v9;
  int v10;
  __int16 v12;

  v6 = 0;
  if (AnimCodec::ArithmeticDecoder::decode(a1, a3))
  {
    v7 = a2;
    do
    {
      a2 = v7 + 1;
      v6 |= 1 << v7;
      v8 = AnimCodec::ArithmeticDecoder::decode(a1, a3);
      v7 = a2;
    }
    while (v8);
  }
  v9 = 0;
  if (a2)
  {
    v10 = a2 - 1;
    do
    {
      v12 = 0x8000;
      v9 |= AnimCodec::ArithmeticDecoder::decode(a1, &v12) << v10--;
    }
    while (v10 != -1);
  }
  return (v9 + v6);
}

uint64_t AnimCodec::ComputeAdjacencyInfo(AnimCodec *this, int *a2, const int *a3, int a4, int a5, std::vector<unsigned int> *a6, AnimCodec::StaticAdjacencyInformation *a7)
{
  uint64_t result;
  uint64_t v12;
  int *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  AnimCodec *v21;
  uint64_t v22;
  int *v23;
  int v24;
  int v25;
  int v26;
  int v27;
  const int *v28;
  const int *v29;

  result = 2;
  if (this && a2 && (int)a3 >= 1)
  {
    AnimCodec::StaticAdjacencyInformation::resize(a6, (int)a3);
    if (a5 >= 1)
    {
      v12 = a5;
      v13 = a2;
      do
      {
        v14 = *v13++;
        AnimCodec::StaticAdjacencyInformation::incrementNeighborCount(a6, v14, 2);
        --v12;
      }
      while (v12);
    }
    AnimCodec::StaticAdjacencyInformation::updateShift(a6);
    if (a4 < 1)
    {
      return 0;
    }
    else
    {
      v15 = 0;
      v16 = 0;
      v28 = a2;
      v29 = a2 + 1;
      v17 = a4;
      while (1)
      {
        v18 = *((_DWORD *)this + v15);
        v19 = (v18 - 1);
        if (v18 < 1)
          break;
        if (v18 == 1)
        {
          v20 = v16;
        }
        else
        {
          v20 = (v18 + v16);
          if ((int)v20 > a5)
            return 2;
          v21 = this;
          v22 = (int)v16;
          v23 = (int *)&v29[(int)v16];
          do
          {
            v24 = *(v23 - 1);
            v25 = *v23;
            if (v24 != *v23)
            {
              AnimCodec::StaticAdjacencyInformation::insertNeighbor((AnimCodec::StaticAdjacencyInformation *)a6, *(v23 - 1), *v23);
              AnimCodec::StaticAdjacencyInformation::insertNeighbor((AnimCodec::StaticAdjacencyInformation *)a6, v25, v24);
            }
            ++v23;
            --v19;
          }
          while (v19);
          v26 = v28[v22];
          v27 = v28[(int)v20 - 1];
          this = v21;
          if (v26 != v27)
          {
            AnimCodec::StaticAdjacencyInformation::insertNeighbor((AnimCodec::StaticAdjacencyInformation *)a6, v28[v22], v28[(int)v20 - 1]);
            AnimCodec::StaticAdjacencyInformation::insertNeighbor((AnimCodec::StaticAdjacencyInformation *)a6, v27, v26);
          }
        }
        ++v15;
        v16 = v20;
        if (v15 == v17)
          return 0;
      }
      return 2;
    }
  }
  return result;
}

uint64_t AnimCodec::ComputeTraversalOrder(AnimCodec::StaticAdjacencyInformation *a1, std::vector<unsigned int> *this)
{
  unint64_t v2;
  unint64_t v3;
  std::vector<unsigned int>::size_type v6;
  int v7;
  int v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  int started;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  int *v28;
  uint64_t v29;
  int *v30;
  int *v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int v36;
  void *__p;
  unint64_t v38;
  uint64_t v39;
  _OWORD v40[2];
  __int128 v41;
  void *v42;
  int v43;

  v2 = *((_QWORD *)a1 + 4) - *((_QWORD *)a1 + 3);
  v3 = v2 >> 2;
  if ((int)(v2 >> 2) < 1)
    return 2;
  v41 = 0u;
  memset(v40, 0, sizeof(v40));
  v6 = (v2 >> 2);
  std::vector<int>::resize(this, v6);
  __p = 0;
  v38 = 0;
  v39 = 0;
  std::vector<BOOL>::resize((uint64_t)&__p, v6, 0);
  if (v38)
  {
    v42 = __p;
    v43 = 0;
    std::__fill_n[abi:nn180100]<true,std::vector<BOOL>>(&v42, v38);
  }
  v7 = 0;
  v8 = 0;
  LODWORD(v42) = 0;
  while (1)
  {
    v9 = (unint64_t)v8 >> 6;
    v10 = *((_QWORD *)__p + v9);
    if ((v10 & (1 << v8)) != 0)
    {
      *((_QWORD *)__p + v9) = v10 & ~(1 << v8);
      this->__begin_[v7] = v8;
      std::deque<int>::push_back(v40, &v42);
      v11 = *((_QWORD *)&v41 + 1);
      ++v7;
      if (*((_QWORD *)&v41 + 1))
        break;
    }
LABEL_20:
    v8 = (_DWORD)v42 + 1;
    LODWORD(v42) = v8;
    if (v8 >= (int)v3)
    {
      v20 = 0;
      do
      {
        v21 = (int)this->__begin_[v20];
        *(_QWORD *)((char *)__p + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
        started = AnimCodec::StaticAdjacencyInformation::neighborsStartIndex(a1, v21);
        v23 = AnimCodec::StaticAdjacencyInformation::neighborsEndIndex(a1, v21);
        v24 = *((_QWORD *)a1 + 6);
        if (started >= v23)
        {
          v25 = started;
          v26 = v23;
        }
        else
        {
          v25 = started;
          v26 = v23;
          v27 = (char *)__p;
          v28 = (int *)(v24 + 4 * started);
          v29 = v23 - (uint64_t)started;
          do
          {
            if (((*(_QWORD *)&v27[((unint64_t)*v28 >> 3) & 0x1FFFFFFFFFFFFFF8] >> *v28) & 1) == 0)
              *v28 = -1;
            ++v28;
            --v29;
          }
          while (v29);
        }
        v30 = (int *)(v24 + 4 * v25);
        v31 = (int *)(v24 + 4 * v26);
        v32 = 126 - 2 * __clz(v31 - v30);
        if (v23 == started)
          v33 = 0;
        else
          v33 = v32;
        std::__introsort<std::_ClassicAlgPolicy,std::greater<int> &,int *,false>(v30, v31, (uint64_t)&v42, v33, 1);
        ++v20;
      }
      while (v20 != v6);
      v34 = 2 * (v7 != (_DWORD)v3);
      goto LABEL_35;
    }
  }
  while (1)
  {
    v12 = *(_DWORD *)(*(_QWORD *)(*((_QWORD *)&v40[0] + 1) + (((unint64_t)v41 >> 7) & 0x1FFFFFFFFFFFFF8))
                    + 4 * (v41 & 0x3FF));
    *(_QWORD *)&v41 = v41 + 1;
    *((_QWORD *)&v41 + 1) = v11 - 1;
    if ((unint64_t)v41 >= 0x800)
    {
      operator delete(**((void ***)&v40[0] + 1));
      *((_QWORD *)&v40[0] + 1) += 8;
      *(_QWORD *)&v41 = v41 - 1024;
    }
    v13 = AnimCodec::StaticAdjacencyInformation::neighborsStartIndex(a1, v12);
    v14 = AnimCodec::StaticAdjacencyInformation::neighborsEndIndex(a1, v12);
    v15 = v14 - v13;
    if (v14 > v13)
      break;
LABEL_19:
    v11 = *((_QWORD *)&v41 + 1);
    if (!*((_QWORD *)&v41 + 1))
      goto LABEL_20;
  }
  v16 = 4 * v13;
  while (1)
  {
    v36 = 0;
    v17 = *(unsigned int *)(*((_QWORD *)a1 + 6) + v16);
    v36 = v17;
    if ((v17 & 0x80000000) != 0)
      break;
    if ((int)v17 >= (int)v3 || (_DWORD)v17 == v12)
      break;
    v19 = *((_QWORD *)__p + (v17 >> 6));
    if ((v19 & (1 << v17)) != 0)
    {
      *((_QWORD *)__p + (v17 >> 6)) = v19 & ~(1 << v17);
      this->__begin_[v7] = v17;
      std::deque<int>::push_back(v40, &v36);
      ++v7;
    }
    v16 += 4;
    if (!--v15)
      goto LABEL_19;
  }
  v34 = 2;
LABEL_35:
  if (__p)
    operator delete(__p);
  std::deque<int>::~deque[abi:nn180100](v40);
  return v34;
}

void AnimCodec::StaticAdjacencyInformation::resize(std::vector<unsigned int> *this, int a2)
{
  uint64_t v4;
  char *begin;
  uint64_t v6;

  std::vector<int>::resize(this, a2 + 1);
  std::vector<int>::resize(this + 1, a2);
  v4 = (char *)this->__end_ - (char *)this->__begin_;
  if (v4 >= 1)
    bzero(this->__begin_, 4 * (((unint64_t)v4 >> 2) - ((unint64_t)v4 > 3)) + 4);
  begin = (char *)this[1].__begin_;
  v6 = (char *)this[1].__end_ - begin;
  if (v6 >= 1)
    bzero(begin, 4 * (((unint64_t)v6 >> 2) - ((unint64_t)v6 > 3)) + 4);
}

_QWORD *AnimCodec::StaticAdjacencyInformation::incrementNeighborCount(_QWORD *this, int a2, int a3)
{
  if ((int)((this[4] - this[3]) >> 2) <= a2)
    AnimCodec::StaticAdjacencyInformation::incrementNeighborCount();
  *(_DWORD *)(*this + 4 * (a2 + 1)) += a3;
  return this;
}

void AnimCodec::StaticAdjacencyInformation::updateShift(std::vector<unsigned int> *this)
{
  std::vector<unsigned int>::pointer end;
  std::vector<unsigned int>::pointer begin;
  unint64_t v3;
  uint64_t v4;
  unsigned int *v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;

  begin = this->__begin_;
  end = this->__end_;
  v3 = (char *)end - (char *)this->__begin_;
  if ((int)(v3 >> 2) >= 2)
  {
    v4 = (v3 >> 2);
    v7 = *begin;
    v5 = begin + 1;
    v6 = v7;
    v8 = v4 - 1;
    do
    {
      v6 += *v5;
      *v5++ = v6;
      --v8;
    }
    while (v8);
  }
  std::vector<int>::resize(this + 2, (int)*(end - 1));
}

AnimCodec::StaticAdjacencyInformation *AnimCodec::StaticAdjacencyInformation::insertNeighbor(AnimCodec::StaticAdjacencyInformation *this, int a2, int a3)
{
  uint64_t v3;
  int *v4;
  int v5;

  v3 = *(unsigned int *)(*((_QWORD *)this + 3) + 4 * a2);
  if ((int)v3 < 1)
    return (AnimCodec::StaticAdjacencyInformation *)AnimCodec::StaticAdjacencyInformation::addNeighbor(this, a2, a3);
  v4 = (int *)(*((_QWORD *)this + 6) + 4 * *(int *)(*(_QWORD *)this + 4 * a2));
  while (1)
  {
    v5 = *v4++;
    if (v5 == a3)
      break;
    if (!--v3)
      return (AnimCodec::StaticAdjacencyInformation *)AnimCodec::StaticAdjacencyInformation::addNeighbor(this, a2, a3);
  }
  return this;
}

uint64_t AnimCodec::StaticAdjacencyInformation::addNeighbor(AnimCodec::StaticAdjacencyInformation *this, int a2, int a3)
{
  int v6;
  uint64_t result;
  int v8;
  uint64_t v9;
  int v10;

  v6 = *(_DWORD *)(*((_QWORD *)this + 3) + 4 * a2);
  result = AnimCodec::StaticAdjacencyInformation::maxNeighborCount(this, a2);
  if (v6 >= (int)result)
    AnimCodec::StaticAdjacencyInformation::addNeighbor();
  v8 = *(_DWORD *)(*(_QWORD *)this + 4 * a2);
  v9 = *((_QWORD *)this + 3);
  v10 = *(_DWORD *)(v9 + 4 * a2);
  *(_DWORD *)(v9 + 4 * a2) = v10 + 1;
  *(_DWORD *)(*((_QWORD *)this + 6) + 4 * (v10 + v8)) = a3;
  return result;
}

uint64_t AnimCodec::StaticAdjacencyInformation::maxNeighborCount(AnimCodec::StaticAdjacencyInformation *this, int a2)
{
  if ((int)((*((_QWORD *)this + 4) - *((_QWORD *)this + 3)) >> 2) <= a2)
    AnimCodec::StaticAdjacencyInformation::maxNeighborCount();
  return (*(_DWORD *)(*(_QWORD *)this + 4 * a2 + 4) - *(_DWORD *)(*(_QWORD *)this + 4 * a2));
}

void std::vector<BOOL>::resize(uint64_t a1, unint64_t a2, int a3)
{
  unint64_t v5;
  unint64_t v6;
  uint64_t v8;
  unint64_t v9;
  unint64_t v11;
  unint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  char *v15;
  __int128 v16;
  char *v17;
  uint64_t v18;
  char *v19;
  int v20;
  char *v21;
  __int128 v22;
  char *v23;
  int v24;

  v5 = *(_QWORD *)(a1 + 8);
  v6 = a2 - v5;
  if (a2 <= v5)
  {
    *(_QWORD *)(a1 + 8) = a2;
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 16);
    v9 = v8 << 6;
    if (v8 << 6 < v6 || v5 > (v8 << 6) - v6)
    {
      v21 = 0;
      v22 = 0uLL;
      if ((a2 & 0x8000000000000000) != 0)
        abort();
      v11 = v8 << 7;
      if (v11 <= ((a2 + 63) & 0xFFFFFFFFFFFFFFC0))
        v11 = (a2 + 63) & 0xFFFFFFFFFFFFFFC0;
      if (v9 <= 0x3FFFFFFFFFFFFFFELL)
        v12 = v11;
      else
        v12 = 0x7FFFFFFFFFFFFFFFLL;
      std::vector<BOOL>::reserve(&v21, v12);
      v13 = *(unint64_t **)a1;
      v14 = *(_QWORD *)(a1 + 8);
      *(_QWORD *)&v22 = v14 + v6;
      v23 = v21;
      v24 = 0;
      std::__copy_aligned[abi:nn180100]<std::vector<BOOL>,true>(v13, 0, (uint64_t)&v13[v14 >> 6], v14 & 0x3F, (uint64_t)&v23, (uint64_t)&v19);
      v17 = v19;
      LODWORD(v18) = v20;
      v15 = *(char **)a1;
      *(_QWORD *)a1 = v21;
      v21 = v15;
      v16 = *(_OWORD *)(a1 + 8);
      *(_OWORD *)(a1 + 8) = v22;
      v22 = v16;
      if (v15)
        operator delete(v15);
    }
    else
    {
      v17 = (char *)(*(_QWORD *)a1 + 8 * (v5 >> 6));
      v18 = *(_QWORD *)(a1 + 8) & 0x3FLL;
      *(_QWORD *)(a1 + 8) = a2;
    }
    if (a2 != v5)
    {
      if (a3)
      {
        v21 = v17;
        LODWORD(v22) = v18;
        std::__fill_n[abi:nn180100]<true,std::vector<BOOL>>(&v21, v6);
      }
      else
      {
        v21 = v17;
        LODWORD(v22) = v18;
        std::__fill_n[abi:nn180100]<false,std::vector<BOOL>>((uint64_t)&v21, v6);
      }
    }
  }
}

unint64_t *std::__copy_aligned[abi:nn180100]<std::vector<BOOL>,true>@<X0>(unint64_t *__src@<X0>, unsigned int a2@<W1>, uint64_t a3@<X2>, unsigned int a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  int64_t v8;
  unint64_t *v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t *v16;

  v8 = a4 - (unint64_t)a2 + 8 * (a3 - (_QWORD)__src);
  if (v8 <= 0)
  {
    v16 = *(unint64_t **)a5;
  }
  else
  {
    v9 = __src;
    __src = *(unint64_t **)a5;
    if (a2)
    {
      if (v8 >= (unint64_t)(64 - a2))
        v10 = 64 - a2;
      else
        v10 = v8;
      v8 -= v10;
      v11 = *v9++;
      *__src = *__src & ~((0xFFFFFFFFFFFFFFFFLL >> (64 - a2 - v10)) & (-1 << a2)) | v11 & (0xFFFFFFFFFFFFFFFFLL >> (64 - a2 - v10)) & (-1 << a2);
      v12 = v10 + *(unsigned int *)(a5 + 8);
      __src = (unint64_t *)((char *)__src + ((v12 >> 3) & 0x3FFFFFF8));
      *(_QWORD *)a5 = __src;
      *(_DWORD *)(a5 + 8) = v12 & 0x3F;
    }
    if (v8 >= 0)
      v13 = v8;
    else
      v13 = v8 + 63;
    v14 = v13 >> 6;
    if ((unint64_t)(v8 + 63) >= 0x7F)
    {
      memmove(__src, v9, 8 * v14);
      __src = *(unint64_t **)a5;
    }
    v15 = v8 - (v14 << 6);
    v16 = &__src[v14];
    *(_QWORD *)a5 = v16;
    if (v15 >= 1)
    {
      *v16 = *v16 & ~(0xFFFFFFFFFFFFFFFFLL >> (((_BYTE)v14 << 6) - v8)) | v9[v14] & (0xFFFFFFFFFFFFFFFFLL >> (((_BYTE)v14 << 6) - v8));
      *(_DWORD *)(a5 + 8) = v15;
    }
  }
  *(_QWORD *)a6 = v16;
  *(_DWORD *)(a6 + 8) = *(_DWORD *)(a5 + 8);
  return __src;
}

_QWORD *std::__fill_n[abi:nn180100]<true,std::vector<BOOL>>(_QWORD *result, unint64_t a2)
{
  unint64_t v2;
  _QWORD *v3;
  int v4;
  _QWORD *v5;
  unint64_t v6;
  unint64_t v7;
  _QWORD *v8;

  v2 = a2;
  v3 = result;
  v4 = *((_DWORD *)result + 2);
  v5 = (_QWORD *)*result;
  if (v4)
  {
    if ((64 - v4) >= a2)
      v6 = a2;
    else
      v6 = (64 - v4);
    *v5++ |= (0xFFFFFFFFFFFFFFFFLL >> (64 - v4 - v6)) & (-1 << v4);
    v2 = a2 - v6;
    *result = v5;
  }
  v7 = v2 >> 6;
  if (v2 >= 0x40)
    result = memset(v5, 255, 8 * v7);
  if ((v2 & 0x3F) != 0)
  {
    v8 = &v5[v7];
    *v3 = v8;
    *v8 |= 0xFFFFFFFFFFFFFFFFLL >> -(v2 & 0x3F);
  }
  return result;
}

void std::__fill_n[abi:nn180100]<false,std::vector<BOOL>>(uint64_t a1, unint64_t a2)
{
  unint64_t v2;
  int v4;
  _QWORD *v5;
  unint64_t v6;
  unint64_t v7;
  _QWORD *v8;

  v2 = a2;
  v4 = *(_DWORD *)(a1 + 8);
  v5 = *(_QWORD **)a1;
  if (v4)
  {
    if ((64 - v4) >= a2)
      v6 = a2;
    else
      v6 = (64 - v4);
    *v5++ &= ~((0xFFFFFFFFFFFFFFFFLL >> (64 - v4 - v6)) & (-1 << v4));
    v2 = a2 - v6;
    *(_QWORD *)a1 = v5;
  }
  v7 = v2 >> 6;
  if (v2 >= 0x40)
    bzero(v5, 8 * v7);
  if ((v2 & 0x3F) != 0)
  {
    v8 = &v5[v7];
    *(_QWORD *)a1 = v8;
    *v8 &= ~(0xFFFFFFFFFFFFFFFFLL >> -(v2 & 0x3F));
  }
}

void std::deque<int>::push_back(_QWORD *a1, _DWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v4 = a1[2];
  v5 = a1[1];
  if (v4 == v5)
    v6 = 0;
  else
    v6 = ((v4 - v5) << 7) - 1;
  v7 = a1[5];
  v8 = v7 + a1[4];
  if (v6 == v8)
  {
    std::deque<int>::__add_back_capacity(a1);
    v5 = a1[1];
    v7 = a1[5];
    v8 = a1[4] + v7;
  }
  *(_DWORD *)(*(_QWORD *)(v5 + ((v8 >> 7) & 0x1FFFFFFFFFFFFF8)) + 4 * (v8 & 0x3FF)) = *a2;
  a1[5] = v7 + 1;
}

void std::deque<int>::__add_back_capacity(_QWORD *a1)
{
  unint64_t v2;
  BOOL v3;
  unint64_t v4;
  uint64_t v5;
  char *v6;
  _QWORD *v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  int64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  unint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  char *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  char *v39;
  _QWORD *v40;
  uint64_t v41;
  char *v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  _QWORD *v56;

  v2 = a1[4];
  v3 = v2 >= 0x400;
  v4 = v2 - 1024;
  if (v3)
  {
    v5 = (uint64_t)(a1 + 3);
    v6 = (char *)a1[3];
    a1[4] = v4;
    v7 = (_QWORD *)a1[1];
    v8 = (char *)a1[2];
    v11 = *v7;
    v9 = (char *)(v7 + 1);
    v10 = v11;
    a1[1] = v9;
    if (v8 != v6)
    {
LABEL_29:
      *(_QWORD *)v8 = v10;
      a1[2] += 8;
      return;
    }
    v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1)
        v29 = 1;
      else
        v29 = (uint64_t)&v8[-*a1] >> 2;
      v30 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<Statement *>>(v5, v29);
      v31 = &v30[8 * (v29 >> 2)];
      v33 = &v30[8 * v32];
      v34 = (uint64_t *)a1[1];
      v8 = v31;
      v35 = a1[2] - (_QWORD)v34;
      if (v35)
      {
        v8 = &v31[v35 & 0xFFFFFFFFFFFFFFF8];
        v36 = 8 * (v35 >> 3);
        v37 = &v30[8 * (v29 >> 2)];
        do
        {
          v38 = *v34++;
          *(_QWORD *)v37 = v38;
          v37 += 8;
          v36 -= 8;
        }
        while (v36);
      }
      goto LABEL_26;
    }
LABEL_5:
    v13 = v12 >> 3;
    v14 = v12 >> 3 < -1;
    v15 = (v12 >> 3) + 2;
    if (v14)
      v16 = v15;
    else
      v16 = v13 + 1;
    v17 = -(v16 >> 1);
    v18 = v16 >> 1;
    v19 = &v9[-8 * v18];
    v20 = v8 - v9;
    if (v8 != v9)
    {
      memmove(&v9[-8 * v18], v9, v8 - v9);
      v9 = (char *)a1[1];
    }
    v8 = &v19[v20];
    a1[1] = &v9[8 * v17];
    a1[2] = &v19[v20];
    goto LABEL_29;
  }
  v21 = a1[2];
  v22 = (v21 - a1[1]) >> 3;
  v23 = a1[3];
  v24 = v23 - *a1;
  if (v22 < v24 >> 3)
  {
    if (v23 != v21)
    {
      *(_QWORD *)&v54 = operator new(0x1000uLL);
      std::__split_buffer<int *>::push_back(a1, &v54);
      return;
    }
    *(_QWORD *)&v54 = operator new(0x1000uLL);
    std::__split_buffer<int *>::push_front((uint64_t)a1, &v54);
    v40 = (_QWORD *)a1[1];
    v8 = (char *)a1[2];
    v41 = *v40;
    v9 = (char *)(v40 + 1);
    v10 = v41;
    a1[1] = v9;
    if (v8 != (char *)a1[3])
      goto LABEL_29;
    v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1)
        v46 = 1;
      else
        v46 = (uint64_t)&v8[-*a1] >> 2;
      v30 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<Statement *>>((uint64_t)(a1 + 3), v46);
      v31 = &v30[8 * (v46 >> 2)];
      v33 = &v30[8 * v47];
      v48 = (uint64_t *)a1[1];
      v8 = v31;
      v49 = a1[2] - (_QWORD)v48;
      if (v49)
      {
        v8 = &v31[v49 & 0xFFFFFFFFFFFFFFF8];
        v50 = 8 * (v49 >> 3);
        v51 = &v30[8 * (v46 >> 2)];
        do
        {
          v52 = *v48++;
          *(_QWORD *)v51 = v52;
          v51 += 8;
          v50 -= 8;
        }
        while (v50);
      }
LABEL_26:
      v39 = (char *)*a1;
      *a1 = v30;
      a1[1] = v31;
      a1[2] = v8;
      a1[3] = v33;
      if (v39)
      {
        operator delete(v39);
        v8 = (char *)a1[2];
      }
      goto LABEL_29;
    }
    goto LABEL_5;
  }
  if (v23 == *a1)
    v25 = 1;
  else
    v25 = v24 >> 2;
  v56 = a1 + 3;
  *(_QWORD *)&v54 = std::__allocate_at_least[abi:nn180100]<std::allocator<Statement *>>((uint64_t)(a1 + 3), v25);
  *((_QWORD *)&v54 + 1) = v54 + 8 * v22;
  *(_QWORD *)&v55 = *((_QWORD *)&v54 + 1);
  *((_QWORD *)&v55 + 1) = v54 + 8 * v26;
  v53 = operator new(0x1000uLL);
  std::__split_buffer<int *>::push_back(&v54, &v53);
  v27 = (char *)a1[2];
  if (v27 == (char *)a1[1])
  {
    v28 = (char *)a1[2];
  }
  else
  {
    do
    {
      v27 -= 8;
      std::__split_buffer<int *>::push_front((uint64_t)&v54, v27);
    }
    while (v27 != (char *)a1[1]);
    v28 = (char *)a1[2];
  }
  v42 = (char *)*a1;
  v43 = v54;
  v44 = v55;
  *(_QWORD *)&v54 = *a1;
  *((_QWORD *)&v54 + 1) = v27;
  v45 = a1[3];
  *(_OWORD *)a1 = v43;
  *((_OWORD *)a1 + 1) = v44;
  *(_QWORD *)&v55 = v28;
  *((_QWORD *)&v55 + 1) = v45;
  if (v28 != v27)
    *(_QWORD *)&v55 = &v28[(v27 - v28 + 7) & 0xFFFFFFFFFFFFFFF8];
  if (v42)
    operator delete(v42);
}

void std::__split_buffer<int *>::push_back(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  char *v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  int64_t v16;
  char *v17;
  unint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;

  v5 = (char *)a1[3];
  v4 = (uint64_t)(a1 + 3);
  v6 = *(char **)(v4 - 8);
  if (v6 == v5)
  {
    v7 = (char *)a1[1];
    v8 = (uint64_t)&v7[-*a1];
    if ((unint64_t)v7 <= *a1)
    {
      if (v6 == (char *)*a1)
        v18 = 1;
      else
        v18 = (uint64_t)&v6[-*a1] >> 2;
      v19 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<Statement *>>(v4, v18);
      v21 = &v19[8 * (v18 >> 2)];
      v22 = (uint64_t *)a1[1];
      v6 = v21;
      v23 = a1[2] - (_QWORD)v22;
      if (v23)
      {
        v6 = &v21[v23 & 0xFFFFFFFFFFFFFFF8];
        v24 = 8 * (v23 >> 3);
        v25 = &v19[8 * (v18 >> 2)];
        do
        {
          v26 = *v22++;
          *(_QWORD *)v25 = v26;
          v25 += 8;
          v24 -= 8;
        }
        while (v24);
      }
      v27 = (char *)*a1;
      *a1 = v19;
      a1[1] = v21;
      a1[2] = v6;
      a1[3] = &v19[8 * v20];
      if (v27)
      {
        operator delete(v27);
        v6 = (char *)a1[2];
      }
    }
    else
    {
      v9 = v8 >> 3;
      v10 = v8 >> 3 < -1;
      v11 = (v8 >> 3) + 2;
      if (v10)
        v12 = v11;
      else
        v12 = v9 + 1;
      v13 = -(v12 >> 1);
      v14 = v12 >> 1;
      v15 = &v7[-8 * v14];
      v16 = v6 - v7;
      if (v6 != v7)
      {
        memmove(&v7[-8 * v14], v7, v6 - v7);
        v6 = (char *)a1[1];
      }
      v17 = &v6[8 * v13];
      v6 = &v15[v16];
      a1[1] = v17;
      a1[2] = &v15[v16];
    }
  }
  *(_QWORD *)v6 = *a2;
  a1[2] += 8;
}

{
  char *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  int64_t v14;
  char *v15;
  unint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;

  v4 = (char *)a1[2];
  if (v4 == (char *)a1[3])
  {
    v5 = (char *)a1[1];
    v6 = (uint64_t)&v5[-*a1];
    if ((unint64_t)v5 <= *a1)
    {
      if (v4 == (char *)*a1)
        v16 = 1;
      else
        v16 = (uint64_t)&v4[-*a1] >> 2;
      v17 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<Statement *>>(a1[4], v16);
      v19 = &v17[8 * (v16 >> 2)];
      v20 = (uint64_t *)a1[1];
      v4 = v19;
      v21 = a1[2] - (_QWORD)v20;
      if (v21)
      {
        v4 = &v19[v21 & 0xFFFFFFFFFFFFFFF8];
        v22 = 8 * (v21 >> 3);
        v23 = &v17[8 * (v16 >> 2)];
        do
        {
          v24 = *v20++;
          *(_QWORD *)v23 = v24;
          v23 += 8;
          v22 -= 8;
        }
        while (v22);
      }
      v25 = (char *)*a1;
      *a1 = v17;
      a1[1] = v19;
      a1[2] = v4;
      a1[3] = &v17[8 * v18];
      if (v25)
      {
        operator delete(v25);
        v4 = (char *)a1[2];
      }
    }
    else
    {
      v7 = v6 >> 3;
      v8 = v6 >> 3 < -1;
      v9 = (v6 >> 3) + 2;
      if (v8)
        v10 = v9;
      else
        v10 = v7 + 1;
      v11 = -(v10 >> 1);
      v12 = v10 >> 1;
      v13 = &v5[-8 * v12];
      v14 = v4 - v5;
      if (v4 != v5)
      {
        memmove(&v5[-8 * v12], v5, v4 - v5);
        v4 = (char *)a1[1];
      }
      v15 = &v4[8 * v11];
      v4 = &v13[v14];
      a1[1] = v15;
      a1[2] = &v13[v14];
    }
  }
  *(_QWORD *)v4 = *a2;
  a1[2] += 8;
}

void std::__split_buffer<int *>::push_front(uint64_t a1, _QWORD *a2)
{
  char *v4;
  char *v5;
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;

  v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    v6 = a1 + 24;
    v7 = *(_BYTE **)(a1 + 24);
    v8 = *(_BYTE **)(a1 + 16);
    if (v8 >= v7)
    {
      if (v7 == v4)
        v12 = 1;
      else
        v12 = (v7 - v4) >> 2;
      v13 = 2 * v12;
      v14 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<Statement *>>(v6, v12);
      v5 = &v14[(v13 + 6) & 0xFFFFFFFFFFFFFFF8];
      v16 = *(uint64_t **)(a1 + 8);
      v17 = v5;
      v18 = *(_QWORD *)(a1 + 16) - (_QWORD)v16;
      if (v18)
      {
        v17 = &v5[v18 & 0xFFFFFFFFFFFFFFF8];
        v19 = 8 * (v18 >> 3);
        v20 = v5;
        do
        {
          v21 = *v16++;
          *(_QWORD *)v20 = v21;
          v20 += 8;
          v19 -= 8;
        }
        while (v19);
      }
      v22 = *(char **)a1;
      *(_QWORD *)a1 = v14;
      *(_QWORD *)(a1 + 8) = v5;
      *(_QWORD *)(a1 + 16) = v17;
      *(_QWORD *)(a1 + 24) = &v14[8 * v15];
      if (v22)
      {
        operator delete(v22);
        v5 = *(char **)(a1 + 8);
      }
    }
    else
    {
      v9 = (v7 - v8) >> 3;
      if (v9 >= -1)
        v10 = v9 + 1;
      else
        v10 = v9 + 2;
      v11 = v10 >> 1;
      v5 = &v4[8 * (v10 >> 1)];
      if (v8 != v4)
      {
        memmove(&v4[8 * (v10 >> 1)], v4, v8 - v4);
        v4 = *(char **)(a1 + 16);
      }
      *(_QWORD *)(a1 + 8) = v5;
      *(_QWORD *)(a1 + 16) = &v4[8 * v11];
    }
  }
  else
  {
    v5 = *(char **)(a1 + 8);
  }
  *((_QWORD *)v5 - 1) = *a2;
  *(_QWORD *)(a1 + 8) -= 8;
}

{
  char *v4;
  char *v5;
  _BYTE *v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;

  v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    v6 = *(_BYTE **)(a1 + 16);
    v7 = *(_BYTE **)(a1 + 24);
    if (v6 >= v7)
    {
      if (v7 == v4)
        v11 = 1;
      else
        v11 = (v7 - v4) >> 2;
      v12 = 2 * v11;
      v13 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<Statement *>>(*(_QWORD *)(a1 + 32), v11);
      v5 = &v13[(v12 + 6) & 0xFFFFFFFFFFFFFFF8];
      v15 = *(uint64_t **)(a1 + 8);
      v16 = v5;
      v17 = *(_QWORD *)(a1 + 16) - (_QWORD)v15;
      if (v17)
      {
        v16 = &v5[v17 & 0xFFFFFFFFFFFFFFF8];
        v18 = 8 * (v17 >> 3);
        v19 = v5;
        do
        {
          v20 = *v15++;
          *(_QWORD *)v19 = v20;
          v19 += 8;
          v18 -= 8;
        }
        while (v18);
      }
      v21 = *(char **)a1;
      *(_QWORD *)a1 = v13;
      *(_QWORD *)(a1 + 8) = v5;
      *(_QWORD *)(a1 + 16) = v16;
      *(_QWORD *)(a1 + 24) = &v13[8 * v14];
      if (v21)
      {
        operator delete(v21);
        v5 = *(char **)(a1 + 8);
      }
    }
    else
    {
      v8 = (v7 - v6) >> 3;
      if (v8 >= -1)
        v9 = v8 + 1;
      else
        v9 = v8 + 2;
      v10 = v9 >> 1;
      v5 = &v4[8 * (v9 >> 1)];
      if (v6 != v4)
      {
        memmove(&v4[8 * (v9 >> 1)], v4, v6 - v4);
        v4 = *(char **)(a1 + 16);
      }
      *(_QWORD *)(a1 + 8) = v5;
      *(_QWORD *)(a1 + 16) = &v4[8 * v10];
    }
  }
  else
  {
    v5 = *(char **)(a1 + 8);
  }
  *((_QWORD *)v5 - 1) = *a2;
  *(_QWORD *)(a1 + 8) -= 8;
}

int *std::__partial_sort_impl[abi:nn180100]<std::_ClassicAlgPolicy,std::greater<int> &,int *,int *>(int *a1, int *a2, int *a3, uint64_t a4)
{
  int *v6;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  int *v12;
  int *v13;
  int *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int *v19;
  int *v20;
  uint64_t v21;
  int v22;
  int v23;
  uint64_t v24;
  unint64_t v25;
  int *v26;
  int v27;
  int v28;

  if (a1 != a2)
  {
    v6 = a2;
    v8 = (char *)a2 - (char *)a1;
    v9 = a2 - a1;
    if ((char *)a2 - (char *)a1 >= 5)
    {
      v10 = (unint64_t)(v9 - 2) >> 1;
      v11 = v10 + 1;
      v12 = &a1[v10];
      do
      {
        std::__sift_down[abi:nn180100]<std::_ClassicAlgPolicy,std::greater<int> &,int *>((uint64_t)a1, a4, v9, v12--);
        --v11;
      }
      while (v11);
    }
    v13 = v6;
    if (v6 != a3)
    {
      v14 = v6;
      do
      {
        v15 = *v14;
        if (*v14 > *a1)
        {
          *v14 = *a1;
          *a1 = v15;
          std::__sift_down[abi:nn180100]<std::_ClassicAlgPolicy,std::greater<int> &,int *>((uint64_t)a1, a4, v9, a1);
        }
        ++v14;
      }
      while (v14 != a3);
      v13 = a3;
    }
    if (v8 >= 5)
    {
      v16 = (unint64_t)v8 >> 2;
      do
      {
        v17 = 0;
        v18 = *a1;
        v19 = a1;
        do
        {
          v20 = &v19[v17 + 1];
          v21 = (2 * v17) | 1;
          v17 = 2 * v17 + 2;
          if (v17 >= v16)
          {
            v22 = *v20;
            v17 = v21;
          }
          else
          {
            v22 = *v20;
            v23 = v20[1];
            if (*v20 >= v23)
              v22 = v20[1];
            if (*v20 <= v23)
              v17 = v21;
            else
              ++v20;
          }
          *v19 = v22;
          v19 = v20;
        }
        while (v17 <= (uint64_t)((unint64_t)(v16 - 2) >> 1));
        if (v20 == --v6)
        {
          *v20 = v18;
        }
        else
        {
          *v20 = *v6;
          *v6 = v18;
          v24 = (char *)v20 - (char *)a1 + 4;
          if (v24 >= 5)
          {
            v25 = (((unint64_t)v24 >> 2) - 2) >> 1;
            v26 = &a1[v25];
            v27 = *v26;
            v28 = *v20;
            if (*v26 > *v20)
            {
              do
              {
                *v20 = v27;
                v20 = v26;
                if (!v25)
                  break;
                v25 = (v25 - 1) >> 1;
                v26 = &a1[v25];
                v27 = *v26;
              }
              while (*v26 > v28);
              *v20 = v28;
            }
          }
        }
      }
      while (v16-- > 2);
    }
    return v13;
  }
  return a3;
}

uint64_t std::__sift_down[abi:nn180100]<std::_ClassicAlgPolicy,std::greater<int> &,int *>(uint64_t result, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  int v10;
  int v11;
  int v12;
  uint64_t v13;
  int v14;

  if (a3 >= 2)
  {
    v4 = (uint64_t)a4 - result;
    v5 = (unint64_t)(a3 - 2) >> 1;
    if (v5 >= ((uint64_t)a4 - result) >> 2)
    {
      v6 = v4 >> 1;
      v7 = (v4 >> 1) + 1;
      v8 = (int *)(result + 4 * v7);
      v9 = v6 + 2;
      if (v9 >= a3)
      {
        v10 = *v8;
      }
      else
      {
        v10 = *v8;
        v11 = v8[1];
        if (*v8 >= v11)
          v10 = v8[1];
        if (*v8 > v11)
        {
          ++v8;
          v7 = v9;
        }
      }
      v12 = *a4;
      if (v10 <= *a4)
      {
        do
        {
          *a4 = v10;
          a4 = v8;
          if (v5 < v7)
            break;
          v13 = (2 * v7) | 1;
          v8 = (int *)(result + 4 * v13);
          v7 = 2 * v7 + 2;
          if (v7 >= a3)
          {
            v10 = *v8;
            v7 = v13;
          }
          else
          {
            v10 = *v8;
            v14 = v8[1];
            if (*v8 >= v14)
              v10 = v8[1];
            if (*v8 <= v14)
              v7 = v13;
            else
              ++v8;
          }
        }
        while (v10 <= v12);
        *a4 = v12;
      }
    }
  }
  return result;
}

int *std::__introsort<std::_ClassicAlgPolicy,std::greater<int> &,int *,false>(int *result, int *a2, uint64_t a3, uint64_t a4, char a5)
{
  int *v8;
  int *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int *v15;
  int v16;
  int *v17;
  char v18;
  BOOL v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  int v45;
  int v46;
  int v47;
  int v48;
  int v49;
  int v50;
  int v51;
  int v52;
  int v53;
  int v54;
  int v55;
  int v56;
  int v57;
  int v58;
  int v59;
  int v60;
  int *v61;
  BOOL v63;
  uint64_t v64;
  int *v65;
  int v66;
  int v67;
  uint64_t v68;
  int *v69;
  int v70;
  int v71;

  v8 = result;
LABEL_2:
  v9 = v8;
LABEL_3:
  v10 = 1 - a4;
  while (2)
  {
    v8 = v9;
    v11 = v10;
    v12 = (char *)a2 - (char *)v9;
    v13 = a2 - v9;
    switch(v13)
    {
      case 0uLL:
      case 1uLL:
        return result;
      case 2uLL:
        v20 = *(a2 - 1);
        v21 = *v9;
        if (v20 > *v9)
        {
          *v9 = v20;
          *(a2 - 1) = v21;
        }
        return result;
      case 3uLL:
        v22 = v9[1];
        v23 = *(a2 - 1);
        if (v22 <= v23)
          v24 = *(a2 - 1);
        else
          v24 = v9[1];
        if (v22 >= v23)
          v22 = *(a2 - 1);
        *(a2 - 1) = v22;
        v9[1] = v24;
        v25 = *(a2 - 1);
        if (v25 <= *v9)
          v26 = *v9;
        else
          v26 = *(a2 - 1);
        if (v25 >= *v9)
          v25 = *v9;
        *(a2 - 1) = v25;
        v28 = *v9;
        v27 = v9[1];
        if (v26 <= v27)
          v28 = v9[1];
        if (v26 < v27)
          v27 = v26;
        *v9 = v28;
        v9[1] = v27;
        return result;
      case 4uLL:
        v30 = v9[1];
        v29 = v9[2];
        if (*v9 <= v29)
          v31 = v9[2];
        else
          v31 = *v9;
        if (*v9 < v29)
          v29 = *v9;
        v9[2] = v29;
        *v9 = v31;
        v32 = *(a2 - 1);
        if (v30 <= v32)
          v33 = *(a2 - 1);
        else
          v33 = v30;
        if (v30 < v32)
          v32 = v30;
        *(a2 - 1) = v32;
        v34 = *v9;
        if (*v9 <= v33)
          v35 = v33;
        else
          v35 = *v9;
        if (v34 >= v33)
          v34 = v33;
        *v9 = v35;
        v9[1] = v34;
        v36 = v9[2];
        v37 = *(a2 - 1);
        if (v36 <= v37)
          v38 = *(a2 - 1);
        else
          v38 = v9[2];
        if (v36 >= v37)
          v36 = *(a2 - 1);
        *(a2 - 1) = v36;
        v39 = v9[1];
        if (v39 <= v38)
          v40 = v38;
        else
          v40 = v9[1];
        if (v39 >= v38)
          v39 = v38;
        v9[1] = v40;
        v9[2] = v39;
        return result;
      case 5uLL:
        v41 = *v9;
        v42 = v9[1];
        if (*v9 <= v42)
          v43 = v9[1];
        else
          v43 = *v9;
        if (v41 >= v42)
          v41 = v9[1];
        *v9 = v43;
        v9[1] = v41;
        v44 = v9[3];
        v45 = *(a2 - 1);
        if (v44 <= v45)
          v46 = *(a2 - 1);
        else
          v46 = v9[3];
        if (v44 >= v45)
          v44 = *(a2 - 1);
        *(a2 - 1) = v44;
        v9[3] = v46;
        v47 = *(a2 - 1);
        v48 = v9[2];
        if (v47 <= v48)
          v49 = v9[2];
        else
          v49 = *(a2 - 1);
        if (v47 >= v48)
          v47 = v9[2];
        *(a2 - 1) = v47;
        v51 = v9[2];
        v50 = v9[3];
        v52 = v9[1];
        if (v49 <= v50)
          v51 = v9[3];
        if (v49 < v50)
          v50 = v49;
        v9[2] = v51;
        v9[3] = v50;
        v53 = *(a2 - 1);
        if (v52 <= v53)
          v54 = *(a2 - 1);
        else
          v54 = v52;
        if (v52 < v53)
          v53 = v52;
        *(a2 - 1) = v53;
        v55 = *v9;
        v57 = v9[2];
        v56 = v9[3];
        if (v56 <= *v9)
          v58 = *v9;
        else
          v58 = v9[3];
        if (v56 >= v55)
          v56 = *v9;
        if (v58 <= v57)
          v55 = v9[2];
        if (v58 < v57)
          v57 = v58;
        if (v56 <= v54)
          v59 = v54;
        else
          v59 = v56;
        if (v56 >= v54)
          v56 = v54;
        if (v59 <= v57)
          v54 = v57;
        *v9 = v55;
        v9[1] = v54;
        if (v59 >= v57)
          v60 = v57;
        else
          v60 = v59;
        v9[2] = v60;
        v9[3] = v56;
        return result;
      default:
        if (v12 > 95)
        {
          if (v11 == 1)
          {
            if (v9 != a2)
              return std::__partial_sort_impl[abi:nn180100]<std::_ClassicAlgPolicy,std::greater<int> &,int *,int *>(v9, a2, a2, a3);
            return result;
          }
          v14 = v13 >> 1;
          v15 = &v9[v13 >> 1];
          if ((unint64_t)v12 < 0x201)
          {
            std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,std::greater<int> &,int *>(&v9[v13 >> 1], v9, a2 - 1);
            if ((a5 & 1) != 0)
              goto LABEL_12;
          }
          else
          {
            std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,std::greater<int> &,int *>(v9, &v9[v13 >> 1], a2 - 1);
            std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,std::greater<int> &,int *>(v9 + 1, v15 - 1, a2 - 2);
            std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,std::greater<int> &,int *>(v9 + 2, &v9[v14 + 1], a2 - 3);
            std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,std::greater<int> &,int *>(v15 - 1, v15, &v9[v14 + 1]);
            v16 = *v9;
            *v9 = *v15;
            *v15 = v16;
            if ((a5 & 1) != 0)
              goto LABEL_12;
          }
          if (*(v9 - 1) <= *v9)
          {
            result = std::__partition_with_equals_on_left[abi:nn180100]<std::_ClassicAlgPolicy,int *,std::greater<int> &>(v9, a2);
            v9 = result;
            goto LABEL_17;
          }
LABEL_12:
          v17 = std::__partition_with_equals_on_right[abi:nn180100]<std::_ClassicAlgPolicy,int *,std::greater<int> &>(v9, a2);
          if ((v18 & 1) == 0)
            goto LABEL_15;
          v19 = std::__insertion_sort_incomplete[abi:nn180100]<std::_ClassicAlgPolicy,std::greater<int> &,int *>(v9, v17);
          v9 = v17 + 1;
          result = (int *)std::__insertion_sort_incomplete[abi:nn180100]<std::_ClassicAlgPolicy,std::greater<int> &,int *>(v17 + 1, a2);
          if (!(_DWORD)result)
          {
            v10 = v11 + 1;
            if (v19)
              continue;
LABEL_15:
            result = (int *)std::__introsort<std::_ClassicAlgPolicy,std::greater<int> &,int *,false>(v8, v17, a3, -v11, a5 & 1);
            v9 = v17 + 1;
LABEL_17:
            a5 = 0;
            a4 = -v11;
            goto LABEL_3;
          }
          a4 = -v11;
          a2 = v17;
          if (v19)
            return result;
          goto LABEL_2;
        }
        v61 = v9 + 1;
        v63 = v9 == a2 || v61 == a2;
        if ((a5 & 1) != 0)
        {
          if (!v63)
          {
            v64 = 0;
            v65 = v9;
            do
            {
              v67 = *v65;
              v66 = v65[1];
              v65 = v61;
              if (v66 > v67)
              {
                v68 = v64;
                while (1)
                {
                  *(int *)((char *)v9 + v68 + 4) = v67;
                  if (!v68)
                    break;
                  v67 = *(int *)((char *)v9 + v68 - 4);
                  v68 -= 4;
                  if (v66 <= v67)
                  {
                    v69 = (int *)((char *)v9 + v68 + 4);
                    goto LABEL_123;
                  }
                }
                v69 = v9;
LABEL_123:
                *v69 = v66;
              }
              v61 = v65 + 1;
              v64 += 4;
            }
            while (v65 + 1 != a2);
          }
        }
        else if (!v63)
        {
          do
          {
            v71 = *v8;
            v70 = v8[1];
            v8 = v61;
            if (v70 > v71)
            {
              do
              {
                *v61 = v71;
                v71 = *(v61 - 2);
                --v61;
              }
              while (v70 > v71);
              *v61 = v70;
            }
            v61 = v8 + 1;
          }
          while (v8 + 1 != a2);
        }
        return result;
    }
  }
}

uint64_t std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,std::greater<int> &,int *>(int *a1, int *a2, int *a3)
{
  int v3;
  int v4;
  int v5;
  int v6;

  v3 = *a2;
  v4 = *a1;
  v5 = *a3;
  if (*a2 > *a1)
  {
    if (v5 > v3)
    {
      *a1 = v5;
      *a3 = v4;
      return 1;
    }
    *a1 = v3;
    *a2 = v4;
    if (*a3 <= v4)
      return 1;
    *a2 = *a3;
    *a3 = v4;
    return 2;
  }
  if (v5 > v3)
  {
    *a2 = v5;
    *a3 = v3;
    v6 = *a1;
    if (*a2 <= *a1)
      return 1;
    *a1 = *a2;
    *a2 = v6;
    return 2;
  }
  return 0;
}

int *std::__partition_with_equals_on_left[abi:nn180100]<std::_ClassicAlgPolicy,int *,std::greater<int> &>(int *a1, int *a2)
{
  int v2;
  int *v3;
  int v4;
  int *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;

  v2 = *a1;
  if (*a1 <= *(a2 - 1))
  {
    v5 = a1 + 1;
    do
    {
      v3 = v5;
      if (v5 >= a2)
        break;
      ++v5;
    }
    while (v2 <= *v3);
  }
  else
  {
    v3 = a1;
    do
    {
      v4 = v3[1];
      ++v3;
    }
    while (v2 <= v4);
  }
  if (v3 < a2)
  {
    do
      v6 = *--a2;
    while (v2 > v6);
  }
  if (v3 < a2)
  {
    v7 = *v3;
    v8 = *a2;
    do
    {
      *v3 = v8;
      *a2 = v7;
      do
      {
        v9 = v3[1];
        ++v3;
        v7 = v9;
      }
      while (v2 <= v9);
      do
      {
        v10 = *--a2;
        v8 = v10;
      }
      while (v2 > v10);
    }
    while (v3 < a2);
  }
  if (v3 - 1 != a1)
    *a1 = *(v3 - 1);
  *(v3 - 1) = v2;
  return v3;
}

int *std::__partition_with_equals_on_right[abi:nn180100]<std::_ClassicAlgPolicy,int *,std::greater<int> &>(int *a1, int *a2)
{
  uint64_t v2;
  int v3;
  int v4;
  int *v5;
  int *v6;
  int v7;
  int v8;
  int v9;
  int *v10;
  int *v11;
  int v12;
  int v13;

  v2 = 0;
  v3 = *a1;
  do
    v4 = a1[++v2];
  while (v4 > v3);
  v5 = &a1[v2];
  v6 = &a1[v2 - 1];
  if (v2 == 1)
  {
    do
    {
      if (v5 >= a2)
        break;
      v8 = *--a2;
    }
    while (v8 <= v3);
  }
  else
  {
    do
      v7 = *--a2;
    while (v7 <= v3);
  }
  if (v5 < a2)
  {
    v9 = *a2;
    v10 = &a1[v2];
    v11 = a2;
    do
    {
      *v10 = v9;
      *v11 = v4;
      do
      {
        v12 = v10[1];
        ++v10;
        v4 = v12;
      }
      while (v12 > v3);
      do
      {
        v13 = *--v11;
        v9 = v13;
      }
      while (v13 <= v3);
    }
    while (v10 < v11);
    v6 = v10 - 1;
  }
  if (v6 != a1)
    *a1 = *v6;
  *v6 = v3;
  return v6;
}

BOOL std::__insertion_sort_incomplete[abi:nn180100]<std::_ClassicAlgPolicy,std::greater<int> &,int *>(_DWORD *a1, int *a2)
{
  uint64_t v2;
  int v3;
  int v4;
  int v5;
  int *v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int *v12;
  int v13;
  uint64_t v14;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  _DWORD *v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  int v45;
  int v46;
  int v47;
  int v48;
  int v49;
  int v50;
  int v51;
  int v52;
  int v53;
  int v54;
  int v55;
  int v56;
  int v57;
  int v58;

  v2 = 1;
  switch(a2 - a1)
  {
    case 0:
    case 1:
      return v2;
    case 2:
      v3 = *(a2 - 1);
      v4 = *a1;
      if (v3 > *a1)
      {
        *a1 = v3;
        *(a2 - 1) = v4;
      }
      return 1;
    case 3:
      v20 = a1[1];
      v21 = *(a2 - 1);
      if (v20 <= v21)
        v22 = *(a2 - 1);
      else
        v22 = a1[1];
      if (v20 >= v21)
        v20 = *(a2 - 1);
      *(a2 - 1) = v20;
      a1[1] = v22;
      v23 = *(a2 - 1);
      if (v23 <= *a1)
        v24 = *a1;
      else
        v24 = *(a2 - 1);
      if (v23 >= *a1)
        v23 = *a1;
      *(a2 - 1) = v23;
      v26 = *a1;
      v25 = a1[1];
      if (v24 <= v25)
        v26 = a1[1];
      if (v24 < v25)
        v25 = v24;
      *a1 = v26;
      a1[1] = v25;
      return 1;
    case 4:
      v48 = a1[1];
      v47 = a1[2];
      if (*a1 <= v47)
        v49 = a1[2];
      else
        v49 = *a1;
      if (*a1 < v47)
        v47 = *a1;
      a1[2] = v47;
      *a1 = v49;
      v50 = *(a2 - 1);
      if (v48 <= v50)
        v51 = *(a2 - 1);
      else
        v51 = v48;
      if (v48 < v50)
        v50 = v48;
      *(a2 - 1) = v50;
      v52 = *a1;
      if (*a1 <= v51)
        v53 = v51;
      else
        v53 = *a1;
      if (v52 >= v51)
        v52 = v51;
      *a1 = v53;
      a1[1] = v52;
      v54 = a1[2];
      v55 = *(a2 - 1);
      if (v54 <= v55)
        v56 = *(a2 - 1);
      else
        v56 = a1[2];
      if (v54 >= v55)
        v54 = *(a2 - 1);
      *(a2 - 1) = v54;
      v57 = a1[1];
      if (v57 <= v56)
        v58 = v56;
      else
        v58 = a1[1];
      if (v57 >= v56)
        v57 = v56;
      a1[1] = v58;
      a1[2] = v57;
      return 1;
    case 5:
      v27 = *a1;
      v28 = a1[1];
      if (*a1 <= v28)
        v29 = a1[1];
      else
        v29 = *a1;
      if (v27 >= v28)
        v27 = a1[1];
      *a1 = v29;
      a1[1] = v27;
      v30 = a1[3];
      v31 = *(a2 - 1);
      if (v30 <= v31)
        v32 = *(a2 - 1);
      else
        v32 = a1[3];
      if (v30 >= v31)
        v30 = *(a2 - 1);
      *(a2 - 1) = v30;
      a1[3] = v32;
      v33 = *(a2 - 1);
      v34 = a1[2];
      if (v33 <= v34)
        v35 = a1[2];
      else
        v35 = *(a2 - 1);
      if (v33 >= v34)
        v33 = a1[2];
      *(a2 - 1) = v33;
      v37 = a1[2];
      v36 = a1[3];
      v38 = a1[1];
      if (v35 <= v36)
        v37 = a1[3];
      if (v35 < v36)
        v36 = v35;
      a1[2] = v37;
      a1[3] = v36;
      v39 = *(a2 - 1);
      if (v38 <= v39)
        v40 = *(a2 - 1);
      else
        v40 = v38;
      if (v38 < v39)
        v39 = v38;
      *(a2 - 1) = v39;
      v41 = *a1;
      v43 = a1[2];
      v42 = a1[3];
      if (v42 <= *a1)
        v44 = *a1;
      else
        v44 = a1[3];
      if (v42 >= v41)
        v42 = *a1;
      if (v44 <= v43)
        v41 = a1[2];
      if (v44 < v43)
        v43 = v44;
      if (v42 <= v40)
        v45 = v40;
      else
        v45 = v42;
      if (v42 >= v40)
        v42 = v40;
      if (v45 <= v43)
        v40 = v43;
      *a1 = v41;
      a1[1] = v40;
      if (v45 >= v43)
        v46 = v43;
      else
        v46 = v45;
      a1[2] = v46;
      a1[3] = v42;
      return 1;
    default:
      v6 = a1 + 2;
      v5 = a1[2];
      v8 = *a1;
      v7 = a1[1];
      if (v7 <= v5)
        v9 = a1[2];
      else
        v9 = a1[1];
      if (v7 < v5)
        v5 = a1[1];
      if (v5 <= v8)
        v10 = *a1;
      else
        v10 = v5;
      if (v5 >= v8)
        v5 = *a1;
      *v6 = v5;
      if (v10 <= v9)
        v11 = v9;
      else
        v11 = v8;
      if (v10 >= v9)
        v10 = v9;
      *a1 = v11;
      a1[1] = v10;
      v12 = a1 + 3;
      if (a1 + 3 == a2)
        return 1;
      v13 = 0;
      v14 = 12;
      break;
  }
  while (1)
  {
    v15 = *v12;
    v16 = *v6;
    if (*v12 > v16)
    {
      v17 = v14;
      while (1)
      {
        *(_DWORD *)((char *)a1 + v17) = v16;
        v18 = v17 - 4;
        if (v17 == 4)
          break;
        v16 = *(_DWORD *)((char *)a1 + v17 - 8);
        v17 -= 4;
        if (v15 <= v16)
        {
          v19 = (_DWORD *)((char *)a1 + v18);
          goto LABEL_27;
        }
      }
      v19 = a1;
LABEL_27:
      *v19 = v15;
      if (++v13 == 8)
        return v12 + 1 == a2;
    }
    v6 = v12;
    v14 += 4;
    if (++v12 == a2)
      return 1;
  }
}

uint64_t std::deque<int>::~deque[abi:nn180100](_QWORD *a1)
{
  void **v2;
  void **v3;
  unint64_t v4;
  _QWORD *v5;
  unint64_t v6;
  void **v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;

  v2 = (void **)a1[1];
  v3 = (void **)a1[2];
  v4 = (char *)v3 - (char *)v2;
  if (v3 == v2)
  {
    v5 = a1 + 5;
  }
  else
  {
    v5 = a1 + 5;
    v6 = a1[4];
    v7 = &v2[v6 >> 10];
    v8 = (uint64_t)*v7;
    v9 = (uint64_t)*v7 + 4 * (v6 & 0x3FF);
    while ((void *)v9 != *(char **)((char *)v2 + (((a1[5] + v6) >> 7) & 0x1FFFFFFFFFFFFF8))
                        + 4 * ((a1[5] + v6) & 0x3FF))
    {
      v9 += 4;
      if (v9 - v8 == 4096)
      {
        v10 = (uint64_t)v7[1];
        ++v7;
        v8 = v10;
        v9 = v10;
      }
    }
  }
  *v5 = 0;
  if (v4 >= 0x11)
  {
    do
    {
      operator delete(*v2);
      v3 = (void **)a1[2];
      v2 = (void **)(a1[1] + 8);
      a1[1] = v2;
      v4 = (char *)v3 - (char *)v2;
    }
    while ((unint64_t)((char *)v3 - (char *)v2) > 0x10);
  }
  v11 = v4 >> 3;
  if (v11 == 1)
  {
    v12 = 512;
  }
  else
  {
    if (v11 != 2)
      goto LABEL_15;
    v12 = 1024;
  }
  a1[4] = v12;
LABEL_15:
  while (v2 != v3)
  {
    v13 = *v2++;
    operator delete(v13);
  }
  return std::__split_buffer<int *>::~__split_buffer((uint64_t)a1);
}

uint64_t std::__split_buffer<int *>::~__split_buffer(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)(a1 + 8);
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != v3)
    *(_QWORD *)(a1 + 16) = v2 + ((v3 - v2 + 7) & 0xFFFFFFFFFFFFFFF8);
  v4 = *(void **)a1;
  if (*(_QWORD *)a1)
    operator delete(v4);
  return a1;
}

void std::vector<AnimCodec::ArithmeticContext>::__append(char **a1, unint64_t a2)
{
  uint64_t v4;
  char *v5;
  char *v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  __int16 v18;

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 1)
  {
    if (a2)
    {
      memset_pattern16(*(void **)(v4 - 8), &unk_1DD02D790, 2 * a2);
      v7 += 2 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    v8 = *a1;
    v9 = v7 - *a1;
    v10 = a2 + (v9 >> 1);
    if (v10 < 0)
      abort();
    v11 = v9 >> 1;
    v12 = v5 - v8;
    if (v12 > v10)
      v10 = v12;
    if (v12 >= 0x7FFFFFFFFFFFFFFELL)
      v13 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v13 = v10;
    if (v13)
    {
      v14 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned short>>(v4, v13);
      v8 = *a1;
      v7 = a1[1];
    }
    else
    {
      v14 = 0;
    }
    v15 = &v14[2 * v11];
    v16 = &v14[2 * v13];
    memset_pattern16(v15, &unk_1DD02D790, 2 * a2);
    v17 = &v15[2 * a2];
    while (v7 != v8)
    {
      v18 = *((_WORD *)v7 - 1);
      v7 -= 2;
      *((_WORD *)v15 - 1) = v18;
      v15 -= 2;
    }
    *a1 = v15;
    a1[1] = v17;
    a1[2] = v16;
    if (v8)
      operator delete(v8);
  }
}

void AnimCodec::AnimDecoder::getInfo()
{
  __assert_rtn("getInfo", "AnimDecoder.cpp", 47, "headerSizeInBytes == HeaderSizeInBytes");
}

void AnimCodec::StaticAdjacencyInformation::neighborsStartIndex()
{
  __assert_rtn("neighborsStartIndex", "AnimCodec.h", 176, "i < int32_t(_neighborCount.size())");
}

void AnimCodec::StaticAdjacencyInformation::neighborsEndIndex()
{
  __assert_rtn("neighborsEndIndex", "AnimCodec.h", 181, "i < int32_t(_neighborCount.size())");
}

void AnimCodec::StaticAdjacencyInformation::incrementNeighborCount()
{
  __assert_rtn("incrementNeighborCount", "AnimCodec.h", 135, "i < int32_t(_neighborCount.size())");
}

void AnimCodec::StaticAdjacencyInformation::addNeighbor()
{
  __assert_rtn("addNeighbor", "AnimCodec.h", 162, "_neighborCount[i] < maxNeighborCount(i)");
}

void AnimCodec::StaticAdjacencyInformation::maxNeighborCount()
{
  __assert_rtn("maxNeighborCount", "AnimCodec.h", 152, "i < int32_t(_neighborCount.size())");
}

uint64_t AnimCodec::AnimEncoder::compress(uint64_t a1, AnimCodec *this, int *a3, uint64_t a4, uint64_t a5, int *a6, AnimCodec::StaticAdjacencyInformation *a7, int a8, uint64_t a9, uint64_t a10, unint64_t a11, uint64_t *a12, _DWORD *a13)
{
  uint64_t v13;
  int v14;
  std::vector<unsigned int> __p;
  _BYTE v20[64];
  uint64_t v21;

  v13 = 2;
  if (a5 && a6 && a9)
  {
    v14 = a5;
    if (4 * a5 * (uint64_t)a6 * a9 + 1024 >= a11 && HIDWORD(a11) == 0)
    {
      v21 = 0;
      memset(v20, 0, sizeof(v20));
      memset(&__p, 0, sizeof(__p));
      v13 = AnimCodec::ComputeAdjacencyInfo(this, a3, a6, (int)a7, a8, (std::vector<unsigned int> *)v20, a7);
      if (!(_DWORD)v13)
      {
        v13 = AnimCodec::ComputeTraversalOrder((AnimCodec::StaticAdjacencyInformation *)v20, &__p);
        if (!(_DWORD)v13)
          v13 = AnimCodec::AnimEncoder::compress(a1, a4, (AnimCodec::StaticAdjacencyInformation *)v20, &__p, v14, a9, a10, a11, a12, a13);
      }
      if (__p.__begin_)
      {
        __p.__end_ = __p.__begin_;
        operator delete(__p.__begin_);
      }
      vmesh::StaticAdjacencyInformation<Pair>::~StaticAdjacencyInformation((uint64_t)v20);
    }
    else
    {
      return 1;
    }
  }
  return v13;
}

uint64_t AnimCodec::AnimEncoder::compress(uint64_t a1, uint64_t a2, AnimCodec::StaticAdjacencyInformation *a3, _QWORD *a4, int a5, int a6, uint64_t a7, unint64_t a8, uint64_t *a9, _DWORD *a10)
{
  uint64_t result;
  unint64_t v12;
  uint64_t v13;
  int v14;
  _QWORD v15[2];
  uint64_t v16;

  v15[0] = a7;
  v15[1] = a8;
  *(_DWORD *)a7 = 179426549;
  *(_DWORD *)(a7 + 8) = 1;
  *(_DWORD *)(a7 + 16) = a6;
  *(_BYTE *)(a7 + 20) = *a10;
  *(_BYTE *)(a7 + 21) = a10[1];
  *(_WORD *)(a7 + 22) = 0;
  v16 = 24;
  result = AnimCodec::AnimEncoder::compress(a1, a2, a3, a4, a5, a6, (uint64_t)v15);
  if (!(_DWORD)result)
  {
    v12 = v16;
    *a9 = v16;
    if (v12 <= a8)
    {
      v13 = v15[0];
      *(_DWORD *)(v15[0] + 12) = v12;
      v14 = AnimCodec::ComputeCRC32(v13 + 8, (const unsigned __int8 *)(*a9 - 8));
      result = 0;
      *(_DWORD *)(v13 + 4) = v14;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

uint64_t AnimCodec::AnimEncoder::compress(uint64_t a1, uint64_t a2, AnimCodec::StaticAdjacencyInformation *a3, _QWORD *a4, int a5, int a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v12;
  int v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  int v20;
  std::vector<unsigned int>::pointer begin;
  std::vector<unsigned int>::pointer v22;
  unsigned int *v23;
  uint64_t v24;
  unsigned int v25;
  int started;
  int v27;
  unsigned int v28;
  uint64_t v29;
  std::vector<unsigned int>::pointer v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  std::vector<unsigned int>::pointer v35;
  std::vector<unsigned int>::pointer v36;
  uint64_t v37;
  std::vector<unsigned int>::pointer v38;
  std::vector<unsigned int>::pointer v39;
  uint64_t v40;
  std::vector<unsigned int>::pointer v41;
  int v42;
  int v43;
  int v44;
  unsigned int v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unsigned int v49;
  char *v50;
  _WORD *v51;
  unsigned int v52;
  unsigned int v53;
  uint64_t v54;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  AnimCodec::StaticAdjacencyInformation *v61;
  std::vector<unsigned int> v63;
  std::vector<unsigned int> v64;
  std::vector<unsigned int> v65;
  void *__p;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  uint64_t v77;
  __int16 v78;
  int v79;
  uint64_t v80;

  v7 = a7;
  v12 = *(_QWORD *)(a7 + 16);
  v13 = *(_DWORD *)(a7 + 8) - v12;
  v14 = *(_QWORD *)a7 + v12;
  v79 = v13;
  v80 = v14;
  AnimCodec::ArithmeticEncoder::start((uint64_t)&v79);
  v15 = *((_QWORD *)a3 + 4) - *((_QWORD *)a3 + 3);
  if ((int)(v15 >> 2) < 1)
    return 2;
  v59 = v15 >> 2;
  v78 = 0x8000;
  v75 = 0;
  v76 = 0;
  v77 = 0;
  v72 = 0;
  v73 = 0;
  v74 = 0;
  v69 = 0;
  v70 = 0;
  v71 = 0;
  __p = 0;
  v67 = 0;
  v68 = 0;
  std::vector<AnimCodec::ArithmeticContext>::resize((uint64_t)&v75, a5);
  std::vector<AnimCodec::ArithmeticContext>::resize((uint64_t)&v72, a5);
  std::vector<AnimCodec::ArithmeticContext>::resize((uint64_t)&v69, a5);
  std::vector<AnimCodec::ArithmeticContext>::resize((uint64_t)&__p, 31 * a5);
  memset(&v65, 0, sizeof(v65));
  memset(&v64, 0, sizeof(v64));
  memset(&v63, 0, sizeof(v63));
  std::vector<int>::resize(&v65, a5);
  std::vector<int>::resize(&v64, a5);
  std::vector<int>::resize(&v63, a5);
  if (a6 < 1)
  {
LABEL_41:
    v54 = 0;
    *(_QWORD *)(v7 + 16) += AnimCodec::ArithmeticEncoder::stop((AnimCodec::ArithmeticEncoder *)&v79);
  }
  else
  {
    v57 = v7;
    v58 = 0;
    v60 = (v15 >> 2);
    v61 = a3;
    v16 = a5;
    v56 = a6;
LABEL_4:
    v17 = 0;
    v18 = 1;
LABEL_5:
    v19 = v18;
    v20 = *(_DWORD *)(*a4 + 4 * v17);
    if (a5 >= 1)
    {
      begin = v65.__begin_;
      v22 = v64.__begin_;
      v23 = (unsigned int *)(a2 + 4 * v20 * a5);
      v24 = v16;
      do
      {
        v25 = *v23++;
        *begin++ = v25;
        *v22++ = 0;
        --v24;
      }
      while (v24);
    }
    started = AnimCodec::StaticAdjacencyInformation::neighborsStartIndex(a3, v20);
    v27 = AnimCodec::StaticAdjacencyInformation::neighborsEndIndex(a3, v20);
    if (v27 <= started)
      goto LABEL_21;
    v28 = 0;
    v29 = *((_QWORD *)a3 + 6);
    v30 = v64.__begin_;
    v31 = started;
    while (1)
    {
      v32 = *(_DWORD *)(v29 + 4 * v31);
      if (v32 < 0)
        goto LABEL_17;
      if (v32 >= (int)v59)
        break;
      if (a5 >= 1)
      {
        v33 = 4 * v32 * a5;
        v34 = v16;
        v35 = v30;
        do
        {
          *v35++ += *(_DWORD *)(a2 + v33);
          v33 += 4;
          --v34;
        }
        while (v34);
      }
      ++v28;
      ++v31;
      if (v28 == v27 - started)
      {
        v28 = v27 - started;
LABEL_17:
        if (v28 >= 2)
        {
          if (a5 >= 1)
          {
            v36 = v64.__begin_;
            v37 = v16;
            do
            {
              *v36 = (int)(*v36 + (v28 >> 1)) / (int)v28;
              ++v36;
              --v37;
            }
            while (v37);
            goto LABEL_21;
          }
LABEL_25:
          v18 = 1;
          goto LABEL_26;
        }
LABEL_21:
        if (a5 < 1)
          goto LABEL_25;
        v38 = v65.__begin_;
        v39 = v64.__begin_;
        v18 = 1;
        v40 = v16;
        v41 = v63.__begin_;
        do
        {
          v43 = *v38++;
          v42 = v43;
          v44 = *v39++;
          v45 = v42 - v44;
          *v41++ = v45;
          v18 &= v45 == 0;
          --v40;
        }
        while (v40);
LABEL_26:
        AnimCodec::ArithmeticEncoder::encode((uint64_t)&v79, (v19 ^ v18) & 1, &v78);
        if ((v18 & 1) == 0 && a5 >= 1)
        {
          v46 = 0;
          v47 = 0;
          v48 = 0;
          do
          {
            v49 = v63.__begin_[v47];
            v50 = (char *)v69 + v46;
            if (v49)
            {
              AnimCodec::ArithmeticEncoder::encode((uint64_t)&v79, 1, v50);
              v51 = (char *)v75 + v46;
              if ((v49 & 0x80000000) != 0)
              {
                AnimCodec::ArithmeticEncoder::encode((uint64_t)&v79, 0, v51);
                v49 = -v49;
              }
              else
              {
                AnimCodec::ArithmeticEncoder::encode((uint64_t)&v79, 1, v51);
              }
              if (v49 > 0x1F)
              {
                AnimCodec::ArithmeticEncoder::encode((uint64_t)&v79, 1, (_WORD *)__p + v48);
                AnimCodec::ArithmeticEncoder::encode((uint64_t)&v79, 1, (_WORD *)__p + (v48 + 2));
                AnimCodec::ArithmeticEncoder::encode((uint64_t)&v79, 1, (_WORD *)__p + (v48 + 6));
                AnimCodec::ArithmeticEncoder::encode((uint64_t)&v79, 1, (_WORD *)__p + (v48 + 14));
                AnimCodec::ArithmeticEncoder::encode((uint64_t)&v79, 1, (_WORD *)__p + (v48 + 30));
                AnimCodec::ArithmeticEncoder::encodeExpGolomb((uint64_t)&v79, v49 - 32, 6, (char *)v72 + v46);
                goto LABEL_38;
              }
              v53 = v49 - 1;
              AnimCodec::ArithmeticEncoder::encode((uint64_t)&v79, (v49 - 1) & 1, (_WORD *)__p + v48);
              AnimCodec::ArithmeticEncoder::encode((uint64_t)&v79, ((v49 - 1) >> 1) & 1, (_WORD *)__p + v48 + (((_BYTE)v49 + 1) & 1) + 1);
              AnimCodec::ArithmeticEncoder::encode((uint64_t)&v79, (v53 >> 2) & 1, (_WORD *)__p + v48 + (v53 & 3) + 3);
              AnimCodec::ArithmeticEncoder::encode((uint64_t)&v79, (v53 >> 3) & 1, (_WORD *)__p + v48 + (v53 & 7) + 7);
              v52 = (v49 - 1) >> 4;
              v50 = (char *)__p + 2 * v48 + 2 * ((v49 - 1) & 0xF) + 30;
            }
            else
            {
              v52 = 0;
            }
            AnimCodec::ArithmeticEncoder::encode((uint64_t)&v79, v52, v50);
LABEL_38:
            v48 += 31;
            v46 += 2;
            ++v47;
          }
          while (31 * a5 != v48);
        }
        ++v17;
        a3 = v61;
        v16 = a5;
        if (v17 == v60)
        {
          v7 = v57;
          a2 += 4 * (int)v59 * a5;
          if (++v58 == v56)
            goto LABEL_41;
          goto LABEL_4;
        }
        goto LABEL_5;
      }
    }
    v54 = 2;
  }
  if (v63.__begin_)
  {
    v63.__end_ = v63.__begin_;
    operator delete(v63.__begin_);
  }
  if (v64.__begin_)
  {
    v64.__end_ = v64.__begin_;
    operator delete(v64.__begin_);
  }
  if (v65.__begin_)
  {
    v65.__end_ = v65.__begin_;
    operator delete(v65.__begin_);
  }
  if (__p)
  {
    v67 = __p;
    operator delete(__p);
  }
  if (v69)
  {
    v70 = v69;
    operator delete(v69);
  }
  if (v72)
  {
    v73 = v72;
    operator delete(v72);
  }
  if (v75)
  {
    v76 = v75;
    operator delete(v75);
  }
  return v54;
}

uint64_t AnimCodec::ArithmeticEncoder::encode(uint64_t result, int a2, _WORD *a3)
{
  unsigned int v3;
  int v4;
  unsigned int v5;
  __int16 v6;
  unsigned int v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;

  v3 = (unsigned __int16)*a3;
  v4 = *(_DWORD *)(result + 28);
  v5 = (v4 * v3) >> 16;
  if (a2)
  {
    *(_DWORD *)(result + 24) += v5;
    v5 = v4 - v5;
    v6 = v3 - *(_WORD *)(result + 2 * (v3 >> 8) + 48);
  }
  else
  {
    v6 = *(_WORD *)(result + 2 * ((unsigned __int16)~(_WORD)v3 >> 8) + 48) + v3;
  }
  *(_DWORD *)(result + 28) = v5;
  *a3 = v6;
  if (v5 <= 0x4000)
  {
    v7 = *(_DWORD *)(result + 24);
    v8 = *(_DWORD *)(result + 40);
    while (1)
    {
      v7 *= 2;
      v5 *= 2;
      *(_DWORD *)(result + 24) = v7;
      *(_DWORD *)(result + 28) = v5;
      *(_DWORD *)(result + 40) = ++v8;
      if (v8 == 8)
        break;
LABEL_17:
      if (v5 > 0x4000)
        return result;
    }
    if (HIBYTE(v7))
    {
      v10 = *(_QWORD *)(result + 16) + *(_QWORD *)(result + 8);
      ++*(_BYTE *)(v10 - 1);
      v11 = *(_QWORD *)(result + 16);
      if (*(_DWORD *)(result + 44))
      {
        do
        {
          *(_BYTE *)(*(_QWORD *)(result + 8) + v11) = 0;
          v12 = *(_DWORD *)(result + 44);
          v11 = *(_QWORD *)(result + 16) + 1;
          *(_QWORD *)(result + 16) = v11;
          *(_DWORD *)(result + 44) = --v12;
        }
        while (v12);
      }
    }
    else
    {
      v9 = *(_DWORD *)(result + 44);
      if ((v7 + v5) >> 24)
      {
        *(_DWORD *)(result + 44) = v9 + 1;
LABEL_16:
        v8 = 0;
        v7 = (unsigned __int16)v7;
        *(_DWORD *)(result + 24) = (unsigned __int16)v7;
        *(_DWORD *)(result + 40) = 0;
        goto LABEL_17;
      }
      v11 = *(_QWORD *)(result + 16);
      if (v9)
      {
        do
        {
          *(_BYTE *)(*(_QWORD *)(result + 8) + v11) = -1;
          v13 = *(_DWORD *)(result + 44);
          v11 = *(_QWORD *)(result + 16) + 1;
          *(_QWORD *)(result + 16) = v11;
          *(_DWORD *)(result + 44) = --v13;
        }
        while (v13);
      }
    }
    *(_BYTE *)(*(_QWORD *)(result + 8) + v11) = *(_WORD *)(result + 26);
    ++*(_QWORD *)(result + 16);
    LOWORD(v7) = *(_WORD *)(result + 24);
    v5 = *(_DWORD *)(result + 28);
    goto LABEL_16;
  }
  return result;
}

uint64_t AnimCodec::ArithmeticEncoder::encodeExpGolomb(uint64_t a1, unsigned int a2, int a3, _WORD *a4)
{
  int v5;
  unsigned int v6;
  int i;
  uint64_t result;
  int v10;
  __int16 v11;

  v5 = a3;
  v6 = a2;
  for (i = 1 << a3; v6 >= 1 << v5; i = 1 << v5)
  {
    AnimCodec::ArithmeticEncoder::encode(a1, 1, a4);
    ++v5;
    v6 -= i;
  }
  result = AnimCodec::ArithmeticEncoder::encode(a1, 0, a4);
  if (v5)
  {
    v10 = v5 - 1;
    do
    {
      v11 = 0x8000;
      result = AnimCodec::ArithmeticEncoder::encode(a1, (v6 >> v10--) & 1, &v11);
    }
    while (v10 != -1);
  }
  return result;
}

unint64_t AnimCodec::ArithmeticEncoder::stop(AnimCodec::ArithmeticEncoder *this)
{
  int v1;
  int v2;
  int v3;
  unsigned int v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;

  v1 = 0;
  v2 = *((_DWORD *)this + 10);
  v3 = *((_DWORD *)this + 6);
  do
  {
    if ((v3 | ((2 << v1) - 1)) > *((_DWORD *)this + 7) - 1)
      break;
    ++v1;
  }
  while (v1 != 16);
  v4 = v3 | ~(-1 << v1);
  *((_DWORD *)this + 6) = v4;
  if (v2 <= 7)
  {
    v5 = v2 - 8;
    do
      v4 = (2 * v4) | 1;
    while (!__CFADD__(v5++, 1));
    *((_DWORD *)this + 6) = v4;
    *((_DWORD *)this + 10) = 8;
  }
  if (HIBYTE(v4))
  {
    v7 = *((_QWORD *)this + 2) + *((_QWORD *)this + 1);
    ++*(_BYTE *)(v7 - 1);
    if (*((_DWORD *)this + 11))
    {
      v8 = *((_QWORD *)this + 2);
      do
      {
        *(_BYTE *)(*((_QWORD *)this + 1) + v8) = 0;
        v9 = *((_DWORD *)this + 11);
        v8 = *((_QWORD *)this + 2) + 1;
        *((_QWORD *)this + 2) = v8;
        *((_DWORD *)this + 11) = --v9;
      }
      while (v9);
    }
  }
  else if (*((_DWORD *)this + 11))
  {
    v10 = *((_QWORD *)this + 2);
    do
    {
      *(_BYTE *)(*((_QWORD *)this + 1) + v10) = -1;
      v11 = *((_DWORD *)this + 11);
      v10 = *((_QWORD *)this + 2) + 1;
      *((_QWORD *)this + 2) = v10;
      *((_DWORD *)this + 11) = --v11;
    }
    while (v11);
  }
  *(_BYTE *)(*((_QWORD *)this + 1) + *((_QWORD *)this + 2)) = *((_WORD *)this + 13);
  v12 = *((_QWORD *)this + 1);
  v13 = *((_QWORD *)this + 2) + 1;
  *((_QWORD *)this + 2) = v13;
  *(_BYTE *)(v12 + v13) = BYTE1(*((_DWORD *)this + 6));
  v14 = *((_QWORD *)this + 2) + 1;
  *((_QWORD *)this + 2) = v14;
  if (v2 >= 1)
  {
    *(_BYTE *)(*((_QWORD *)this + 1) + v14) = *((_DWORD *)this + 6);
    v14 = *((_QWORD *)this + 2) + 1;
    *((_QWORD *)this + 2) = v14;
  }
  if (v14 >= 2)
  {
    v15 = *((_QWORD *)this + 1) - 1;
    while (*(unsigned __int8 *)(v15 + v14) == 255)
    {
      *((_QWORD *)this + 2) = --v14;
      if (v14 <= 1)
        return 1;
    }
  }
  return v14;
}

uint64_t AnimCodec::ArithmeticEncoder::start(uint64_t this)
{
  uint64_t v1;
  __int128 v2;
  uint64_t v3;

  v1 = 0;
  *(_QWORD *)&v2 = 0xFFFF00000000;
  *((_QWORD *)&v2 + 1) = 0xFFFF00000000;
  *(_OWORD *)(this + 24) = v2;
  *(_QWORD *)(this + 16) = 0;
  *(_QWORD *)(this + 40) = 0;
  v3 = 0x217u;
  do
  {
    *(_WORD *)(this + v1 * 2 + 48) = word_1DD02D7A8[v1];
    *(_WORD *)(this + v3 * 2) = word_1DD02D7A8[v3 - 280];
    --v3;
    ++v1;
  }
  while (v1 != 256);
  return this;
}

void *AnimCodec::ArithmeticDecoder::start(AnimCodec::ArithmeticDecoder *this)
{
  __int128 v1;
  unsigned int v2;
  unsigned __int8 *v3;
  int v4;
  int v5;
  int v6;
  int v7;

  *(_QWORD *)&v1 = 0xFFFF000000000000;
  *((_QWORD *)&v1 + 1) = 0xFFFF000000000000;
  *(_OWORD *)((char *)this + 24) = v1;
  *((_QWORD *)this + 5) = 16;
  v2 = *(_DWORD *)this;
  if (*(int *)this < 1)
  {
    v4 = -16777216;
    goto LABEL_7;
  }
  v3 = (unsigned __int8 *)*((_QWORD *)this + 1);
  v4 = *v3 << 24;
  *((_DWORD *)this + 8) = v4;
  if (v2 == 1)
  {
LABEL_7:
    v5 = v4 | 0xFF0000;
    goto LABEL_8;
  }
  v5 = v4 | (v3[1] << 16);
  *((_DWORD *)this + 8) = v5;
  if (v2 <= 2)
  {
LABEL_8:
    v6 = v5 | 0xFF00;
    goto LABEL_9;
  }
  v6 = v5 | (v3[2] << 8);
  *((_DWORD *)this + 8) = v6;
  if (v2 == 3)
  {
LABEL_9:
    v7 = 255;
    goto LABEL_10;
  }
  v7 = v3[3];
LABEL_10:
  *((_DWORD *)this + 8) = v7 | v6;
  *((_QWORD *)this + 2) = 3;
  return memcpy((char *)this + 48, &unk_1DD02D9A8, 0x400uLL);
}

uint64_t AnimCodec::ComputeCRC32(uint64_t this, const unsigned __int8 *a2)
{
  unsigned __int8 *v2;
  int v3;

  if (!a2)
    return 0xFFFFFFFFLL;
  v2 = (unsigned __int8 *)this;
  LODWORD(this) = -1;
  do
  {
    v3 = *v2++;
    this = (dword_1DD02DDA8[v3 ^ BYTE3(this)] ^ ((_DWORD)this << 8));
    --a2;
  }
  while (a2);
  return this;
}

void C3DShapeMeshCreationInitProfile_cold_1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "profilePath.points";
  _os_log_fault_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Null argument", (uint8_t *)&v1, 0xCu);
}

void C3DMeshCreateText_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_ERROR, "Error: C3DMeshCreateTextFrame: C3DTextFrameRef object is NULL, will create NULL mesh\n", v1, 2u);
}

void Token::str()
{
  __assert_rtn("str", "C3DTokenizer.hpp", 75, "mpSource");
}

void C3DSceneSourceGetFileFormat_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, a2, a3, "Error: unabled to create a read stream at %@", a5, a6, a7, a8, 2u);
}

void C3DSceneSourceCreateSceneAtIndex_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, a2, a3, "Error: failed to load %@ - unknown file format.", a5, a6, a7, a8, 2u);
}

void C3D::CopyTextureComputePass::execute(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "srcElementType == dstElementType";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Type mismatch", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "descriptor().renderStartIndex == 0";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. renderStartIndex is not taken into account in this pass", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

void SCNMTLComputeCommandEncoder::dispatchOnTextureCube(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "_computePipelineState";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

void C3D::SmartPtr<SCNMTLRenderPipeline *,C3D::detail::NSRetainFct,C3D::detail::NSReleaseFct>::operator SCNMTLRenderPipeline *(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "_ptr != NULL";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Dereferencing null pointer", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

void SCNMTLRenderCommandEncoder::setFragmentTexture(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "!texture || [texture conformsToProtocol:@protocol(MTLTexture)]";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. texture is not a MTLTexture", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

void SCNMTLComputeCommandEncoder::_bindPendingTextures(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "firstIndexOfRange == UINT_MAX";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. Null argument", a1);
}

void SCNMTLRenderCommandEncoder::applyChangedStates(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "SCNMTLDeviceSupportsDepthClipMode(_encoder.device)";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Depth Clip Mode is not supported on this device", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

void ShaderConverter::Parse()
{
  __assert_rtn("Parse", "C3DShaderConverter.mm", 1258, "mpTokenizer == nullptr");
}

void __CopyParticles_cold_1(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "invLifeSpanArray";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. Null argument", a1);
}

void __CopyParticles_cold_2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "dstParticles != srcParticles";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", (uint8_t *)&v3);
}

void C3DParticleSystemInstanceDraw_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_ERROR, "Error: ParticleSystem: mismatch in meshes and meshElements", v1, 2u);
}

void C3DParticleSystemInstancePushRendererElements_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "sequence->count + count <= sequence->allocatedCount";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Not enough space allocated", (uint8_t *)&v3);
}

void C3DParticleSystemInstancePushRendererElements_cold_2(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "sequence->count + count <= sequence->allocatedCount";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. Not enough space allocated", a1);
}

void C3DColor4InitWithPropertyList_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, a1, a3, "Error: Color deserialize: could not read the float array", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void C3DColor4InitWithPropertyList_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, a1, a3, "Error: Color deserialize: no color or no deserialized data", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void _C3DCGColorGetComponentsInColorSpace_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "color";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

void C3DGetColorMatchingComputeKernelParameters_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DCCB8000, v0, v1, "Error: Color matching for %@ → %@ could be done more efficiently by switching to a _sRGB variant of the MTLPixelFormat");
  OUTLINED_FUNCTION_1();
}

void C3DGetColorMatchingComputeKernelParameters_cold_3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DCCB8000, v0, v1, "Error: No conversion info for %@ → %@, texture will be copied");
  OUTLINED_FUNCTION_1();
}

void C3DGetColorMatchingComputeKernelParameters_cold_4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DCCB8000, v0, v1, "Error: Failed to compute color conversion parameters for %@ → %@");
  OUTLINED_FUNCTION_1();
}

void _C3DGeometryCFFinalize_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "!geometry->_trackedNodes || !CFSetGetCount(geometry->_trackedNodes)";
  v4 = 2112;
  v5 = a1;
  _os_log_fault_impl(&dword_1DCCB8000, a2, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. No node should be tracked anymore by the geometry %@", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

void C3DGeometryGetName_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DGeometryFillLibraryForSerialization_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DGeometryFinalizeDeserialization_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: Geometry deserialization: cannot find the specified material", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void _C3DGeometryFinalizeDeserialization_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: Geometry deserialization: cannot find the mesh ID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void _C3DGeometryFinalizeDeserialization_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: Geometry deserialization: cannot find the specified mesh", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void _C3DGeometryFinalizeDeserialization_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _loadBindInfos_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_ERROR, "Error: Could not deserialize the property %@ in the serialized effect %@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_1();
}

void C3DGeometryAppendMaterial_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DGeometryCreateCopy_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DGeometryCopy_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DGeometryCopy_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DGeometryTrackNode_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Node should not already been tracked by this geometry", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DGeometryTrackNode_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DGeometryUntrackNode_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DGeometryUntrackNode_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Node should been tracked by this geometry", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DGeometryGeneratePoints_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: Cannot use volume generation on a generic mesh. fallbacking on surface", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DGeometryGeneratePoints_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: cannot generate points : mismatch between vertices and normals count", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void _C3DImageToMDLTexture(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0_3(&dword_1DCCB8000, a1, a3, "Error: C3DImageToMDLTexture not supported for image 3D", v3);
}

void loadMDLAssetWithURL_cold_1()
{
  void *v0;

  v0 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "MDLAssetLoadingOption getMDLAssetLoadingOptionDefaultUSDColorSpace()"), CFSTR("SCNModelIOPrivate.mm"), 42, CFSTR("%s"), dlerror());
  __break(1u);
}

void `anonymous namespace'::add_corners(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "positionAttribute";
  _os_log_fault_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Null argument", (uint8_t *)&v1, 0xCu);
}

void ___ZL53getMDLAssetLoadingOptionDefaultUSDColorSpaceSymbolLocv_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *ModelIOLibrary()"), CFSTR("SCNModelIOPrivate.mm"), 41, CFSTR("%s"), *a1);
  __break(1u);
}

void C3D::SSAORaytracePass::execute(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, a1, a3, "Error: No point of view set for tone mapping pass", a5, a6, a7, a8, 0);
}

{
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, a1, a3, "Error: No camera set for tone mapping pass", a5, a6, a7, a8, 0);
}

void C3DMeshElementCreate_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DMeshElementCreateByMergingElements_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: C3DMeshElementCreateByMergingElements - merging elements with different byte per index", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DMeshElementCreateByMergingElements_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: C3DMeshElementCreateByMergingElements - strip not supported", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DMeshElementCreateByMergingElements_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DMeshElementGetIndexCount_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Internal consistency error: number of indices should be a multiple of number of channels", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __SetIndexes_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: C3DMeshElementSetPrimitives invalid index buffer size", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DMeshElementGetContent_cold_1(unsigned __int8 a1, int a2, os_log_t log)
{
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 136315650;
  v4 = "channel >= 0 && channel < channelCount";
  v5 = 1024;
  v6 = a1;
  v7 = 1024;
  v8 = a2;
  _os_log_fault_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Mesh element has %d channels but channel %d was requested", (uint8_t *)&v3, 0x18u);
  OUTLINED_FUNCTION_1();
}

void __readIndexInBuffer_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = 136315650;
  v3 = "false";
  v4 = 2080;
  v5 = "__readIndexInBuffer";
  v6 = 2048;
  v7 = a1;
  _os_log_fault_impl(&dword_1DCCB8000, a2, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. %s - unsupported index size (%ld)", (uint8_t *)&v2, 0x20u);
}

void C3DMeshElementGetIndexCountWithTypeAndPrimitiveCount_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: C3DMeshElementGetIndexCount:primitive type not handled", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DMeshElementGetChannelsDefineSameTopology_cold_1()
{
  __assert_rtn("C3DMeshElementGetChannelsDefineSameTopology", "C3DMeshElement.c", 1014, "indicesDataLength > topologyIndicesLength");
}

void C3DIndicesContentArrayEnumeratePrimitives_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1DCCB8000, a2, a3, "Unreachable code: Unknown primitive type %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void C3DIndicesContentArrayEnumeratePrimitives_cold_2(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_3(&dword_1DCCB8000, a3, (uint64_t)a3, "Error: unexpected vertex count", a1);
}

void C3DIndicesContentGetTriangleIndex_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1DCCB8000, a2, a3, "Unreachable code: Invalid bytes per index (%d)", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void C3DIndicesContentEnumeratePrimitivesByEvaluatingPrimitiveRanges_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1DCCB8000, a2, a3, "Unreachable code: Unknown primitive type %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void _C3DMeshElementInitWithPropertyList_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: Mesh element deserialization: no faces count", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void _C3DMeshElementInitWithPropertyList_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: Mesh element deserialization: no mesh element type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void _C3DMeshElementInitWithPropertyList_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: Mesh element deserialization: no serialized indices", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void _C3DMeshElementInitWithPropertyList_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: Could not read the indexes", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void _C3DMeshElementInitWithPropertyList_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: Mesh element deserialization: no bytes per index", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void _C3DMeshElementInitWithPropertyList_cold_6(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "_C3DMeshElementInitWithPropertyList";
  _os_log_error_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_ERROR, "Error: invalid propertylist in %s", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

void C3DTransformBoundingSphere_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DTransformBoundingSphere_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __MakeNormalMatrix_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __MakeNormalMatrix_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __CompareMaterials_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __CompareMaterials_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DCreateFlattenedGeometryFromNodeHierarchy_cold_1(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "componentsCount!=0";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. __AllocateNewSource - componentsCount is zero", a1);
}

void __CreateAndDispatchRendererElements_cold_1(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "element";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. Null argument", a1);
}

void _finalizeSplit_cold_1(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "w == dataLength";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. _createSubSource - inconsistent data length", a1);
}

void _finalizeSplit_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. _finalizeSplit - inconsistent data length", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _finalizeSplit_cold_3(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "oldIndexToNewIndex[sourceIndex]";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. inconsistency in _finalizeSplit", a1);
}

void C3DVRAMResourceGetID_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DVRAMResourceSetID_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DMeshCreateWithMeshSourcesAndMeshElements_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DMeshCreateByMergingMeshes_cold_1(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "0";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. Unsupported element type in C3DMeshCreateByMergingMeshes", a1);
}

void C3DMeshSubdivide_cold_1(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "D!=-1 && E!=-1 && F !=-1";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. inconsistency (2) in C3DMeshSubdivide", a1);
}

void C3DMeshSubdivide_cold_2(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_3(&dword_1DCCB8000, a3, (uint64_t)a3, "Error: C3DMeshSubdivide inconsistency", a1);
}

void __TransformAndAppendMeshSource_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: C3DSourceAccessorCopyDataToAccessor failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DWarmupSceneVRAMResourcesForEngineContext_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DCreateTangentsWithGeometryOptimized_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: invalid geometry detected - skip C3DCreateTangentsWithGeometryOptimized", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DCreateTangentsWithGeometryOptimized_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: Cannot generate valid tangents without valid normals", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DCreateTangentsWithGeometryOptimized_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: Cannot generate valid tangents without valid texture coordinates", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DCreateTangentsWithGeometryOptimized_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: Cannot generate tangents without valid positions", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DCreateTangentsWithGeometryOptimized_cold_5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DCreateTangentsWithGeometryOptimized_cold_6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DCreateTangentsWithGeometryOptimized_cold_7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DCreateTangentsWithGeometryOptimized_cold_8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DMeshUnifyNormals_cold_1(int a1, int a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109376;
  v3[1] = a1;
  v4 = 1024;
  v5 = a2;
  _os_log_error_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_ERROR, "Error: target mesh has a different number of vertices (%d != %d)", (uint8_t *)v3, 0xEu);
  OUTLINED_FUNCTION_1();
}

void C3DMeshCreateTangentsIfNeeded_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: Cannot generate tangents without positions", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DMeshCreateTangentsIfNeeded_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: error in C3DMeshCreateTangentsIfNeeded", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DMeshCreateTangentsIfNeeded_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: Cannot generate tangents without texture coordinates", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DNodeGetProjectionInfos_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DAdjustZRangeOfProjectionInfos_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Unreachable code: C3DAdjustZRangeOfProjectionInfos - no root node", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DAdjustZRangeOfProjectionInfos_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Unreachable code: C3DAdjustZRangeOfProjectionInfos - no world matrix", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DAdjustZRangeOfProjectionInfos_cold_3(os_log_t log, float a2, double a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  double v6;
  __int16 v7;
  double v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 136315650;
  v4 = "shortestPosition <= farthestPosition";
  v5 = 2048;
  v6 = a3;
  v7 = 2048;
  v8 = a2;
  _os_log_fault_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. We badly computed zFar (%f) and zNear (%f) in this scene", (uint8_t *)&v3, 0x20u);
}

void C3DAdjustZRangeOfProjectionInfos_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Unreachable code: C3DAdjustZRangeOfProjectionInfos - no scene or no point of view", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DMeshElementCreateIntervalList_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: Given sources must be of the same length for interval list creation", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __MergeRendererElementsSharingSameMaterial_cold_1(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "material == elt->material";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. different material!!!!", a1);
}

void ___unifyNormalsOptimized_block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. unexpected vertex count", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3D::DeferredShadowPass::compile(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, a1, a3, "Error: DeferredShadowPass Setup - no light", a5, a6, a7, a8, 0);
}

void C3D::DeferredShadowPass::execute(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, a1, a3, "Error: _willExecuteDeferredShadows - no light", a5, a6, a7, a8, 0);
}

void C3DHitTestResultGetNode_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DHitTestResultGetTextureCoordinates_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DMeshElementGetPrimitiveGroupBoundingBoxes_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. error in computing triangle bbox", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DIndicesContentGetTriangleIndex_cold_1_0(unsigned __int8 *a1, NSObject *a2)
{
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_1DCCB8000, a2, OS_LOG_TYPE_ERROR, "Unreachable code: Invalid bytes per index (%d)", (uint8_t *)v3, 8u);
  OUTLINED_FUNCTION_5();
}

void __ProcessTriangleRange_Mask_Ind16VrtFloat3CullBack_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_1(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Update %s to support mesh element channels", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __ProcessTriangleRange_Ind16VrtFloat3CullBack_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_1(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Update %s to support mesh element channels", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __ProcessSkinnedGeometryForJointIndex_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __ProcessNode_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. there should be exactly one transposed matrix in here", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DSceneCreateHitTestResultsWithSegment_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DSceneCreateHitTestResultsWithSegment_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DListGetLastLinkableObject_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DListRemoveLinkableObject_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, a1, a3, "Error: inconsistency in lru list (2)", a5, a6, a7, a8, 0);
}

void C3DListRemoveLinkableObject_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, a1, a3, "Error: inconsistency in lru list", a5, a6, a7, a8, 0);
}

void __scn_default_log_block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_DEBUG, "Welcome to SceneKit 602.2 (Aug  3 2024 10:13:03)", v1, 2u);
}

void SCNMTLComputeCommandEncoder::endEncoding(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "_encoder != nil";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", (uint8_t *)&v3);
}

void C3D::SmartPtr<SCNMTLComputePipeline *,C3D::detail::NSRetainFct,C3D::detail::NSReleaseFct>::operator SCNMTLComputePipeline *(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "_ptr != NULL";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Dereferencing null pointer", (uint8_t *)&v3);
}

void C3DNodeIterateTree_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. C3DNodeIterateTree : no callbacks", a5, a6, a7, a8, 2u);
}

void C3DNodeIterateTree_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. C3DNodeIterateTree : null node", a5, a6, a7, a8, 2u);
}

void C3DPlaneMakeWithVectors_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DPlaneMakeWithVectors_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DPlaneMakeWithVectors_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DFXTechniqueCreateFloor_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DFXTechniqueCreateFloor_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _willExecuteRenderFloor(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Fov is larger that 180 degrees. this can't be", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __computeFloorOpacity(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DCreateCopy_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, a2, a3, "Error: object %@ doesn't conform to the copying protocol", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DRemoveSceneRef_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, a2, a3, "Error: invalid ref count for entity %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DGetScene_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Must call GetScene with an entity", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3D::ShadowMapPass::ShadowMapPass(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. ShadowMapPass::setup() - Light doesn't cast shadow", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. ShadowMapPass::setup() - Light missing from light node", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3D::SmartPtr<__C3DMaterial *,C3D::detail::CFRetainFct,C3D::detail::CFReleaseFct>::operator __C3DMaterial *(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Dereferencing null pointer", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DSphereMake_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DStackCFFinalize_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DStackPop_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Stack Pop error", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DStackSetValue_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. C3DStackSetValue only accept CFTypeRef stacks", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DStackGetValue_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. C3DStackGetValue only accept CFTypeRef stacks", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _createConstraintFromDefinition(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "jointDef->bodyA";
  _os_log_fault_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Null argument", (uint8_t *)&v1, 0xCu);
}

void SCNMTLComputeCommandEncoder::dispatchOnGrid1D(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "_computePipelineState";
  _os_log_fault_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Null argument", (uint8_t *)&v1, 0xCu);
}

void SCNMTLBlitCommandEncoder::beginEncoding(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void SCNMTLBlitCommandEncoder::endEncoding(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3D::FinalPass::setup(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_ERROR, "Error: Authoring pass can't find input depth pass.", v1, 2u);
}

void C3D::FinalPass::setup(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3D::FinalPass::_createCustomTechniquePassesIfNeeded(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_3(a1, a2);
  OUTLINED_FUNCTION_2(&dword_1DCCB8000, v2, v3, "Error: C3DEngineContextRenderTechnique - unknown draw instruction", v4);
}

{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_3(a1, a2);
  OUTLINED_FUNCTION_2(&dword_1DCCB8000, v2, v3, "Error: Unsupported draw instruction kC3DFXDrawGeometry", v4);
}

{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_3(a1, a2);
  OUTLINED_FUNCTION_2(&dword_1DCCB8000, v2, v3, "Error: Unsupported draw instruction kC3DFXDrawMetalCustom", v4);
}

void C3D::FinalPass::_createCustomTechniquePassesIfNeeded(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3D::FinalPass::_setupTechniquePassCommonData(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_3(a1, a2);
  OUTLINED_FUNCTION_2(&dword_1DCCB8000, v2, v3, "Unreachable code: Invalid semantic for attachment id", v4);
}

{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_3(a1, a2);
  OUTLINED_FUNCTION_2(&dword_1DCCB8000, v2, v3, "Unreachable code: Invalid render buffer type for attachment id", v4);
}

{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_3(a1, a2);
  OUTLINED_FUNCTION_2(&dword_1DCCB8000, v2, v3, "Unreachable code: Invalid render buffer type for attachment type", v4);
}

void C3D::FinalPass::_setupTechniquePassCommonData(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "param.name";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. Null argument", a1);
}

{
  *(_DWORD *)a1 = 136315138;
  *a2 = "inputIndex < passOutput.size()";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. Render target not found", a1);
}

{
  *(_DWORD *)a1 = 136315138;
  *a2 = "attachmentID < fboDesc->colorsDescriptionCount";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. attachementID out of bounds", a1);
}

void C3D::Array<C3D::Pass *,0u,C3D::StackAllocator>::Array(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. NULL allocator", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3D::Hash<C3D::FinalPass::RenderTarget,C3D::StackAllocator>::_allocate()
{
  __assert_rtn("_allocate", "C3DHash.hpp", 268, "(new_size & (new_size - 1)) == 0");
}

void C3DAnimationClusterCreateWithAnimationGroup_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. C3DAnimationClusterCreateWithAnimationGroup out of bounds", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DAnimationClusterCreateWithAnimationGroup_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. bad count", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DAnimationClusterCreateWithAnimationGroup_cold_3(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "!isnan(t)";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. bad time", a1);
}

void C3DAnimationClusterCreateWithAnimationGroup_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _getAnimations_cold_1(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "CFGetTypeID(animation) == C3DKeyframedAnimationGetTypeID()";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. unexpected animation class", a1);
}

void _getNextKeyTime_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. _getNextKeyTime twice the same keytime?", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DAnimationClusterCopy_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DAnimationClusterCopy_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DCullingSystemAdd_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DCullingSystemUpdateBoundingBox_cold_1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1DCCB8000, a2, OS_LOG_TYPE_ERROR, "Unreachable code: invalid spatial handle (%d) given", (uint8_t *)v2, 8u);
}

void C3DCullingSystemUpdateFlags_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1DCCB8000, v0, v1, "Assertion '%s' failed. invalid spatial handle (%d) given", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void __C3DCullingSystem::remove(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. handle should not point to non existing index", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __C3DCullingSystem::remove()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1DCCB8000, v0, v1, "Assertion '%s' failed. invalid spatial handle (%d) given", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DCullingSystem_AABBRange_x8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DMeshSourceCreateWithData_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. No more than 4 components for mesh source value types", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DMeshSourceCreateWithData_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DMeshSourceCreateWithAccessor_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DMeshSourceCreateDeltaSource_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DMeshSourceCreateDeltaSource_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DMeshSourceCreateDeltaSource_cold_3(int a1, int a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109376;
  v3[1] = a1;
  v4 = 1024;
  v5 = a2;
  _os_log_error_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_ERROR, "Error: Morph: target vertex count do not match base vertex count (%d != %d)", (uint8_t *)v3, 0xEu);
  OUTLINED_FUNCTION_1();
}

void C3DMeshSourceCreateAbsoluteSource_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DMeshSourceCreatePackedCopy_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: MeshSource packing only supports non interleaved float sources", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DMeshSourceCreatePackedCopy_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DMeshSourceCreatePackedCopy_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DMeshSourceCreateUnpackedCopy_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Provided mesh element is not an interval list", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DMeshSourceCreateCopyWithComponentsBaseType_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: Conversion of an interleaved source is not supported, please convert your sources before interleaving", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DMeshSourceCreateCopyWithComponentsBaseType_cold_2(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_ERROR, "Error: C3DMeshSourceCreateCopyWithComponentsBaseType: unsupported type", buf, 2u);
}

void C3DMeshSourceCreateCopyWithComponentsBaseType_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: Conversion from other types than float is not supported", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DMeshSourceCreateCopyWithBaseType_cold_1(__int16 a1, __int16 a2, NSObject *a3)
{
  int v5;
  const __CFString *v6;
  __int16 v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = 138412546;
  v6 = C3DBaseTypeStringDescription(a1);
  v7 = 2112;
  v8 = C3DBaseTypeStringDescription(a2);
  _os_log_error_impl(&dword_1DCCB8000, a3, OS_LOG_TYPE_ERROR, "Error: Conversion from %@ to %@ to is not supported", (uint8_t *)&v5, 0x16u);
}

void _C3DMeshSourceInitWithPropertyList_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: no meshSource deserialize => semantic in mesh source", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void _C3DMeshSourceInitWithPropertyList_cold_2(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "_C3DMeshSourceInitWithPropertyList";
  _os_log_error_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_ERROR, "Error: invalid propertylist in %s", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

void _C3DMeshSourceCopyPropertyList_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: _C3DMeshSourceCopyPropertyList unsupported semantic", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3D::CopyProbeFromOldTextureToNewTexture(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "!newIndex && !oldIndex";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Cube conversion can only happen for global probe", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

void C3D::ComputeProbeFromTextureOrPreviousPass(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "customEnvResource";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

void C3D::Array<unsigned int,0u,C3D::MallocAllocator>::operator[]()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  const void *v3;
  int v4;
  int v5;

  v2 = 136315906;
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_1(&dword_1DCCB8000, v0, v1, "Assertion '%s' failed. Out of bound Array:%p access %d size %d", v2, v3, v4, v5);
}

void _configureStageInputOutputDescriptorWithDeformerFunction()
{
  __assert_rtn("_configureStageInputOutputDescriptorWithDeformerFunction", "SCNMTLDeformerStack.mm", 2134, "info.isActive");
}

void _C3DAnimationManagerAddAnimationNode_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. _C3DAnimationManagerAddAnimationNode - cluster not expected", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DAnimationManagerAddAnimationNode_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DAnimationManagerAddAnimationNode_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DAnimationManagerAddAnimationNode_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __C3DAnimationManagerAddAnimationNodeToAnimationStackWithKey_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __C3DAnimationManagerAddAnimationNodeToAnimationStackWithKey_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. unexpected semantic", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __C3DAnimationManagerAddAnimationNodeToAnimationStackWithKey_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. C3DAnimationManagerNewStackWithKey key already exist", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DAnimationManagerTriggerCallbacks_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. _C3DAnimationManagerAppendCallback triggered while animation manager is muted", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DAnimationManagerGetAnimationNodeForKey_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DAnimationManagerGetAnimationNodeForKey_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DAnimationManagerDiscardAnimationNodeFromStack_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DAnimationManagerDiscardAnimationNodeFromStack_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DAnimationManagerDiscardAnimationNodeFromStack_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. C3DAnimationManagerNewStackWithKey key doesn't exist", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DAnimationManagerSetSystemTime_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DAnimationManagerUpdateConstantCount_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. C3DAnimationManagerUpdateConstantCount", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DAnimationManagerApplyStack_cold_1(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "manager";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. Null argument", a1);
}

void _C3DAnimationManagerApplyStack_cold_2(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "stackItem->_modelValueItem";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. Null argument", a1);
}

void C3DAnimationManagerApplyAnimationsForTarget_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DAnimationManagerNeedsRedraw_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. C3DAnimationManagerNeedsRedraw - inconsistant constant count", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DAnimationManagerGetAnimationPerKeyDictionaryForObject_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DAnimationManagerAddAnimationPlayerForKey_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DAnimationManagerAddAnimationForKey_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DAnimationManagerRemoveAllAnimationsForObject_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DAnimationManagerSetModelValueStorage_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DAnimationManagerAddBinding_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5;
  uint8_t v6[14];
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  C3DEntityGetName(a1);
  OUTLINED_FUNCTION_4_2();
  v7 = a2;
  OUTLINED_FUNCTION_3_1(&dword_1DCCB8000, a3, v5, "Error: Binding: Unable to resolve destination keypath: %@(%@)", v6);
}

void C3DAnimationManagerAddBinding_cold_2()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_2();
  v3 = v0;
  OUTLINED_FUNCTION_3_1(&dword_1DCCB8000, v1, (uint64_t)v1, "Error: Binding: Unable to resolve destination keypath: %@(%@)", v2);
  OUTLINED_FUNCTION_1();
}

void _commonAncessor_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_ERROR, "Error: _resolveAnimationGroupTargets - can't find common ancessor", v1, 2u);
}

void C3DAnimationManagerRemoveAnimationNode_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. C3DAnimationManagerRemoveAnimationNode removing an animation while applying", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DAnimationManagerRemoveAnimationNode_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Inconsistency in _C3DAnimationManagerRemoveAnimationNode: triggered while applying animations", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DPreviousKeyFrameIndexForTime_cold_1(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "middle >= 0";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. _C3DPreviousKeyIndexForTime - unexpected integer division", a1);
}

void _C3DKeyframeControllerSetupWithCapacity_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DKeyframeControllerSetupWithCapacity_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DKeyframeControllerSetKeyframeAtIndex_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: C3DKeyframeControllerRef - index out of bounds", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DKeyframeControllerSetKeyframeAtIndex_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: C3DKeyframeControllerSetKeyframeAtIndex - time is NaN", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DKeyframeControllerSetKeyframeAtIndex_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DKeyframeControllerEvaluateAtTime_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. C3DKeyframeControllerEvaluateAtTime animation has no key", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DKeyframeControllerEvaluateAtTime_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DKeyframeControllerEvaluateAtTime_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DKeyframeControllerInitWithPropertyList_cold_1(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_3(&dword_1DCCB8000, a3, (uint64_t)a3, "Error: _C3DKeyframeControllerCreateKeyframeArray unknown key type", a1);
}

void _C3DKeyframeControllerInitWithPropertyList_cold_2(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "CFGetTypeID(value) == CFNumberGetTypeID()";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. _C3DKeyframeControllerFlattenKeyframeData bad value type", a1);
}

void _C3DKeyframeControllerInitWithPropertyList_cold_4(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "CFGetTypeID(value) == CFBooleanGetTypeID()";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. _C3DKeyframeControllerFlattenKeyframeData bad value type", a1);
}

void _C3DKeyframeControllerInitWithPropertyList_cold_8(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_3(&dword_1DCCB8000, a3, (uint64_t)a3, "Error: _C3DKeyframeControllerFlattenKeyframeData unexpected value", a1);
}

void _C3DKeyframeControllerInitWithPropertyList_cold_9(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. wrong number of keyCount in data", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DKeyframeControllerInitWithPropertyList_cold_10(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DKeyframeControllerInitWithPropertyList_cold_12()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: failed to deserialize animation data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void SCNMTLComputeCommandEncoder::beginEncoding(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "_encoder == nil";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

void C3D::RenderGraph::addDependency(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;

  LOWORD(v3) = 1024;
  HIWORD(v3) = a2;
  OUTLINED_FUNCTION_7(&dword_1DCCB8000, a2, a3, "Error: Output buffer parameters for port %d isn't compatible with input port %d\n", 67109376, v3);
  OUTLINED_FUNCTION_1();
}

void C3D::RenderGraph::addDependency(uint64_t (****a1)(_QWORD), uint64_t (****a2)(_QWORD))
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_6_0(*a1);
  OUTLINED_FUNCTION_6_0(*a2);
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_3_2(&dword_1DCCB8000, v3, v4, "Error: Can't add dependency %s on %s\n", v5, v6, v7, v8, 2u);
  OUTLINED_FUNCTION_4_3();
}

void C3D::RenderGraph::addDependency()
{
  __assert_rtn("addDependency", "C3DRenderGraph.mm", 251, "n2Port == kPartialDependencyPort || node2.pass->descriptor().outputCount() > n2Port");
}

{
  __assert_rtn("addDependency", "C3DRenderGraph.mm", 250, "n1Port == kPartialDependencyPort || node1.pass->descriptor().inputCount() > n1Port");
}

{
  __assert_rtn("addDependency", "C3DRenderGraph.mm", 245, "_renderGraph->size() > n2");
}

{
  __assert_rtn("addDependency", "C3DRenderGraph.mm", 244, "_renderGraph->size() > n1");
}

{
  __assert_rtn("addDependency", "C3DRenderGraph.mm", 276, "a->identifier() != kInvalidPass");
}

{
  __assert_rtn("addDependency", "C3DRenderGraph.mm", 277, "b->identifier() != kInvalidPass");
}

{
  __assert_rtn("addDependency", "C3DRenderGraph.mm", 284, "(*_renderGraph).size() > n2");
}

{
  __assert_rtn("addDependency", "C3DRenderGraph.mm", 283, "(*_renderGraph).size() > n1");
}

{
  __assert_rtn("addDependency", "C3DRenderGraph.mm", 311, "a->identifier() != kInvalidPass");
}

{
  __assert_rtn("addDependency", "C3DRenderGraph.mm", 312, "b->identifier() != kInvalidPass");
}

void C3D::RenderGraph::removeInvalidPasses(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = OUTLINED_FUNCTION_2_2(a1, a2);
  OUTLINED_FUNCTION_14(v2, 4.8149e-34);
  OUTLINED_FUNCTION_5_0(&dword_1DCCB8000, v3, v4, "Error: Pass %s is not linked to the rendering graph and will be ignored check it's input/output");
  OUTLINED_FUNCTION_10();
}

void C3D::RenderGraph::sort()
{
  __assert_rtn("sort", "C3DRenderGraph.mm", 1968, "_renderGraph->size() < 32767");
}

{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_12();
  (**(void (***)(_QWORD))*v1)(*v1);
  (**(void (***)(_QWORD))*v0)(*v0);
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_3_2(&dword_1DCCB8000, v2, v3, "Error: ** Cycle detected ** involving pass %s and input pass %s", v4, v5, v6, v7, 2u);
  OUTLINED_FUNCTION_4_3();
}

void C3D::RenderGraph::sort(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "!_stageFirst->passes.empty()";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Can't find first stage, all nodes have inputs.", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

void C3D::RenderGraph::resolvePartialCompatibility(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "inputParam.type == outputParam->type";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. Can't dispatchToOutput to output of different type", a1);
}

{
  *(_DWORD *)a1 = 136315138;
  *a2 = "strlen(inputParam.name) != 0";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. Can't dispatch input to output with multiple output without a named input.", a1);
}

{
  *(_DWORD *)a1 = 136315138;
  *a2 = "false";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. Invalid pass", a1);
}

void C3D::RenderGraph::resolvePartialCompatibility()
{
  uint64_t *v0;
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_20(v2);
  v3 = *v0;
  *(_DWORD *)v1 = 136315394;
  *(_QWORD *)(v1 + 4) = "outputParam";
  *(_WORD *)(v1 + 12) = 2080;
  *(_QWORD *)(v1 + 14) = v3;
  OUTLINED_FUNCTION_13(&dword_1DCCB8000, v4, v5, "Assertion '%s' failed. Can't dispatch input to output, unable to find output named %s.");
  __break(1u);
}

void C3D::RenderGraph::resolvePartialCompatibility(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = OUTLINED_FUNCTION_2_2(a1, a2);
  OUTLINED_FUNCTION_14(v2, 4.8149e-34);
  OUTLINED_FUNCTION_5_0(&dword_1DCCB8000, v3, v4, "Error: ReadWrite pass %s can't be the present on first stage since it will load it's input.");
  OUTLINED_FUNCTION_10();
}

void C3D::RenderGraph::validate(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "false";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. Unresolved dependency", a1);
}

{
  *(_DWORD *)a1 = 136315138;
  *a2 = "false";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. Incompatible passes", a1);
}

{
  *(_DWORD *)a1 = 136315138;
  *a2 = "false";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. Invalid pass parameter", a1);
}

void C3D::RenderGraph::validate(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = OUTLINED_FUNCTION_2_2(a1, a2);
  OUTLINED_FUNCTION_14(v2, 4.8149e-34);
  OUTLINED_FUNCTION_5_0(&dword_1DCCB8000, v3, v4, "Error: Invalid input parameter for pass %s");
  OUTLINED_FUNCTION_10();
}

{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = OUTLINED_FUNCTION_2_2(a1, a2);
  OUTLINED_FUNCTION_14(v2, 4.8149e-34);
  OUTLINED_FUNCTION_5_0(&dword_1DCCB8000, v3, v4, "Error: Invalid output parameter for pass %s");
  OUTLINED_FUNCTION_10();
}

{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = OUTLINED_FUNCTION_2_2(a1, a2);
  OUTLINED_FUNCTION_14(v2, 4.8149e-34);
  OUTLINED_FUNCTION_5_0(&dword_1DCCB8000, v3, v4, "Error: ReadWrite pass %s must have compatible input/output.");
  OUTLINED_FUNCTION_10();
}

void C3D::RenderGraph::allocateResources(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "res->texture";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. Invalid resource, texture is NULL", a1);
}

{
  *(_DWORD *)a1 = 136315138;
  *a2 = "res->poolSubBuffer.buffer";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. Invalid resource, buffer is NULL", a1);
}

{
  *(_DWORD *)a1 = 136315138;
  *a2 = "res->usedCount >= 0";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. Invalid used count for pass internal resource", a1);
}

{
  *(_DWORD *)a1 = 136315138;
  *a2 = "inputRes";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. Null argument", a1);
}

{
  *(_DWORD *)a1 = 136315138;
  *a2 = "resDestination == outputRes";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. node output resource should match destination node input resource", a1);
}

{
  *(_DWORD *)a1 = 136315138;
  *a2 = "node.resource().outputCount() == node.descriptor().outputCount()";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. Pass output resources should be allocated", a1);
}

void C3D::RenderGraph::allocateResources()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Unreachable code: ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3D::RenderGraph::allocateResources(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v3;
  _DWORD v4[2];
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 8);
  v4[0] = 67109378;
  v4[1] = a2;
  v5 = 2080;
  v6 = v3;
  _os_log_error_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_ERROR, "Error: Resource allocated for output index %d:%s but resource is tagged as \"used internally\"", (uint8_t *)v4, 0x12u);
  OUTLINED_FUNCTION_1();
}

void C3D::__deduceMemoryLess(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "allocator";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. NULL allocator", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

void C3D::__setupRenderEncoder(uint64_t (***a1)(_QWORD), unsigned __int16 *a2, NSObject *a3)
{
  uint64_t v5;
  int v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = OUTLINED_FUNCTION_6_0(a1);
  v6 = *a2;
  v7 = 136315650;
  v8 = "simd_all(viewport != -1)";
  v9 = 2080;
  v10 = v5;
  v11 = 1024;
  v12 = v6;
  _os_log_fault_impl(&dword_1DCCB8000, a3, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Pass %s has specific viewport but it's not specified for index : %d", (uint8_t *)&v7, 0x1Cu);
}

void C3D::__setupRenderEncoder()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Unreachable code: Layered rendering is lacking a multiple output vertex streams generator", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Unreachable code: Multi-viewport rendering is lacking a multiple output vertex streams generator", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void SCNMTLRenderCommandEncoder::setVertexAmplificationCount()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Unreachable code: Vertex amplification shouldn't be active", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3D::__renderSlice(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "nextInput.textureDesc.sampleCount != 1";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. Invalid sample count", a1);
}

{
  *(_DWORD *)a1 = 136315138;
  *a2 = "output.textureDesc.sampleCount != 1";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. Invalid sample count", a1);
}

void C3D::__renderSlice(uint8_t *a1, _DWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 67109120;
  *a2 = 1;
  OUTLINED_FUNCTION_18(&dword_1DCCB8000, (int)a2, a3, "Unreachable code: Invalid buffer type: %hhu", a1);
}

void SCNMTLRenderCommandEncoder::useCommandEncoder(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "commandEncoder";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "commandBuffer";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

void SCNMTLRenderCommandEncoder::endEncoding(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "_encoder != nil";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

void C3D::RenderGraph::execute(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "0";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. Null argument", a1);
}

{
  *(_DWORD *)a1 = 136315138;
  *a2 = "outputResource->type == output.type";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. Mismatch between resource type and resource description type, forgot useInternally ?", a1);
}

void C3D::RenderGraph::addPass()
{
  __assert_rtn("addPass", "C3DRenderGraph.mm", 1766, "passIndex < 32767");
}

void C3D::RenderGraph::addPass(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "pass";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Trying to add NULL pass", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

void C3D::RenderGraph::createResource(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "res->poolSubBuffer.buffer";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Buffer pool allocator failed, buffer is NULL", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "!SCNMTLTextureTypeIsMultisampled((MTLTextureType)resolveParam->textureDesc.textureType)";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Depth resolve texture type must not be multisampled", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "resolveParam->textureDesc.sampleCount == 0 || resolveParam->textureDesc.sampleCount == 1";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Depth resolved texture must have sample count 0 or 1", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "res->texture";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Texture pool allocator failed, texture is NULL", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "res->resolveTexture";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Texture pool allocator failed, texture is NULL", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "param.attachmentType == TextureAttachmentType::Color";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Only color attachement can use drawable texture", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

void C3D::Array<C3D::RefCountedResource,0u,C3D::ScratchAllocator>::back(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "!empty()";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Trying to access last element of empty Array.", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

void C3D::Array<C3D::RenderGraph::Link,0u,C3D::ScratchAllocator>::operator=(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "a._capacity == initial_capacity";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Array capacity inconsistency", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "initial_capacity || _capacity == 0";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Array capacity inconsistency", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "Allocator::_allocator";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. NULL allocator", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

void C3D::Array<C3D::RenderGraph::GraphNode *,0u,C3D::StackAllocator>::pop_back(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "!empty()";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. pop_back() on empty Array.", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

void C3D::RenderGraph::freeConsumedResources(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "res->texture";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. Invalid resource, texture is NULL", a1);
}

{
  *(_DWORD *)a1 = 136315138;
  *a2 = "res->poolSubBuffer.buffer";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. Invalid resource, buffer is NULL", a1);
}

void C3D::RenderGraph::spriteKitTransitionEnd(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "renderEncoder";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

void C3D::RenderGraph::logDependencyInputMismatch(uint64_t *a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = *a2;
  v5 = 134218240;
  v6 = v3;
  v7 = 2048;
  v8 = v4;
  _os_log_error_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_ERROR, "Error: Buffers have different length %lu <-> %lu", (uint8_t *)&v5, 0x16u);
  OUTLINED_FUNCTION_1();
}

void C3D::RenderGraph::logDependencyInputMismatch()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7(&dword_1DCCB8000, v0, v1, "Error: Texture mipmap count mismatch %d <-> %d", v2, v3);
  OUTLINED_FUNCTION_1();
}

{
  unsigned __int16 *v0;
  unsigned __int16 *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_12();
  SCNMTLPixelFormatToString(*v1);
  SCNMTLPixelFormatToString(*v0);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3_2(&dword_1DCCB8000, v2, v3, "Error: Texture pixel format mismatch %@ <-> %@", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_4_3();
}

{
  unsigned __int8 *v0;
  unsigned __int8 *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_12();
  SCNMTLCPUCacheModeToString(*v1);
  SCNMTLCPUCacheModeToString(*v0);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3_2(&dword_1DCCB8000, v2, v3, "Error: Texture CPU cache mode mismatch %@ <-> %@", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_4_3();
}

{
  unsigned __int8 *v0;
  unsigned __int8 *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_12();
  SCNMTLStorageModeToString(*v1);
  SCNMTLStorageModeToString(*v0);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3_2(&dword_1DCCB8000, v2, v3, "Error: Texture storage mode mismatch %@ <-> %@", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_4_3();
}

{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_12();
  SCNMTLTextureTypeToString(v0);
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3_2(&dword_1DCCB8000, v1, v2, "Error: Texture type mismatch %@ <-> %@", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_4_3();
}

{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_12();
  SCNMTLTextureTypeToString(v0);
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3_2(&dword_1DCCB8000, v1, v2, "Error: Texture type mismatch %@ <-> %@", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_4_3();
}

{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  OUTLINED_FUNCTION_19(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7(&dword_1DCCB8000, v0, v1, "Error: Texture depth mismatch %hu <-> %hu", v2, v3);
  OUTLINED_FUNCTION_1();
}

{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  OUTLINED_FUNCTION_19(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7(&dword_1DCCB8000, v0, v1, "Error: Texture height mismatch %hu <-> %hu", v2, v3);
  OUTLINED_FUNCTION_1();
}

{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  OUTLINED_FUNCTION_19(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7(&dword_1DCCB8000, v0, v1, "Error: Texture width mismatch %hu <-> %hu", v2, v3);
  OUTLINED_FUNCTION_1();
}

{
  unsigned __int8 *v0;
  unsigned __int8 *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_12();
  C3D::ResourceTypeDescription(*v1);
  C3D::ResourceTypeDescription(*v0);
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_3_2(&dword_1DCCB8000, v2, v3, "Error: Types mismatch %s <-> %s", v4, v5, v6, v7, 2u);
  OUTLINED_FUNCTION_4_3();
}

void C3D::ScratchAllocator::ScratchAllocator(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "_allocator";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. NULL allocator", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

void C3D::Hash<C3D::Pass *,C3D::ScratchAllocator>::_allocate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_17("_allocate", "C3DHash.hpp", a3, "(new_size & (new_size - 1)) == 0");
}

void VMAllocateChunk()
{
  __assert_rtn("VMAllocateChunk", "C3DScratchAllocator.cpp", 157, "chunk");
}

{
  __assert_rtn("VMAllocateChunk", "C3DScratchAllocator.cpp", 159, "n");
}

{
  __assert_rtn("VMAllocateChunk", "C3DScratchAllocator.cpp", 171, "chunk->data");
}

{
  __assert_rtn("VMAllocateChunk", "C3DScratchAllocator.cpp", 158, "!chunk->next");
}

void VMAllocateChunk(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_1DCCB8000, a2, OS_LOG_TYPE_ERROR, "Unreachable code: vm_allocate failed allocating %zu bytes", (uint8_t *)&v2, 0xCu);
}

void C3DScratchAllocator::Allocate()
{
  __assert_rtn("Allocate", "C3DScratchAllocator.cpp", 79, "last_chunk");
}

void _fillVertexDescriptor(__int16 a1, NSObject *a2)
{
  int v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = C3DBaseTypeStringDescription(a1);
  _os_log_error_impl(&dword_1DCCB8000, a2, OS_LOG_TYPE_ERROR, "Error: format %@ not convertible to MTLVertexFormat", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_4_4();
}

void _fillVertexDescriptor()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1DCCB8000, v0, v1, "Assertion '%s' failed. Semantic %d is not meant to be passed to shaders", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DTimingFunctionInitWithPropertyList_cold_1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "_C3DTimingFunctionInitWithPropertyList";
  _os_log_error_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_ERROR, "Error: invalid propertylist in %s", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

void _C3DTimingFunctionCopyPropertyList_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DTimingFunctionGetControlPoints_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DFXTechniqueCreateWithDescription_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DFXTechniqueSetDescription_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DFXTechniqueCompile_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: C3DFXTechniqueCompile - invalid description (sequence missing or empty) %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void C3DFXTechniqueCompile_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. compiling a technique twice", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DFXTechniqueAppendPass_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_ERROR, "Error: C3DFXTechniqueAppendPass out of capacity", v1, 2u);
}

void C3DFXTechniqueAppendPass_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DFXTechniqueAppendPass_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DFXTechniqueGetPassAtIndex_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 136315650;
  v5 = "index < technique->_count";
  v6 = 2048;
  v7 = a2;
  v8 = 2048;
  v9 = v3;
  _os_log_fault_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. C3DFXTechniqueGetPassAtIndex index %ld is out of bounds (%ld)", (uint8_t *)&v4, 0x20u);
}

void C3DFXTechniqueDeclareSymbol_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "CFDictionaryGetValue(technique->_parameterStorage->parameters, symbolName) == 0";
  v4 = 2112;
  v5 = a1;
  _os_log_fault_impl(&dword_1DCCB8000, a2, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Cannot declare twice the same symbol (%@)", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

void C3DFXTechniqueDeclareSymbol_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Must declare upfront", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DFXTechniqueDeclareSymbol_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DFXTechniqueSetValueForSymbolWithCount_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: C3DFXTechniqueSetValueForSymbol - unknown param named %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void C3DFXTechniqueSetValueForSymbolWithCount_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: C3DFXTechniqueSetValueForSymbol - expect an image for paramName %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void C3DFXTechniqueSetValueForSymbolWithCount_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Assumed count is 1", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DFXTechniqueSetValueForSymbolWithCount_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DFXTechniqueGetValueOffsetForSymbol_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: C3DFXTechniqueGetValueForSymbol - unknown param named %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void C3DFXTechniqueCreateBySequencingTechniques_cold_1(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "!dstPass->_customExecuteBlock";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. _customExecuteBlock not nil", a1);
}

void C3DFXTechniqueCreateBySequencingTechniques_cold_2(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "!dstPass->_customInitializeBlock";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. _customInitializeBlock not nil", a1);
}

void C3DFXTechniqueCreateBySequencingTechniques_cold_3(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "sourcePass->_inputCount == dstPass->_inputCount";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. unexpected pass inputs in merge", a1);
}

void C3DFXTechniqueAddSubTechnique_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DAnimationStackInit_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. C3DAnimationStackInit called twice", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DAnimationStackDiscardModelValueItemForAnimationClusterNode_cold_1(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "stackItem->_modelValueItem";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. Null argument", a1);
}

void C3DAnimationStackSetTarget_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DAnimationStackAppendAnimationNode_cold_1(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "animationCluster->_keyframes->_valueSize[index] == C3DSizeOfBaseType(target->_baseType)";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. unexpected size", a1);
}

void C3DAnimationStackAppendAnimationNode_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DAnimationStackAppendAnimationNode_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. unexpected animation node class", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DAnimationStackAppendAnimationNode_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. C3DAnimationStack invalid", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DES2SlotToAttachmentID_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_ERROR, "Error: C3DES2SlotToAttachmentID : unknown slot", v1, 2u);
}

void C3DKeyframedAnimationEvaluate_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DKeyframedAnimationEvaluate_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DKeyframedAnimationCopy_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DKeyframedAnimationCopy_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DKeyframedAnimationInitWithPropertyList_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, a1, a3, "Error: _C3DKeyframedAnimationInitWithPropertyList plist invalid", a5, a6, a7, a8, 0);
}

void _C3DKeyframedAnimationInitWithPropertyList_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, a1, a3, "Error: _C3DKeyframedAnimationInitWithPropertyList serializedData invalid", a5, a6, a7, a8, 0);
}

void C3DAnimationPlayerSetAnimation_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DAnimationNodeAddChild_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DAnimationNodeSetRepeatStep_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DAnimationNodeCreateWithAnimationGroupAndAddToAnimationManager_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DAnimationNodeCreateWithAnimationCluster_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DAnimationNodeCFFinalize_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Completion item will be released without having handled a completion or interruption event. This can lead to an inconsistent state.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _getCIFilterParameterValue_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, a1, a3, "Unreachable code: _getCIFilterParameterValue - unexpected type", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void _applyCIFilter_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, a1, a3, "Error: _applyCIFilter can't fint render target named SceneKit-CI-nodetree-color", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void _applyCIFilter_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
}

void _applyCIFilter_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
}

void _createShapeForGeometry()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Warning: SCNPhysicsShape does not support a SCNCone with TopRadius != 0.0", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void _createShapeForNode()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: Compound shapes cannot be created without shapes", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __fillMeshElementInfo(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "0";
  _os_log_fault_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Unsupported indices stride", (uint8_t *)&v1, 0xCu);
}

void C3DWrapModeToMTLAddressMode_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. bad type", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DFilterModeToMTLFilter_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. bad type", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DImageTypeToMTLTextureType_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. bad image type", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DCullModeToMTLCullMode_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. bad cull mode", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DFillModeToMTLFillMode_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. bad fill mode", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DBlendFactorToMTLBlendFactor_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. bad blend mode", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DBlendOpToMTLBlendOperation_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. bad blend operation", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DComparisonFuncToMTLCompareFunction_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. bad comparison func", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DStencilOpToMTLStencilOperation_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. bad stencil op", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DMeshElementTypeToMTLPrimitiveType_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Triangle Fan not supported in Metal", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DMeshElementTypeToMTLPrimitiveType_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Polygon Array not supported in Metal", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void SCNMTLVertexFormatToC3DBaseType_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. bad type", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void SCNMTLDataTypeFromC3DBaseType_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. bad type", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void SCNMTLFunctionTypeToProgramStage_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_ERROR, "Unreachable code: Kernel functions have no corresponding program stage", v1, 2u);
}

void C3DCreateImageWithTexture_cold_1(void *a1, NSObject *a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 134217984;
  v4 = objc_msgSend(a1, "pixelFormat");
  _os_log_error_impl(&dword_1DCCB8000, a2, OS_LOG_TYPE_ERROR, "Error: Unexpected pixel format %lu", (uint8_t *)&v3, 0xCu);
}

void C3DMeshSourceCreateWithMTLBuffer_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DMeshSourceCreateWithMTLBuffer_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void SCNSampleCountForAntialiasingMode_cold_1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1DCCB8000, a2, OS_LOG_TYPE_ERROR, "Unreachable code: Unexpected antialiasing mode (%d)", (uint8_t *)v2, 8u);
}

void C3DImageGetURL_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DImageCreateTextureRawData_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. image has already compression infos", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DImageCreateVerticalStripCubemapWithFaceImages_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1DCCB8000, a2, a3, "Error: Cannot build cubemap from array of images because image at index %d is NULL", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void C3DImageCreateVerticalStripCubemapWithFaceImages_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1DCCB8000, a2, a3, "Error: Cannot build cubemap from array of images because conversion to CGImageRef of image at index %d failed", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void C3DImageGetSize_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: Failed to load %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void C3DImageCopyCGImage_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: Failed to create image source from data %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void C3DImageCopyCGImage_cold_2(CGImageSource *a1, NSObject *a2)
{
  int v3;
  CGImageSource *v4;
  __int16 v5;
  CGImageSourceStatus StatusAtIndex;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 1024;
  StatusAtIndex = CGImageSourceGetStatusAtIndex(a1, 0);
  _os_log_error_impl(&dword_1DCCB8000, a2, OS_LOG_TYPE_ERROR, "Error: Failed to create image from image source %@ (status: %d)", (uint8_t *)&v3, 0x12u);
}

void C3DImageCreateVerticalStripCubemapWithImage_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: Cannot build column cubemap from non-cubemap image", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __ImageResize_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: unable to get a CGImageRef from image", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DImageGetCatalogTextureName_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Can't get name for non catalog texture", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DImageCopyUSDZEmbeddedData_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: failed to resolve image inside %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void C3DImageCopyUSDZEmbeddedData_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: failed to map image data for image inside %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void C3DImageCacheBitmap_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: failed to create a CGBitmapContext from a CGImage for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void C3DImageCacheBitmap_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. C3DImageCacheBitmap context is not null when it should be", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DImageEnumerateCubeMapFacePixelBuffers_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: Unknown cubemap image type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DImageEnumerateCubeMapFacePixelBuffers_cold_2(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_ERROR, "Error: Cannot support rotation layout for compressed texture", buf, 2u);
}

void C3DImageEnumerateTexture3DSlicePixelBuffers_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: Unknown Texture3D image type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void _C3DImageInitWithPropertyList_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: failed to load image with description: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _C3DImageInitWithPropertyList_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, a1, a3, "Error: invalid propertylist in %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DImageCopyPropertyList_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: _C3DImageCopyPropertyList error retrieving path", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void SCNMTLBlitCommandEncoder::copyTextureToTexture(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. slice count must match to copy", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. depth must match to copy", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. height must match to copy", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. width must match to copy", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DTextureSamplerSetAnisotropy_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DTextureSamplerInitWithPropertyList_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DTextureSamplerInitWithPropertyList_cold_5(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "_C3DTextureSamplerInitWithPropertyList";
  _os_log_error_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_ERROR, "Error: invalid propertylist in %s", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

void _C3DTextureSamplerCopyPropertyList_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_ERROR, "Error: Could not serialize an integer", v1, 2u);
}

void _C3DBezierCurveGeometryCreateCopy_cold_1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "object";
  _os_log_fault_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Null argument", (uint8_t *)&v1, 0xCu);
}

void C3D::FloorPass::setup(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "floor";
  _os_log_fault_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Null argument", (uint8_t *)&v1, 0xCu);
}

void C3DEngineContextGetStats_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DEngineContextGetScene_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DEngineContextRenderScene_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DEngineContextRenderScene_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DEngineContextSetGLContext_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DEngineContextGetPointOfView_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DEngineContextGetViewportAtIndex_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DEngineContextGetEyeMatrix4x4_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DEngineContextComputeJitterMatrix_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. wrong viewport", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DEngineContextGetTAAJitter_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. wrong viewport", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DEngineStatsResetResourceStats_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DEngineStatsMergeResourceStats_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _loadKTX_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, a1, a3, "Error: Unsupported format in KTX file", a5, a6, a7, a8, 0);
}

void _loadKTX_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, a1, a3, "Error: Only big endian ktx are supported", a5, a6, a7, a8, 0);
}

void _loadKTX_cold_3(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "image";
  _os_log_fault_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Null argument", (uint8_t *)&v1, 0xCu);
}

void _createKTXDataRepresentation_cold_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  SCNMTLPixelFormatToString(a1);
  OUTLINED_FUNCTION_0_6(&dword_1DCCB8000, v1, v2, "Error: Unsupported pixel format %@ (%u) in KTX encoder", v3, v4, v5, v6, 2u);
}

void _createKTXDataRepresentation_cold_2(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  SCNMTLTextureTypeToString(objc_msgSend(a1, "textureType"));
  objc_msgSend(a1, "textureType");
  OUTLINED_FUNCTION_0_6(&dword_1DCCB8000, v2, v3, "Error: Unsupported texture type %@ (%u) in KTX encoder", v4, v5, v6, v7, 2u);
}

void _C3DRendererElementSync_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DRendererElementStateCreate_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __UpdateMatrixUniforms_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. there should be exactly one transposed matrix in here", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DRendererElementStateBindProgramRendererElement_cold_1(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "CFArrayGetCount(shaderModifiers)";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. unoptimal : don't keep empty arrays", a1);
}

void C3DRendererElementStateDrawRendererElement_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DRendererElementStateProcessRendererElement_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DRendererElementStateProcessRendererElement_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Fully transparents objects should have been removed from the pipeline already", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DRendererElementStateProcessRendererElement_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Hidden nodes should have been removed from the pipeline already", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DRendererElementStateProcessRendererElement_cold_6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DRendererContextSetMatrix4x4UniformAtLocation_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DRendererContextExecuteSlotTextureProxy_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DRendererContextSetupResidentMeshSourceAtLocation_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: C3DRendererContextSetupResidentMeshSourceAtLocation:not handling type, using float as default", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DRendererContextSetupResidentMeshSourceAtLocation_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: C3DRendererContextSetupResidentMeshSourceAtLocation - double not supported", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DRendererContextCreateProgramObjectForProgram_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: C3DRendererContextCreateProgramObjectForProgram unsupported program", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DRendererContextCreateProgramObjectForProgram_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: C3DRendererContextCreateProgramObjectForProgram : missing vertex shader", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DRendererContextCreateProgramObjectForProgram_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: C3DRendererContextCreateProgramObjectForProgram : missing fragment shader", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DRendererContextCreateProgramObjectForProgram_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: C3DRendererContextCreateProgramObjectForProgram metal program unsupported", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DRendererContextCreateProgramObjectForProgram_cold_5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __FillProgramObjectLocations_cold_1(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_ERROR, "Error: __FillProgramObjectLocations uniform index out of bounds", buf, 2u);
}

void __FillProgramObjectLocations_cold_2(uint8_t *buf, _QWORD *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "nextFreeIndex < bufferCount";
  _os_log_fault_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. fillProgramLocation: index out of bounds", buf, 0xCu);
}

void C3DRendererContextDeleteBufferObject_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DRendererContextApplyTextureSampler_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DRendererContextCreateTextureWithImage_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  uint64_t URL;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v4 = 138412290;
  URL = C3DImageGetURL(a1);
  OUTLINED_FUNCTION_0_4(&dword_1DCCB8000, a2, v3, "Error: Cannot load image %@.", (uint8_t *)&v4);
}

void C3DRendererContextCreateTextureWithImage_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: C3DRendererCreateTextureWithImage : error while getting bitmap bytes", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DRendererContextCreateTextureWithImage_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Unreachable code: Invalid texture type: GL_BGR is not supported on OpenGL ES", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DRendererContextCreateTextureWithImage_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5();
}

void C3DRendererContextCreateTextureWithImage_cold_6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. gl texture allocation failed", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DRendererContextCreateTextureWithImage_cold_7(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_4(&dword_1DCCB8000, a2, a3, "Error: image copy did fail: %@\n", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

void C3DRendererContextCreateRenderTargetWithDescription_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: _createRBOForRenderTargetDescription - fbo size is zero", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DRendererContextCreateRenderTargetWithDescription_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: _createTextureForRenderTarget - fbo size is zero", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DRendererContextCreateRenderTargetWithDescription_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. inconsistent sample count", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DRendererContextSetupFramebuffer_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: C3DRendererContextSetupFramebuffer invoked twice on a Framebuffer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DRendererContextSetupFramebuffer_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DRendererContextUnbindFramebuffer_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Unreachable code: C3DRendererContextUnbindFramebuffer - no fbo bound", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DRendererContextUnbindFramebuffer_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. C3DRendererContextUnbindFramebuffer - fbo is not bound", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DRendererContextSetRasterizerStates_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __drawCall_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Unreachable code: NOT IMPLEMENTED", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __drawCall_cold_2()
{
  __assert_rtn("__drawCall", "C3DRendererContextGL.c", 3474, "0");
}

void C3DRendererContextSetLight_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. C3DRendererContextSetLight texture unit out of bounds", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DRendererContextSetLight_cold_2(int a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "lightIndex < C3D_MAX_LIGHTS";
  v4 = 1024;
  v5 = a1;
  _os_log_fault_impl(&dword_1DCCB8000, a2, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Wrong light index %d", (uint8_t *)&v2, 0x12u);
  OUTLINED_FUNCTION_1();
}

void C3DRendererContextSetLight_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DRendererContextBindCommonProfile_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: Physically based lighting model is not supported by the OpenGL renderer, using Phong instead", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __SetupCommonProfileEffectProperty_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_6(&dword_1DCCB8000, v0, v1, "Error: Max number of texture unit (%d) is reached - can't bind a new texture", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __SetupCommonProfileEffectProperty_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_6(&dword_1DCCB8000, v0, v1, "Error: We do not handle property %d to get the program attribute enum for the texture (using default: diffuse)\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DRendererContextCreateBufferObjectForMeshSource_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: C3DRendererContextCreateBufferObjectForMeshSource - mesh source has no data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DRendererContextCreateBufferObjectForMeshElement_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DRendererContextBindMeshElement_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_6(&dword_1DCCB8000, v0, v1, "Error: C3DRendererContextBindMeshElement unsupported byte per index (%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DRendererContextBindMeshElement_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. mesh elements to vbo id dictionary should already be allocated", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DRendererContextMapVolatileMesh_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. You can only map volatile mesh", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DRendererContextMapVolatileMeshElement_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. mesh elements to vbo id dictionary should be allocated by now", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DRendererContextMapVolatileMeshElement_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. there should be at least one primitive of a known type", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DRendererContextMapVolatileMeshElement_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void C3DRendererContextUnmapVolatileMeshElement_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. mesh element should be volatile", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void ___ZL17__renderToTexturePU45objcproto34SCNMaterialPropertyTextureProvider11objc_objectPU21objcproto10MTLTexture11objc_objectPU51objcproto40SCNMaterialPropertyTextureProviderHelper11objc_objectP19SCNMTLRenderContext_block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. We should have a compute command encoder open at this point", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void ___ZL17__renderToTexturePU45objcproto34SCNMaterialPropertyTextureProvider11objc_objectPU21objcproto10MTLTexture11objc_objectPU51objcproto40SCNMaterialPropertyTextureProviderHelper11objc_objectP19SCNMTLRenderContext_block_invoke_71_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. We should have a blit command encoder open at this point", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DRendererContextSetGLContext_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
}

void C3DParticleManagerGetSharedQuadsMeshElement_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, a1, a3, "Error: __CreateMeshElement unexpected byte per index", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void C3DParticleManagerComputeTechniqueForSystem_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1DCCB8000, a2, OS_LOG_TYPE_ERROR, "Error: ParticleSystem shaders missing : %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

void C3DParticleManagerComputeTechniqueForSystem_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, a1, a3, "Unreachable code: Geometry rendering not yet implemented", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void _willExecuteParticleSystemPass_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _executeParticleSystemPass_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. ParticleSystemInstance: wrong instance stored in rendererElement", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DBufferObjectGetBufferID_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DConvert_uchar4n_to_float4_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Unreachable code: not implemented", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DConvertBatch_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. src and dst count must be equal", a5, a6, a7, a8, 2u);
}

void C3DConvertFloatingTypeToFloat4_cold_1(__int16 a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_4_6(a1);
  OUTLINED_FUNCTION_3_3(&dword_1DCCB8000, v1, v2, "Error: unsupported conversion %@ -> float4", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_4_4();
}

void C3DConvertGetReadToFloat4Function_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. unknown type", a5, a6, a7, a8, 2u);
}

void C3DFramebufferSetFBO_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DFramebufferDescriptionSetSampleCount_cold_1(uint8_t *buf, _QWORD *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "description->colorsDescription[i].renderToTexture == false";
  _os_log_fault_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. can't render to texture if multisampled", buf, 0xCu);
}

void C3DFramebufferDescriptionSetSampleCount_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. can't render to texture if multisampled", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DFramebufferDescriptionSetSampleCount_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _processRendererElement(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_3(&dword_1DCCB8000, a3, (uint64_t)a3, "Error: C3DEngineContextRenderTechnique - unknown draw instruction", a1);
}

void _processRendererElement(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Fully transparents objects should have been removed from the pipeline already", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Hidden nodes should have been removed from the pipeline already", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void SCNMTLRenderCommandEncoder::setVertexTexture(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. texture is not a MTLTexture", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void ___Z18__slideWithinWorldP15__C3DConstraintP18__C3DEngineContextP18__C3DCullingSystemP9__C3DNodefDv3_fS7__block_invoke_cold_1(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "vertices.type == kC3DBaseTypeVector3";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed.  - Only vector3 type is supported.", a1);
}

void ___Z18__slideWithinWorldP15__C3DConstraintP18__C3DEngineContextP18__C3DCullingSystemP9__C3DNodefDv3_fS7__block_invoke_9_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. unexpected vertex count", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DConstaintSliderSetCategoryBitMask_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void ___Z31C3DConstraintApplyAvoidOccluderP18__C3DEngineContextP25__C3DConstraintControllerPKvP16__C3DModelTargetf_block_invoke_cold_1(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "positions.type == kC3DBaseTypeVector3";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed.  - Only vector3 type is supported.", a1);
}

void __StoreTexture_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __ResourceManagerDeleteTexture_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: __ResourceManagerDeleteTexture: texture to be deleted not found, bail out", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __ResourceManagerDeleteTexture_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: _C3DResourceManagerDeleteTexture can't find image source", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __ResourceManagerDeleteTexture_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: _C3DResourceManagerDeleteTexture source does not match to any stored texture (no texture samplers associated)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DResourceManagerMakeImageResident_cold_1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a2;
  v4 = 138412546;
  v5 = a1;
  v6 = 2112;
  v7 = v3;
  _os_log_error_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_ERROR, "Error: Failed to load texture named %@ : %@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_1();
}

void C3DResourceManagerMakeImageProxyResident_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DResourceManagerMakeMeshElementResident_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DResourceManagerMakeProgramResident_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: C3DResourceManagerMakeProgramResident failed to compile program - fallback on default program", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DResourceManagerMakeProgramResident_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __ResourceManagerReleaseResidentVRAMResource_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __HandleVRAMResourcesRemovalFromCommands_cold_1(uint8_t *buf, _QWORD *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "textureProxy";
  _os_log_fault_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Null argument", buf, 0xCu);
}

void _C3DResourceManagerUninstallRendererContext_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: rendererContext is not tracked by the resource manager", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __deleteTextureProxies_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __ResourceManagerRemoveResidentMeshSourceData_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __RemoveVRAMResourceFromDic_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DTextureCreate_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DImageProxyCreateTextureProxy_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DImageProxyGetCaptureDeviceInfo_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DEnginePipelineSyncNodeAttribute_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1DCCB8000, a2, OS_LOG_TYPE_ERROR, "Unreachable code: Unsupported node attribute '%@'", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

void C3DEnginePipelineSyncNodeAttribute_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __HandleNodeNotification_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. wrong notification type", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __HandleMaterialDidChangeNotifications_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. wrong notification type", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __ApplyMaterialDidChange_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __HandleGeometryDidChangeNotifications_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. wrong notification type", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __HandleLightDidChangeNotifications_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. wrong notification type", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __HandleNodeWillDieNotification_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. wrong notification sent", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DEnginePipelineAllocateAndTrackRendererElements_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. no render elements have been created", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DEnginePipelineReset_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DEnginePipelineRenderSubTree_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DEnginePipelineGetRenderComponentsForRenderPass_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_ERROR, "Error: unexpected renderer element with no material/technique/program", v1, 2u);
}

void C3DEnginePipelineGetRenderComponentsForRenderPass_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DRendererContextSetTypedBytesUniformAtLocation_cold_1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1DCCB8000, a2, OS_LOG_TYPE_ERROR, "Error: C3DRendererContextSetValueUniformAtLocation not implemented for this type (%d) yet", (uint8_t *)v2, 8u);
}

void C3DRendererContextSetValueUniformAtLocation_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_ERROR, "Error: uniform has incorrect type", v1, 2u);
}

void C3DFXProgramDelegateGetUserInfo_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void SCNSetShaderCollectionEnabled_cold_1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a2;
  v4 = 138412546;
  v5 = a1;
  v6 = 2112;
  v7 = v3;
  _os_log_error_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_ERROR, "Error: unable to create the shader cache folder at %@ (%@)", (uint8_t *)&v4, 0x16u);
}

void _C3DInitNumberArrayWithPropertyList_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: Could not deserialize a number array (nil buffer or serialized data)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void _C3DInitNumberArrayWithPropertyList_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: Could not deserialize a number (%@) in a number array", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _C3DInitNumberArrayWithPropertyList_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: Could not deserialize a number array (unexpected type)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DBaseTypeForCFNumberType_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: C3DBaseTypeForCFNumberType: Type not supported", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DConvertToPlatformIndependentData_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: C3DConvertToPlatformIndependentData - Type not supported", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DConvertToPlatformIndependentData_cold_2(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_ERROR, "Error: C3DConvertToPlatformIndependentData - archiving pointers makes no sense", buf, 2u);
}

void C3DConvertToPlatformIndependentData_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Not enough room for the specified count & stride to write", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DConvertToPlatformIndependentData_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Not enough room for the specified count & stride to read", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DConvertFromPlatformIndependentData_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: C3DConvertFromPlatformIndependentData: Not enough room for the specified count & stride to read", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DConvertFromPlatformIndependentData_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: C3DConvertFromPlatformIndependentData: Not enough room for the specified count & stride to write", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DConvertFromPlatformIndependentData_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: C3DConvertFromPlatformIndependentData - Type not supported", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DSizeOfBaseType_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. unknown type", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DBaseTypeGetComponentType_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: unknown type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DBaseTypeGetCompoundType_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Only one compound type per vector", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DBaseTypeGetCompoundType_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_7(&dword_1DCCB8000, v0, v1, "Unreachable code: Compound type %s%d is not supported", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DBaseTypeGetCompoundType_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_7(&dword_1DCCB8000, v0, v1, "Unreachable code: Compound type %s%d is not supported", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DBaseTypeGetCompoundType_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_7(&dword_1DCCB8000, v0, v1, "Unreachable code: Compound type %s%d is not supported", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DBaseTypeGetCompoundType_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_7(&dword_1DCCB8000, v0, v1, "Unreachable code: Compound type %s%d is not supported", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DBaseTypeGetCompoundType_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_7(&dword_1DCCB8000, v0, v1, "Unreachable code: Compound type %s%d is not supported", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DBaseTypeGetCompoundType_cold_7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_7(&dword_1DCCB8000, v0, v1, "Unreachable code: Compound type %s%d is not supported", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DBaseTypeGetCompoundType_cold_8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_7(&dword_1DCCB8000, v0, v1, "Unreachable code: Compound type %s%d is not supported", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DBaseTypeGetCompoundType_cold_9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_7(&dword_1DCCB8000, v0, v1, "Unreachable code: Compound type %s%d is not supported", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DBaseTypeGetCompoundType_cold_10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_7(&dword_1DCCB8000, v0, v1, "Unreachable code: Compound type %s%d is not supported", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DBaseTypeGetCompoundType_cold_11()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_7(&dword_1DCCB8000, v0, v1, "Unreachable code: Compound type %s%d is not supported", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DBaseTypeGetCompoundType_cold_12()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_7(&dword_1DCCB8000, v0, v1, "Unreachable code: Compound type %s%d is not supported", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DBaseTypeDescription_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. wrong parameters", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DBaseTypeFromDescription_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: C3DBaseTypeFromDescription - Type not supported", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DBaseTypeFromDescription_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Warning: C3DBaseTypeFromDescription - signed/unsigned ambiguity", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DAddBaseType_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: C3DAddBaseType - unknown type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DAddBaseType_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1DCCB8000, a2, a3, "Error: C3DAddBaseType - type %d can't be added", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void C3DAddBaseType_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: C3DAddBaseType - addition of half float not supported", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DAddBaseType_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DAddBaseType_cold_5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DAddBaseType_cold_6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DSubBaseType_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: C3DSubBaseType - unknown type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DSubBaseType_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1DCCB8000, a2, a3, "Error: C3DSubBaseType - type %d can't be substracted", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void C3DSubBaseType_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: C3DSubBaseType - substraction of half float not supported", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DCreateCStringFromStringWithEncoding_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: Conversion to C string failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DCreateCStringFromStringWithEncoding_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DIOSurfaceToTexImage_cold_1()
{
  __assert_rtn("C3DIOSurfaceToTexImage", "C3DUtils.m", 2657, "internalformat == GL_RGBA");
}

void C3DStringNamed_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: failed to load resource named %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void C3DDictionaryNamed_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: failed to load dictionary named %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void C3DJsonNamed_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: failed to load json named %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void C3DJsonNamed_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_0_1(&dword_1DCCB8000, v0, v1, "Error: failed to load json named %@ (reason: %@)");
  OUTLINED_FUNCTION_1();
}

void C3DDataFromMTLBuffer_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Warning: C3DDataFromMTLBuffer - can't read private MTL buffer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DDeduceSphericalHarmonicsOrderFromDataLength_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  int v2[4];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315650;
  OUTLINED_FUNCTION_3_0();
  v3 = 2048;
  v4 = v0;
  _os_log_fault_impl(&dword_1DCCB8000, v1, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Spherical Harmonics Data seems malformed: order(%d) !=> length(%zu)", (uint8_t *)v2, 0x1Cu);
}

void C3DDeduceSphericalHarmonicsOrderFromDataLength_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DFXShaderGetStage_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DFXShaderGetSource_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _resizeProbesData_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0_3(&dword_1DCCB8000, a1, a3, "Error: unsupported SH order", v3);
  OUTLINED_FUNCTION_5();
}

void _resizeProbesData_cold_2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "probesSystem->_probesPositions";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

void _resizeProbesData_cold_3(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "probesSystem->_probesCapacity";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

void _computeNeighbourIndexes_cold_1(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "_tetrahedrons[tetraderonIndex].neighbourIndexes[otherTetraderonFaceIndex] == -1";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. overwrite a neighbour index", a1);
}

void _computeNeighbourIndexes_cold_2(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "tetrahedronIndexes";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. _computeNeighbourIndexes - missing tetrahedron", a1);
}

void C3DLightProbesSystemSetProbeData_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1DCCB8000, a2, a3, "Error: SH order unsupported : %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void C3DLightProbesSystemSetProbeData_cold_2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "sh_sizeof(shOrder) == (size_t)CFDataGetLength(irradianceSH)";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. wrong data size for SH", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

void C3DLightProbesBeginQueries_cold_1(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "tetrahedronIsValid[indexValid]";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. will make an invalid tetrahedron valid", a1);
}

void C3DLightProbesBeginQueries_cold_2(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "validTetraCount <= (uint32_t)indexToRecycle";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. validTetraCount > indexToRecycle", a1);
}

void C3DLightProbesBeginQueries_cold_3(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_3(&dword_1DCCB8000, a3, (uint64_t)a3, "Error: tetrahedrisation: index out of bounds", a1);
}

void C3DLightProbesBeginQueries_cold_4(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "vCount <=2";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. _faceHasEdgeSharedWithMoreThanTwoOtherOpenFace", a1);
}

void C3DLightProbesBeginQueries_cold_5(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0_3(&dword_1DCCB8000, a1, a3, "Error: _buildTetrahedrons - failed with first tetrahedron", v3);
  OUTLINED_FUNCTION_5();
}

void __lookupTetrahedron_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "lastIndex != (uint32_t)-1";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Should never have been outside the tetras", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

void C3DLightProbesQuerySH2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "cacheIndex";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

void C3DLightProbesSetGlobalSH3_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "sh_sizeof(shOrder) == (size_t)shLength";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. wrong data size for SH", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

void _C3DEffectCommonProfileReleaseSlot_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __PostCommonProfileDidChangeNotification_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, a1, a3, "Error: orphan effect common profile detected", a5, a6, a7, a8, 0);
}

void C3DEffectCommonProfileGetHashCode_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. C3DEffectCommonProfileGetHashCode: inconsistency error", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __PostParentDidChangeNotification_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. LightingEnvironment not set on a Light or a Scene", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DEffectSlotSetHasNoContents_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DEffectCommonProfileInitWithPropertyList_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DCCB8000, v0, v1, "Error: No function %@ in the common profile %@");
  OUTLINED_FUNCTION_1();
}

void _C3DEffectCommonProfileInitWithPropertyList_cold_5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, a1, a3, "Error: invalid propertylist in %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DEffectCommonProfileCopyPropertyList_cold_2(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "key";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. Null argument", a1);
}

void _C3DEffectCommonProfileCopyPropertyList_cold_3(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "imageID < INT_MAX";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. Too many objects", a1);
}

void __DeserializeColor_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: C3DEffectCommonProfile DeserializeColor: No property for the key %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __DeserializeColor_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: Could not deserialize the color %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __DeserializeUVSet_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: Common profile deserialization: could not read the property %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __DeserializeUVSet_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: Common profile deserialization: property found for the key %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __DeserializeTextureSampler_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: Could not deserialize the texture sampler %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __DeserializeImage_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DCCB8000, v0, v1, "Error: Cannot find the image ID for the key %@ in the dictionary %@");
  OUTLINED_FUNCTION_1();
}

void __DeserializeImage_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, a1, a3, "Error: Cannot find the specified image", a5, a6, a7, a8, 0);
}

void __DeserializeImage_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void vmesh::SubdivideMidPoint()
{
  __assert_rtn("SubdivideMidPoint", "VMesh.cpp", 89, "end < shifts[a + 1]");
}

void _ZN5vmesh19InterpolateMidPointIDv3_fEEvRNSt3__16vectorIT_NS2_9allocatorIS4_EEEERKNS_26StaticAdjacencyInformationI4PairEE_cold_1()
{
  __assert_rtn("InterpolateMidPoint", "VMesh.hpp", 232, "neighbor.b >= 0 && neighbor.b < int32_t(signal.size())");
}

void _ZN5vmesh19InterpolateMidPointIDv3_fEEvRNSt3__16vectorIT_NS2_9allocatorIS4_EEEERKNS_26StaticAdjacencyInformationI4PairEE_cold_2()
{
  __assert_rtn("InterpolateMidPoint", "VMesh.hpp", 231, "neighbor.a >= 0 && neighbor.a < int32_t(signal.size())");
}

void vmesh::InterpolateNormals()
{
  __assert_rtn("InterpolateNormals", "VMesh.cpp", 496, "neighbor.b >= 0 && neighbor.b < int32_t(normals.size())");
}

{
  __assert_rtn("InterpolateNormals", "VMesh.cpp", 495, "neighbor.a >= 0 && neighbor.a < int32_t(normals.size())");
}

void vmesh::StaticAdjacencyInformation<Pair>::neighborsStartIndex()
{
  __assert_rtn("neighborsStartIndex", "VMesh.hpp", 93, "i < size()");
}

void vmesh::StaticAdjacencyInformation<Pair>::neighborsEndIndex()
{
  __assert_rtn("neighborsEndIndex", "VMesh.hpp", 98, "i < size()");
}

void vmesh::TriangleMesh::loadBaseMeshFromVectors()
{
  __assert_rtn("loadBaseMeshFromVectors", "VMesh.cpp", 512, "pointVec.size() > 0");
}

{
  __assert_rtn("loadBaseMeshFromVectors", "VMesh.cpp", 532, "(idxVec.size() % 3) == 0");
}

{
  __assert_rtn("loadBaseMeshFromVectors", "VMesh.cpp", 520, "normalVec.size() == pointCountInVec");
}

{
  __assert_rtn("loadBaseMeshFromVectors", "VMesh.cpp", 515, "uvVec.size() == pointCountInVec");
}

void C3DLODGetEntity_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __C3DSubdivisionOsdGPURefine(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Internal consistency error.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __C3DSubdivisionOsdGPUCreateSynchronizeCoarsePositionsPipeline(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Internal consistency error.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DSubdivisionOsdGPURuntimeDataCreateWithData(id *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(*a1, "status");
  objc_msgSend(*a1, "error");
  objc_msgSend(*a1, "logs");
  OUTLINED_FUNCTION_10_0(&dword_1DCCB8000, v2, v3, "Error: OpenSubdiv unarchiver command buffer execution failed with status %d, error: %@\n%@", v4, v5, v6, v7, 2u);
  OUTLINED_FUNCTION_11();
}

void C3DSubdivisionOsdGPURuntimeDataCreateWithData(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __C3DSubdivisionOsdGPURuntimeDataDecodeRefiner()
{
  __assert_rtn("__C3DSubdivisionOsdGPURuntimeDataDecodeEvaluatorInput", "C3DGeometryOpenSubdivSupport_Metal.mm", 671, "dstLength == sizeof(OpenSubdiv::Osd::BufferDescriptor)");
}

{
  __assert_rtn("__C3DSubdivisionOsdGPURuntimeDataDecodeEvaluatorInput", "C3DGeometryOpenSubdivSupport_Metal.mm", 670, "srcLength == sizeof(OpenSubdiv::Osd::BufferDescriptor)");
}

void __C3DSubdivisionOsdGPURuntimeDataInitializePerPatchComputePipelines(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_3(a1, a2);
  OUTLINED_FUNCTION_2(&dword_1DCCB8000, v2, v3, "Unreachable code: Unsupported patch type", v4);
}

void C3DSubdivisionOsdGPUGetPerPatchTypeSources_cold_1()
{
  __assert_rtn("C3DSubdivisionOsdGPUGetPerPatchTypeSources", "C3DGeometryOpenSubdivSupport_Metal.mm", 2462, "0");
}

void C3DSubdivisionOsdGPUGetProgramGeneratorResources_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_ERROR, "Unreachable code: Unsupported patch type", v1, 2u);
}

void C3DPatchTypeToOsdPatchType()
{
  __assert_rtn("C3DPatchTypeToOsdPatchType", "C3DGeometryOpenSubdivSupport_Metal.mm", 315, "0");
}

void C3DGeometryOpenSubdivGetGPUContext_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. GPU support for OpenSubdiv must not be enabled when there is a tessellator but the subdivision level is still 0.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DSubdivisionOsdGPURuntimeDataCreateWithGeometry(int *a1, NSObject *a2)
{
  int v2;
  _DWORD v3[2];
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3[0] = 67109376;
  v3[1] = 12;
  v4 = 1024;
  v5 = v2;
  _os_log_error_impl(&dword_1DCCB8000, a2, OS_LOG_TYPE_ERROR, "Error: OSD_MAX_VALENCE is set to %d and current mesh has a max valence of %d", (uint8_t *)v3, 0xEu);
  OUTLINED_FUNCTION_1();
}

void C3DSubdivisionOsdGPURuntimeDataCreateWithGeometry(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Internal consistency error.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DSubdivisionOsdGPUSynchroniseCoarseMeshForDeformers_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DSubdivisionOsdGPUDraw_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DSubdivisionOsdGPUDraw_cold_4(os_log_t log)
{
  int v1;
  const char *v2;
  __int16 v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = 136315394;
  v2 = "__C3DSubdivisionOsdGPUHasPatchOfType(osdRuntimeData, c3dPatchType)";
  v3 = 2080;
  v4 = "C3DSubdivisionOsdGPUDraw";
  _os_log_fault_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. %s called but there's no patch to draw.", (uint8_t *)&v1, 0x16u);
  OUTLINED_FUNCTION_1();
}

void C3DGetPatchTypeDescription()
{
  __assert_rtn("C3DGetPatchTypeDescription", "C3DGeometryOpenSubdivSupport_Metal.mm", 277, "0");
}

void C3DPatchTypeFromOsdPatchType()
{
  __assert_rtn("C3DPatchTypeFromOsdPatchType", "C3DGeometryOpenSubdivSupport_Metal.mm", 296, "0");
}

void ___ZL49C3DSubdivisionOsdGPURuntimeDataCreateWithGeometryP13__C3DGeometryP18__C3DEngineContextRK36C3DSubdivisionOsdGPUSubdivParametersP21SCNMTLResourceManagerPU26objcproto15MTLCommandQueue11objc_objectU13block_pointerFvPU27objcproto16MTLCommandBuffer11objc_objectbE_block_invoke_cold_1(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "status");
  objc_msgSend(a1, "error");
  objc_msgSend(a1, "logs");
  OUTLINED_FUNCTION_10_0(&dword_1DCCB8000, v2, v3, "Error: OpenSubdiv command buffer execution failed with status %d, error: %@\n%@", v4, v5, v6, v7, 2u);
  OUTLINED_FUNCTION_11();
}

void ___ZL49C3DSubdivisionOsdGPURuntimeDataCreateWithGeometryP13__C3DGeometryP18__C3DEngineContextRK36C3DSubdivisionOsdGPUSubdivParametersP21SCNMTLResourceManagerPU26objcproto15MTLCommandQueue11objc_objectU13block_pointerFvPU27objcproto16MTLCommandBuffer11objc_objectbE_block_invoke_355_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void ___ZL49C3DSubdivisionOsdGPURuntimeDataCreateWithGeometryP13__C3DGeometryP18__C3DEngineContextRK36C3DSubdivisionOsdGPUSubdivParametersP21SCNMTLResourceManagerPU26objcproto15MTLCommandQueue11objc_objectU13block_pointerFvPU27objcproto16MTLCommandBuffer11objc_objectbE_block_invoke_355_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void OpenSubdiv::v3_1_1::Osd::Mesh<OpenSubdiv::v3_1_1::Osd::CPUMTLVertexBuffer,OpenSubdiv::v3_1_1::Osd::MTLStencilTable,OpenSubdiv::v3_1_1::Osd::MTLComputeEvaluator,OpenSubdiv::v3_1_1::Osd::MTLPatchTable,OpenSubdiv::v3_1_1::Osd::MTLContext>::Mesh()
{
  __assert_rtn("Mesh", "mesh.h", 366, "_refiner");
}

void OpenSubdiv::v3_1_1::Osd::Mesh<OpenSubdiv::v3_1_1::Osd::CPUMTLVertexBuffer,OpenSubdiv::v3_1_1::Osd::MTLStencilTable,OpenSubdiv::v3_1_1::Osd::MTLComputeEvaluator,OpenSubdiv::v3_1_1::Osd::MTLPatchTable,OpenSubdiv::v3_1_1::Osd::MTLContext>::initializeContext()
{
  __assert_rtn("initializeContext", "mesh.h", 504, "_refiner");
}

void __C3DSubdivisionOsdGPURuntimeDataEncodeMTLBuffer()
{
  __assert_rtn("__C3DSubdivisionOsdGPURuntimeDataEncodeMTLBuffer", "C3DGeometryOpenSubdivSupport_Metal.mm", 422, "encodedLength <= buffer.length");
}

void C3DMeshSourcePrepareAppend_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. We do not support appending to really complicated interleavings", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DMeshSourcePrepareAppend_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DMeshSourceAppendVector3_cold_1(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_3(a1, a2);
  OUTLINED_FUNCTION_0_3(&dword_1DCCB8000, v2, (uint64_t)v2, "Error: C3DMeshSourceAppendVector3 - Type not supported", v3);
}

void C3DMeshSourceAppendVector2_cold_1(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_3(a1, a2);
  OUTLINED_FUNCTION_0_3(&dword_1DCCB8000, v2, (uint64_t)v2, "Error: C3DMeshSourceAppendVector2 - Type not supported", v3);
}

void C3DMeshSourceCreateVolatile_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0_3(&dword_1DCCB8000, a1, a3, "Error: C3DMeshSourceCreate: unsupported type", v3);
}

void C3DMeshSourceCreateVolatile_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DMeshSourceSetVolatileData_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Cannot set volatile data of a non volatile source", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DEdgeArrayCreateFromMeshElement_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 136315650;
  v5 = "edgeCount == edges->_count";
  v6 = 2048;
  v7 = a2;
  v8 = 2048;
  v9 = v3;
  _os_log_fault_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. memory smasher found in C3DEdgeArrayCreateFromMeshElement (%ld != %ld)", (uint8_t *)&v4, 0x20u);
}

void C3DEdgeArrayCreateFromMeshElement_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DEdgeArrayGetEdgeAtIndex_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. C3DEdgeArrayGetEdgeAtIndex index out of bounds", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DTriangulationInfoCreateFromMeshElement_cold_1(uint8_t *buf, _QWORD *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "edgeIndexesPerFaceCounter[j] <= 2";
  _os_log_fault_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. C3DTriangulationInfoCreateFromMeshElement - edge out of bounds", buf, 0xCu);
}

void C3DTriangulationInfoCreateFromMeshElement_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DTriangulationInfoCreateFromMeshElement_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DTriangulationInfoGetEdgesAtFaceIndex_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DMeshElementEditorCreate_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DMeshElementEditorCreateWithMeshElementAndCapacity_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: C3DMeshElementEditorCreateWithMeshElement: mesh element is not a triangle array", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DMeshElementEditorGetIndex_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: _C3DMeshElementEditorSetIndex unknown bytes per index", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DMeshElementEditorSubdivideTriangleAtIndex_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: C3DMeshElementEditorSubdivideTriangleAtIndex: triangleIndex out of bounds", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DMeshElementEditorSubdivideTriangleAtIndex_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _addLightsInFrustum(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "outData->parameters.probe.index >= 0";
  OUTLINED_FUNCTION_0_5(&dword_1DCCB8000, (int)a2, a3, "Assertion '%s' failed. Slice index should have been attributed already", a1);
}

{
  *(_DWORD *)a1 = 136315138;
  *a2 = "C3DLightGetType(light) == kC3DLightTypeProbe";
  OUTLINED_FUNCTION_0_5(&dword_1DCCB8000, (int)a2, a3, "Assertion '%s' failed. Wrong light type", a1);
}

{
  *(_DWORD *)a1 = 136315138;
  *a2 = "shadowMapName";
  OUTLINED_FUNCTION_0_5(&dword_1DCCB8000, (int)a2, a3, "Assertion '%s' failed. Null argument", a1);
}

void ___Z19_addLightsInFrustumP19SCNMTLClusterSystem11scn_frustumhRKN13SCNMTLCluster7ContextEPNS_4InfoE_block_invoke_5_cold_1(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "C3DLightGetProbeType(lights[i]) == kC3DLightProbeTypeRadiance";
  OUTLINED_FUNCTION_0_5(&dword_1DCCB8000, (int)a2, a3, "Assertion '%s' failed. Wrong probe type", a1);
}

void __append(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "ctx.nextIndex[i] <= newIndicesCount";
  OUTLINED_FUNCTION_0_5(&dword_1DCCB8000, (int)a2, a3, "Assertion '%s' failed. nextIndex out of range", a1);
}

{
  *(_DWORD *)a1 = 136315138;
  *a2 = "ctx.packedIndices.data[pl - 1] == li";
  OUTLINED_FUNCTION_0_5(&dword_1DCCB8000, (int)a2, a3, "Assertion '%s' failed. previous light was not of the same index", a1);
}

{
  *(_DWORD *)a1 = 136315138;
  *a2 = "pl != 0";
  OUTLINED_FUNCTION_0_5(&dword_1DCCB8000, (int)a2, a3, "Assertion '%s' failed. end index should be set already", a1);
}

{
  *(_DWORD *)a1 = 136315138;
  *a2 = "ctx.packedIndices.data[fl - 1] == li";
  OUTLINED_FUNCTION_0_5(&dword_1DCCB8000, (int)a2, a3, "Assertion '%s' failed. first light was not of the same index", a1);
}

void __addFroxelLightIndicesInBuffer(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "ctx.nextIndex[i] <= indicesCount";
  OUTLINED_FUNCTION_0_5(&dword_1DCCB8000, (int)a2, a3, "Assertion '%s' failed. nextIndex out of range", a1);
}

void __compactLightIndices()
{
  __assert_rtn("__compactLightIndices", "SCNMTLClusterSystem.mm", 1474, "clusterCellSize == sizeof(simd_ushort2)");
}

{
  __assert_rtn("__compactLightIndices", "SCNMTLClusterSystem.mm", 1452, "clusterCellSize == sizeof(simd_ushort2)");
}

void __compactLightIndices(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "count > 0";
  OUTLINED_FUNCTION_0_5(&dword_1DCCB8000, (int)a2, a3, "Assertion '%s' failed. Should be non empty", a1);
}

void SCNMTLClusterSystem::compute(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "i < lightRange.y";
  OUTLINED_FUNCTION_0_5(&dword_1DCCB8000, (int)a2, a3, "Assertion '%s' failed. range overflow", a1);
}

void _insertRange_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1DCCB8000, v0, v1, "Error: Index %ld out of range bounds [0...%ld]", v2, v3);
  OUTLINED_FUNCTION_1();
}

void rangeAtIndex_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1DCCB8000, v0, v1, "Error: Index %ld out of bounds [0...%ld]", v2, v3);
  OUTLINED_FUNCTION_1();
}

void _C3DAnimationInitWithPropertyList_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, a1, a3, "Error: invalid propertylist in %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DAnimationCreateWithPropertyList_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, a2, a3, "Error: Failed to deserialize an animation because it is of an unknown type (%@)", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DAnimationSetup_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Unreachable code: C3DAnimationSetup - unknown animation class", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DSimpleAnimationEvaluate_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: C3DSimpleAnimationEvaluate - invalid evaluation function", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DSimpleAnimationEvaluate_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DSimpleAnimationEvaluate_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DSimpleAnimationCopy_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DSimpleAnimationInitWithPropertyList_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: _C3DSimpleAnimationInitWithPropertyList - no base type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void _C3DSimpleAnimationInitWithPropertyList_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: SimpleAnimation deserialization: could not deserialize the animation", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __C3DLightDidChange_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DLightSetColor_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DLightSetIESProfileURL_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, a2, a3, "Error: Failed to load IES profile : %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DLightGetIESProfileURL_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Light should be a IES", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DLightGetProjectionInfo_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DLightAddLightSHContribution_cold_1()
{
  __assert_rtn("C3DLightAddLightSHContribution", "C3DLight.c", 1945, "0");
}

void C3DLightAddLightSHContribution_cold_2()
{
  __assert_rtn("sh_eval_direction", "sh_math.h", 240, "order < kSHMinOrder || order > kSHMaxOrder");
}

void C3DLightAddLightSHContribution_cold_3()
{
  __assert_rtn("sh_accumulate_omni_light", "sh_math.h", 419, "order < kSHMinOrder || order > kSHMaxOrder");
}

void C3DLightAddLightSHContribution_cold_4()
{
  __assert_rtn("C3DLightAddLightSHContribution", "C3DLight.c", 1961, "0");
}

void C3DLightAddLightSHContribution_cold_5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DLightInitWithPropertyList_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_4_9(&dword_1DCCB8000, v0, v1, "Error: While deserializing a light: no value for the key %@ (serializedData : %@)", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DLightInitWithPropertyList_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_4_9(&dword_1DCCB8000, v0, v1, "Error: While deserializing a light: could not decode the number for the key %@ (serializedData : %@)", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DLightInitWithPropertyList_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, a1, a3, "Error: While deserializing a light: could not decode the shadowcolor", a5, a6, a7, a8, 0);
}

void _C3DLightInitWithPropertyList_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, a1, a3, "Error: While deserializing a light: could not decode the color", a5, a6, a7, a8, 0);
}

void _C3DLightInitWithPropertyList_cold_5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, a1, a3, "Error: invalid propertylist in %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DCameraNeedsPostProcess_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DProjectionInfosSetZFar_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DProjectionInfosUnproject_cold_1(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_3(&dword_1DCCB8000, a3, (uint64_t)a3, "Error: error in C3DProjectionInfosUnproject", a1);
}

void C3DProjectionInfosUnproject_cold_2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0_3(&dword_1DCCB8000, a1, a3, "Error: C3DProjectionInfosUnproject : invalid viewport dimension", v3);
}

void _C3DCameraInitWithPropertyList_cold_1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "_C3DCameraInitWithPropertyList";
  _os_log_error_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_ERROR, "Error: invalid propertylist in %s", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

void C3DNodeGetWorldMatrix_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Node should have a TT handle already", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DNodeAddChildNode_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DNodeCreateSubdividedCopy_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. need subdivision level", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DNodeInsertChildNodeAtIndex_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. child is already inserted in a tree", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DNodeInsertChildNodeAtIndex_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. child is already inserted in a tree", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DNodeInsertChildNodeAfterChild_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. prevChild is not parented to the right node", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DNodeRemoveFromParentNode_cold_1(uint8_t *buf, _QWORD *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "prevChild";
  _os_log_fault_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Null argument", buf, 0xCu);
}

void C3DNodeRemoveFromParentNode_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DNodeGetWorldPosition_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DNodeGetWorldOrientation_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DNodeComputeWorldMatrix_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DNodeGetNodeWithName_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DNodeCopyNodesWithAttribute_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __UpdateNodeVisibilityIfNeeded_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Node should already be in CullingSystem", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DNodeIsAncestor_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DNodeFindCommonAncestor_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DNodeAddParticleSystem_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DNodeAddAudioPlayer_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __UpdateAudioTransform_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DNodeSetLayerIndex_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. layer index out of bound", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DNodeCFFinalize_cold_1(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_ERROR, "Error: inconsistency in scene graph found in C3DNode finalize", buf, 2u);
}

void _C3DNodeInitWithPropertyList_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, a2, a3, "Error: Could not read a transform, position, scale and rotation have to be present (serializedData: %@)", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DNodeInitWithPropertyList_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, a2, a3, "Error: No data present to deserialize a rotation (serialized data : %@)", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DNodeInitWithPropertyList_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: loading pivot from compressed collada file is not supported anymore - use SCN file format instead", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void _C3DNodeInitWithPropertyList_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: Could not read a matrix", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void _C3DNodeInitWithPropertyList_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: Could not read the axis angle", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void _C3DNodeInitWithPropertyList_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: Could not read Euler", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void _C3DNodeInitWithPropertyList_cold_7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: Could not read a quaternion", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void _C3DNodeInitWithPropertyList_cold_8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, a2, a3, "Error: Could not read a matrix (serializedData: %@)", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DNodeInitWithPropertyList_cold_9(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, a1, a3, "Error: invalid propertylist in %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DNodeFinalizeDeserialization_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: Node deserialization: cannot retrieve the lightmap image ID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void _C3DNodeFinalizeDeserialization_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: Node deserialization: cannot retrieve the lightmap image", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void _C3DNodeFinalizeDeserialization_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: Node deserialization: cannot retrieve the object ID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void _serializeNodeAttribute_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. _serializeNodeAttribute lighmap not serialized", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DNodeGetBoundingSphere_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __BuildSemanticInfosForData_cold_1(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "semantic != kC3DMeshSourceSemanticPosition || data->sourcesSemanticInfos[semantic].count == 0";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. No double position sources allowed", a1);
}

void __BuildSemanticInfosForData_cold_2(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "data->sourcesSemanticInfos[semantic].index == -1";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. Mesh sources with same semantic non contiguous", a1);
}

void __BuildSemanticInfosForData_cold_3(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "semantic > currentSemantic";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. Mesh sources are not sorted correctly", a1);
}

void __DropOriginalTopology_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __DropOriginalTopology_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DMeshApplySources_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, a1, a3, "Unreachable code: Internal consistency error in %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DMeshFinalizeDeserialization_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, a2, a3, "Error: Mesh deserialization: cannot find the sources in %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DMeshFinalizeDeserialization_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_3(&dword_1DCCB8000, v0, v1, "Error: Mesh deserialization: cannot find the specified source", v2);
  OUTLINED_FUNCTION_5();
}

void _C3DMeshFinalizeDeserialization_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_3(&dword_1DCCB8000, v0, v1, "Error: Mesh deserialization: cannot init a mesh element", v2);
  OUTLINED_FUNCTION_5();
}

void _C3DMeshFinalizeDeserialization_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_3(&dword_1DCCB8000, v0, v1, "Error: Mesh deserialization: cannot deserialize a source", v2);
  OUTLINED_FUNCTION_5();
}

void __DeserializePrimarySource_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_3(&dword_1DCCB8000, v0, v1, "Error: Cannot find the specified primary source", v2);
  OUTLINED_FUNCTION_5();
}

void __DeserializePrimarySource_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_3(&dword_1DCCB8000, v0, v1, "Error: Cannot find the specified source", v2);
  OUTLINED_FUNCTION_5();
}

void __DeserializePrimarySource_cold_3(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "C3DSourceAccessorGetSource(accessor) == (C3DGenericSourceRef) primarySource";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. This accessor doesn't point back to the primary source", a1);
}

void C3DMeshCopyBoundingVolumes_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Can't copy bounding volumes from meshes with different element count", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DMeshGetElementAtIndex_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, a1, a3, "Unreachable code: Internal consistency error in %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DMeshGetElementAtIndex_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __C3DMeshRemoveSourceWithSemanticAtIndex_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Mesh sources are malformed", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __C3DMeshSetSourceWithInputSetAndDataKind_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. need to provide a valid channel index when adding a new source", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __C3DMeshSetSourceWithInputSetAndDataKind_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Renderable data kind must not give a channel", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __indexOfSourceWithSemanticAtIndex_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Mesh sources are malformed", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DMeshHasSourcesWithSemantic_cold_1()
{
  uint64_t v0;
  NSObject *v1;
  NSObject *v2;

  v2 = OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_6_1(v2);
  *(_DWORD *)v0 = 136315138;
  *(_QWORD *)(v0 + 4) = "__meshDataForDataKind";
  OUTLINED_FUNCTION_4_10(&dword_1DCCB8000, v1, OS_LOG_TYPE_ERROR, "Unreachable code: Internal consistency error in %s", (uint8_t *)v0);
  __break(1u);
}

void C3DMeshGetChannelForSourceAtIndex_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DMeshGetChannelForSourceWithSemanticAtIndex_cold_1(char a1, int a2, NSObject *a3)
{
  int v5;
  const char *v6;
  __int16 v7;
  const __CFString *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = 136315650;
  v6 = "sourceIndex != kCFNotFound";
  v7 = 2112;
  v8 = C3DMeshSourceSemanticToSemanticString(a1);
  v9 = 1024;
  v10 = a2;
  _os_log_fault_impl(&dword_1DCCB8000, a3, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Could not find source with semantic %@ at index %d", (uint8_t *)&v5, 0x1Cu);
}

void __C3DMeshFixAccessorLinks_cold_1(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_3(&dword_1DCCB8000, a3, (uint64_t)a3, "Error: __C3DMeshCopy - unable to resolve interleaved mesh", a1);
}

void C3DMeshGetIndexOfElement_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, a1, a3, "Unreachable code: Internal consistency error in %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DMeshGetMeshElements_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, a1, a3, "Unreachable code: Internal consistency error in %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DMeshInitWithPropertyList_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, a1, a3, "Error: invalid propertylist in %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DMeshCopyPropertyList_cold_1(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "source";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. Null argument", a1);
}

void _C3DMeshCopyPropertyList_cold_2(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "C3DGenericSourceIsPrimary(primarySource)";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. This source should be a primary one", a1);
}

void _C3DMeshCopyPropertyList_cold_3(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "sourceID <= INT_MAX";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. Too many objects in the library", a1);
}

void C3D::flattenedNodesForSelectedNodes(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DMaterialSetFillMode_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. invalid fill mode", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DMaterialGetBlendStates_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_ERROR, "Unreachable code: Blend mode not implemented.", v1, 2u);
}

void C3DMaterialGetBlendStates_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DMaterialGetBlendStates_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DMaterialInitWithPropertyList_cold_1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "_C3DMaterialInitWithPropertyList";
  _os_log_error_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_ERROR, "Error: invalid propertylist in %s", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

void C3DSceneNodeWasAdded_cold_1(uint8_t *buf, _QWORD *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "player != NULL";
  _os_log_fault_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. There should only be valid audio sources in this array", buf, 0xCu);
}

void C3DScenePostPipelineEvent_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DSceneSetLayerRootNode_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4_11();
  OUTLINED_FUNCTION_6_2(&dword_1DCCB8000, v0, v1, "Assertion '%s' failed. Only %d layers are available, but layer %d requested", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DSceneInitWithPropertyList_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: Could not read the animations manager", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void _C3DSceneInitWithPropertyList_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, a1, a3, "Error: invalid propertylist in %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DSceneFinalizeDeserialization_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: Scene deserialization : cannot finalize the deserialization of the animation manager", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void _C3DSceneFinalizeDeserialization_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: ... and we do not even have a root node, so bailing out", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void _C3DSceneFinalizeDeserialization_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _copySerializedHierarchy_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: C3DSceneRef _copySerializedHierarchy: lib entry not found", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void _copySerializedHierarchy_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Too many objects", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _deserializeHierarchy_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: _deserializeHierarchy: no nodeID specified!\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void _deserializeHierarchy_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, a2, a3, "Error: Library could not remap the ID %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _deserializeHierarchy_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: _deserializeHierarchy: could not find the specified node in the library\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void _C3DSceneEnumerateSubEntities_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Unreachable code: You can't change the sceneRef of a scene", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DPhysicsWorldAddBodyToWorld(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Node should be visible", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void btC3DCollisionDispatcher::updateContact(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. update should not be called if not implemented by the delegate", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void btC3DCollisionDispatcher::deleteContact(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. update should not be called if not implemented by the delegate", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void SCNCreateGLESContext_cold_1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "context";
  _os_log_fault_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Null argument", (uint8_t *)&v1, 0xCu);
}

void SCNCreateGLESContext_cold_2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_ERROR, "Error: failed to create a GL context", v1, 2u);
}

void C3D::PassDescriptor::inputAtIndex()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1DCCB8000, v0, v1, "Assertion '%s' failed. Pass input descriptor out of bound access %d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void C3D::PassDescriptor::outputAtIndex()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1DCCB8000, v0, v1, "Assertion '%s' failed. Pass output descriptor out of bound access %d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void C3D::PassResource::inputAtIndex()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1DCCB8000, v0, v1, "Assertion '%s' failed. input resource index out of bound %d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void C3D::PassResource::outputAtIndex()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1DCCB8000, v0, v1, "Assertion '%s' failed. output resource index out of bound %d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void C3D::Pass::addDependency(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Adding dependency on self", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3D::Pass::drawableInfo(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3D::Pass::inputBufferParameterAtIndex(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Input buffer parameter index out of bounds", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3D::Pass::outputBufferParameterAtIndex(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Output buffer parameter index out of bounds", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3D::Pass::outputTextureAtIndex(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3D::CachedFXPassName(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DPassGetInputTextureNamed_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void VertexCache<unsigned char>::computeACMR(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_1_4("VertexCache", "C3DMeshElement_Tools.cpp", a3, "cacheSize < kMaxCacheSize");
}

void C3DFramebufferRegistryPrepareFramebufferWithDescription_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _addRenderTargetIfNeeded_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DFramebufferRegistryFinalizeAndGetFramebuffer_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DFramebufferRegistryRetainTextureWithName_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. C3DFramebufferRegistryRetainTextureWithName retainCount==0", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DFramebufferRegistryRetainTextureWithName_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _removeReference_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. _removeReference - index==0", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DFramebufferRegistryReleaseFramebuffer_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __rayIntersectSphere_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. wrong length", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DParticleInitLife_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DParticleInitLifeWithVariation_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DParticleInitBirthTime_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DParticleInitMass_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DParticleInitSize_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DParticleInitBounce_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DParticleInitFriction_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DParticleInitCharge_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DParticleInitColor_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DParticleInitRotationAxis_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DParticleInitFrame_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __reserveData_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. wrong light type", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __updateWorldData_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. wrong probe type", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __updateWorldData_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. wrong probe type", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __lightOptimizedType_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DLightingSystemAdd_cold_2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0_3(&dword_1DCCB8000, a1, a3, "Error: Node is already registered to the light system", v3);
  OUTLINED_FUNCTION_5();
}

void __runtimeIndex_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1DCCB8000, a1, a3, "Error: Too many effective lights at once. Limit is %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void _ComputeRuntimeDataForIndex_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_1DCCB8000, a2, OS_LOG_TYPE_ERROR, "Error: Missing shadow %@", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_1();
}

void C3DLightingSystemBeginQueries_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DLightingSystemGetIrradianceProbesCount_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DLightingSystemGetLightingSetProgramHashCodes_cold_1(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "((rInd > 0) && (rInd <= pipelineData->_runtimeLightsCount)) || (rInd == kDefaultRuntimeIndex)";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. Invalid runtime light index", a1);
}

void C3DLightingSystemGetLightingSetDesc_cold_1(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_3(&dword_1DCCB8000, a3, (uint64_t)a3, "Error: Invalid runtime light index", a1);
}

void C3DLightingSystemComputeShadowMatrices_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0_3(&dword_1DCCB8000, a1, a3, "Error: The shadow node is not registered", v3);
  OUTLINED_FUNCTION_5();
}

void C3DLightingSystemComputeShadowMatrices_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1DCCB8000, a1, a3, "Error: Too many shadow caster lights at once. Limit is %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void C3DLightingSystemComputeShadowMatrices_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Not Yet Implemented!!!!", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DLightingSystemComputeShadowMatrices_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Max caster index overflow", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DLightingSystemComputeShadowMatrices_cold_5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Light does not casts shadow. Cannot compute shadow parameters.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DLightingSystemComputeShadowMatrices_cold_6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DLightingSystemGetActiveShadowCasterData_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. 0 caster index is reserved", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DLightingSystemGetActiveShadowCasterData_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Max caster index overflow", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _copyAnimations_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: error while transposing animations to cloned tree", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void _findClone_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: error while transposing skeleton or morph target", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void createGLFramebufferInfo_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. invalid framebuffer size", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void createGLFramebufferInfo_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. multisampling framebuffer should be null", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void createGLFramebufferInfo_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. framebuffer should be null", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void SCNLightTypeToC3DLightType_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: unknown light type %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void SCNEncodeC3DAnimationForKey_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: SCNEncodeAnimations unknown animation: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void SCNDecodeC3DAnimationForKey_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: can't deserialize animation %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void SCNDecodeC3DAnimationForKey_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: failed to deserialize animation %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _SCNDecodeImageContents_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_ERROR, "Error: SCNDecodemage: invalid archive", v1, 2u);
}

void _C3DToCAFillMode_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: unknown fill mode", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void CABasicAnimationToC3DAnimation_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: animating between instances is not supported", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void CAKeyframeAnimationToC3DAnimation_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1DCCB8000, a2, a3, "Error: CAKeyframeAnimationToC3DAnimation :: too large value to animate : %d bytes", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void CAKeyframeAnimationToC3DAnimation_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: CAKeyframeAnimation has no keyframe - skipping conversion", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void _CAAnimationToC3DAnimation_cold_1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0_4(&dword_1DCCB8000, a2, v4, "Error: Unsupported CAPropertyAnimation subclass (%@)", v5);
  OUTLINED_FUNCTION_4_4();
}

void _CAAnimationToC3DAnimation_cold_2(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0_4(&dword_1DCCB8000, a2, v4, "Error: Unsupported CAAnimation class (%@)", v5);
  OUTLINED_FUNCTION_4_4();
}

void _C3DAnimationToCAAnimation_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: C3DAnimationToCAAnimation: unsupported animation", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void SCNAddAnimation_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0_4(&dword_1DCCB8000, v0, v1, "Error: can't add a NULL animation to %@", v2);
  OUTLINED_FUNCTION_1();
}

void SCNAddAnimation_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. SCNAddAnimationGroup target is not an entity", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void SCNRemoveAnimation_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. SCNRemoveAnimation target is not an entity", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void SCNFadeAndRemoveAnimation_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. SCNFadeAndRemoveAnimation target is not an entity", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void SCNRemoveAllAnimations_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. SCNRemoveAllAnimations target is not an entity", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void SCNFadeAndRemoveAllAnimations_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. SCNFadeAndRemoveAllAnimations target is not an entity", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3D::RenderProbePass::RenderProbePass(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "C3DNodeGetLight(_drawNodesParameters.pointOfView)";
  _os_log_fault_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Null argument", (uint8_t *)&v1, 0xCu);
}

void SCNStandardConstants::_setPropertyFlags(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "*texcoord_io_index < kSCNTexcoordCount";
  _os_log_fault_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. too many io texcoord needed", (uint8_t *)&v1, 0xCu);
}

void C3DParticleSystemGetRenderingMode_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DParticleSystemSetParticleColor_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __appendController_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, a2, a3, "Error: Try to set a controller on a property not present : %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __appendController_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, a2, a3, "Error: Unknown controller mode : %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __appendController_cold_3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, a2, a3, "Error: Try to parametrize with a variable property not present : %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __addPrimaryData_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, a1, a3, "Error: Too many properties added to this ParticleSystem", a5, a6, a7, a8, 0);
}

void C3DParticleSystemGetConstantDataPtrForSemantic_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, a2, a3, "Error: Cannot animate this particle semantic : %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DLibraryCreateEntryIdentifier_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, a1, a3, "Error: C3DLibraryCreateEntryIdentifier - unknown type", a5, a6, a7, a8, 0);
}

void C3DLibraryGetRemappedID_cold_1(int a1, int a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109376;
  v3[1] = a1;
  v4 = 1024;
  v5 = a2;
  _os_log_error_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_ERROR, "Error: library does not contain an entry %d with kind %d", (uint8_t *)v3, 0xEu);
  OUTLINED_FUNCTION_1();
}

void C3DLibraryGetRemappedID_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, a2, a3, "Error: _remapInfos does not contain an entry %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DLibraryTrackID_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DLibraryGetEntry_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DLibraryGetEntryWithUniqueID_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DLibraryGetEntryWithUniqueID_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DLibraryGetEntryWithDocumentID_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DLibraryInitWithPropertyList_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, a2, a3, "Error: Library: could not deserialize the substorage for the type %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DLibraryFinalizeDeserialization_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, a1, a3, "Error: Library deserialization: could not finalize the deserialization of a substorage", a5, a6, a7, a8, 0);
}

void _C3DLibraryFinalizeDeserialization_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DLibraryFinalizeDeserialization_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. inconsistent parameters", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __finalizeDeserialization_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, a2, a3, "Error: Library Deserialization: cannot finalize the deserialization of %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __finalizeDeserialization_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DFloorGetReflectivity_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DFloorInitWithPropertyList_cold_1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "_C3DFloorInitWithPropertyList";
  _os_log_error_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_ERROR, "Error: invalid propertylist in %s", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

void C3D::SmartPtr<__C3DArray *,C3D::detail::CFRetainFct,C3D::detail::CFReleaseFct>::operator __C3DArray *(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Dereferencing null pointer", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DProgramHashCodeStoreRegisterProgramForRendererElementAndHashPass_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. C3DProgramHashCodeStoreRegisterProgramForRendererElement - programIndex out of uint32_t. will crash soon", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DProgramHashCodeStoreRegisterProgramForRendererElementAndHashPass_cold_2(int *a1, int a2, os_log_t log)
{
  int v3;
  _DWORD v4[2];
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4[0] = 67109376;
  v4[1] = a2;
  v5 = 1024;
  v6 = v3;
  _os_log_error_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_ERROR, "Error: C3DProgramHashCodeStoreRegisterProgramForRendererElement - index out of capacity (%d > %d)", (uint8_t *)v4, 0xEu);
  OUTLINED_FUNCTION_1();
}

void C3DMeshCreateFromProfile_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Mesh type has to define a topology", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DGeometryInitSubdivTopologyInfoIfNeeded()
{
  __assert_rtn("C3DGeometryInitSubdivTopologyInfoIfNeeded", "C3DGeometryOpenSubdivSupportInternal.cpp", 810, "vertIndicesPerFaceCurrentIndex == topologyInfo->totalIndexCount");
}

{
  __assert_rtn("C3DGeometryInitSubdivTopologyInfoIfNeeded", "C3DGeometryOpenSubdivSupportInternal.cpp", 771, "(int32_t)vertexCountPerFaceCurrentIndex == topologyInfo->topologyDescriptor.numFaces");
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Warning: Subdivision process might lead to gaps in surface because vertex welding is disabled when subdividing on the GPU", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Unreachable code: Trying to subdivide a mesh that does not have exactly 1 position source.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DGeometryOsdGetTextureCoordinatesDataType(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1DCCB8000, a2, a3, "Unreachable code: Unssuported texture coordinates channel (%d)", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void _Z68C3DSubdivCPUPrimvarDataCopyCrossNormalizedDataAtIndexToBufferAtIndexIDv2_fEvRNSt3__16vectorI16C3DSubdivCPUDataIT_ENS1_9allocatorIS5_EEEES9_iPfi_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Unreachable code: Does not make sense", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DGeometrySubdivTopologyInfoInitCreasesAndCorners(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Found crease element with more than 1 channel", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DSubdivInitCPUPrimvarContext(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "currentIndex == topologyInfo->totalIndexCount";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. Error while building face-varying channel.", a1);
}

void ___Z30C3DSubdivInitCPUPrimvarContextP26C3DSubdivCPUPrimvarContextPK26C3DGeometrySubdivisionInfoP9__C3DMesh_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_2_0(&dword_1DCCB8000, v0, v1, "Assertion '%s' failed. Semantic %d can not be a primvar", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DSubdivSourceGetPrimvarDataType()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_2_0(&dword_1DCCB8000, v0, v1, "Assertion '%s' failed. Semantic %d can not be a primvar", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void __C3DSubdivFeedCPUPrimvar(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1DCCB8000, a2, a3, "Unreachable code: Can not subdivide primvar data with %d values per component", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void C3DSubdivInitGPUPrimvarDescriptor(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "overallVertexIndex == topologyInfo->totalIndexCount";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. Error while building face-varying channel.", a1);
}

void ___Z33C3DSubdivInitGPUPrimvarDescriptorP29C3DSubdivGPUPrimvarDescriptorPK26C3DGeometrySubdivisionInfoP9__C3DMesh_block_invoke_cold_1(uint8_t *a1)
{
  NSObject *v2;

  v2 = scn_default_log();
  os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);
  *(_WORD *)a1 = 0;
  _os_log_error_impl(&dword_1DCCB8000, v2, OS_LOG_TYPE_ERROR, "Unreachable code: Internal consistency error", a1, 2u);
  __break(1u);
}

void ___Z33C3DSubdivInitGPUPrimvarDescriptorP29C3DSubdivGPUPrimvarDescriptorPK26C3DGeometrySubdivisionInfoP9__C3DMesh_block_invoke_cold_2(char a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  C3DMeshSourceSemanticToSemanticString(a1);
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0_4(&dword_1DCCB8000, a2, v3, "Unreachable code: Invalid GPU primvar semantic '%@'", v4);
}

void C3DSubdivComputeElementToFaceRangeTable(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "subdividedElementIndexForFace < subdividedElementCount";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. Internal consistency error", a1);
}

void C3DSubdivComputeElementToPatchRangeTable(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_ERROR, "Unreachable code: Internal consistency error - Unexpected element type", buf, 2u);
}

void C3DSubdivCreateMesh(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "indexBufferIndex == indexBufferIndexCount";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. Internal consistency error", a1);
}

void C3DSubdivCreateMesh()
{
  __assert_rtn("C3DSubdivCreateMesh", "C3DGeometryOpenSubdivSupportInternal.cpp", 1745, "faceVertexIndices.size() == 4");
}

{
  __assert_rtn("C3DSubdivCreateMesh", "C3DGeometryOpenSubdivSupportInternal.cpp", 1725, "faceVertexIndices.size() == 4");
}

void _ZN23C3DSubdivCPUPrimvarDataIDv2_fE11InterpolateEiPN10OpenSubdiv6v3_1_13Far14PrimvarRefinerEPNS4_15TopologyRefinerE_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Can't subdivide further", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _ZN23C3DSubdivCPUPrimvarDataIDv3_fE11InterpolateEiPN10OpenSubdiv6v3_1_13Far14PrimvarRefinerEPNS4_15TopologyRefinerE_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_19_0("InterpolateVarying", "primvarRefiner.h", a3, "level>0 && level<=(int)_refiner._refinements.size()");
}

void _ZNK10OpenSubdiv6v3_1_13Far14PrimvarRefiner11InterpolateIP16C3DSubdivCPUDataIDv2_fENSt3__16vectorIS6_NS8_9allocatorIS6_EEEEEEviRKT_RT0__cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_17("Interpolate", "primvarRefiner.h", a3, "level>0 && level<=(int)_refiner._refinements.size()");
}

void _ZNK10OpenSubdiv6v3_1_13Far14PrimvarRefiner22InterpolateFaceVaryingIP16C3DSubdivCPUDataIDv2_fENSt3__16vectorIS6_NS8_9allocatorIS6_EEEEEEviRKT_RT0_i_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_17_0("InterpolateFaceVarying", "primvarRefiner.h", a3, "level>0 && level<=(int)_refiner._refinements.size()");
}

void _ZNK10OpenSubdiv6v3_1_13Far14PrimvarRefiner15interpFromEdgesILNS0_3Sdc10SchemeTypeE1EP16C3DSubdivCPUDataIDv2_fENSt3__16vectorIS8_NSA_9allocatorIS8_EEEEEEviRKT0_RT1__cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_11_1("interpFromEdges", "primvarRefiner.h", a3, "refinement.getNumChildVerticesFromFaces() > 0");
}

void _ZNK10OpenSubdiv6v3_1_13Far14PrimvarRefiner15interpFromEdgesILNS0_3Sdc10SchemeTypeE1EP16C3DSubdivCPUDataIDv2_fENSt3__16vectorIS8_NSA_9allocatorIS8_EEEEEEviRKT0_RT1__cold_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_10_3("interpFromEdges", "primvarRefiner.h", a3, "Vtr::IndexIsValid(cVertOfFace)");
}

void _ZNK10OpenSubdiv6v3_1_13Far14PrimvarRefiner15interpFromVertsILNS0_3Sdc10SchemeTypeE1EP16C3DSubdivCPUDataIDv2_fENSt3__16vectorIS8_NSA_9allocatorIS8_EEEEEEviRKT0_RT1__cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_9_2("interpFromVerts", "primvarRefiner.h", a3, "vMask.AreFaceWeightsForFaceCenters()");
}

void _ZNK10OpenSubdiv6v3_1_13Far14PrimvarRefiner15interpFromVertsILNS0_3Sdc10SchemeTypeE1EP16C3DSubdivCPUDataIDv2_fENSt3__16vectorIS8_NSA_9allocatorIS8_EEEEEEviRKT0_RT1__cold_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_8_3("interpFromVerts", "primvarRefiner.h", a3, "Vtr::IndexIsValid(cVertOfFace)");
}

void OpenSubdiv::v3_1_1::Sdc::Scheme<(OpenSubdiv::v3_1_1::Sdc::SchemeType)1>::ComputeVertexVertexMask<OpenSubdiv::v3_1_1::Vtr::internal::VertexInterface,OpenSubdiv::v3_1_1::Far::PrimvarRefiner::Mask>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_23("assignSmoothMaskForVertex", "catmarkScheme.h", a3, "vertex.GetNumFaces() == vertex.GetNumEdges()");
}

void OpenSubdiv::v3_1_1::Sdc::Scheme<(OpenSubdiv::v3_1_1::Sdc::SchemeType)1>::ComputeVertexVertexMask<OpenSubdiv::v3_1_1::Vtr::internal::VertexInterface,OpenSubdiv::v3_1_1::Far::PrimvarRefiner::Mask>()
{
  __assert_rtn("CombineVertexVertexMasks", "scheme.h", 289, "this->AreFaceWeightsForFaceCenters() == dst.AreFaceWeightsForFaceCenters()");
}

void _ZNK10OpenSubdiv6v3_1_13Far14PrimvarRefiner19interpFVarFromEdgesILNS0_3Sdc10SchemeTypeE1EP16C3DSubdivCPUDataIDv2_fENSt3__16vectorIS8_NSA_9allocatorIS8_EEEEEEviRKT0_RT1_i_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_7_3("interpFVarFromEdges", "primvarRefiner.h", a3, "Vtr::IndexIsValid(cVertOfFace)");
}

void _ZNK10OpenSubdiv6v3_1_13Far14PrimvarRefiner19interpFVarFromEdgesILNS0_3Sdc10SchemeTypeE1EP16C3DSubdivCPUDataIDv2_fENSt3__16vectorIS8_NSA_9allocatorIS8_EEEEEEviRKT0_RT1_i_cold_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_3_5("interpFVarFromEdges", "primvarRefiner.h", a3, "eFaceIndex == i");
}

void _ZNK10OpenSubdiv6v3_1_13Far14PrimvarRefiner19interpFVarFromVertsILNS0_3Sdc10SchemeTypeE1EP16C3DSubdivCPUDataIDv2_fENSt3__16vectorIS8_NSA_9allocatorIS8_EEEEEEviRKT0_RT1_i_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_6_3("interpFVarFromVerts", "primvarRefiner.h", a3, "vMask.AreFaceWeightsForFaceCenters()");
}

void _ZNK10OpenSubdiv6v3_1_13Far14PrimvarRefiner19interpFVarFromVertsILNS0_3Sdc10SchemeTypeE1EP16C3DSubdivCPUDataIDv2_fENSt3__16vectorIS8_NSA_9allocatorIS8_EEEEEEviRKT0_RT1_i_cold_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_12_1("interpFVarFromVerts", "primvarRefiner.h", a3, "Vtr::IndexIsValid(cVertOfFace)");
}

void _ZNK10OpenSubdiv6v3_1_13Far14PrimvarRefiner19interpFVarFromVertsILNS0_3Sdc10SchemeTypeE1EP16C3DSubdivCPUDataIDv2_fENSt3__16vectorIS8_NSA_9allocatorIS8_EEEEEEviRKT0_RT1_i_cold_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_4_12("interpFVarFromVerts", "primvarRefiner.h", a3, "pSibling == cSibling");
}

void _ZN23C3DSubdivCPUPrimvarDataIDv2_fE17CreateMeshSourcesERKN10OpenSubdiv6v3_1_13Far13TopologyLevelEPNS4_14PrimvarRefinerEbPK22C3DSubdivisionSettingsP31C3DSubdivCPUMeshCreationContext_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Number of normals at limit surface is not equal to number of vertex positions", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _ZN23C3DSubdivCPUPrimvarDataIDv2_fE17CreateMeshSourcesERKN10OpenSubdiv6v3_1_13Far13TopologyLevelEPNS4_14PrimvarRefinerEbPK22C3DSubdivisionSettingsP31C3DSubdivCPUMeshCreationContext_cold_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_27("CreateMeshSources", "C3DGeometryOpenSubdivSupportInternal.cpp", a3, "faceVertexCount == 4");
}

void _ZN23C3DSubdivCPUPrimvarDataIDv2_fE17CreateMeshSourcesERKN10OpenSubdiv6v3_1_13Far13TopologyLevelEPNS4_14PrimvarRefinerEbPK22C3DSubdivisionSettingsP31C3DSubdivCPUMeshCreationContext_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Position sources must use the 'vertex' interpolation mode", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _ZN23C3DSubdivCPUPrimvarDataIDv2_fE26_CreateMeshSourceForSourceERKN10OpenSubdiv6v3_1_13Far13TopologyLevelEbPK15__C3DMeshSourceP31C3DSubdivCPUMeshCreationContext_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_21_0();
  OUTLINED_FUNCTION_6(&dword_1DCCB8000, v0, v1, "Error: Position must be float3 to be subdivided. Actual type is %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void _ZNK10OpenSubdiv6v3_1_13Far14PrimvarRefiner5limitILNS0_3Sdc10SchemeTypeE1ENSt3__16vectorI16C3DSubdivCPUDataIDv2_fENS6_9allocatorISA_EEEESD_SD_SD_EEvRKT0_RT1_PT2_PT3__cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_15("limit", "primvarRefiner.h", a3, "tan1Mask.GetNumEdgeWeights() == tan2Mask.GetNumEdgeWeights()");
}

void _ZNK10OpenSubdiv6v3_1_13Far14PrimvarRefiner5limitILNS0_3Sdc10SchemeTypeE1ENSt3__16vectorI16C3DSubdivCPUDataIDv2_fENS6_9allocatorISA_EEEESD_SD_SD_EEvRKT0_RT1_PT2_PT3__cold_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_20_0("limit", "primvarRefiner.h", a3, "tan1Mask.GetNumFaceWeights() == tan2Mask.GetNumFaceWeights()");
}

void OpenSubdiv::v3_1_1::Sdc::Scheme<(OpenSubdiv::v3_1_1::Sdc::SchemeType)2>::ComputeVertexLimitMask<OpenSubdiv::v3_1_1::Vtr::internal::VertexInterface,OpenSubdiv::v3_1_1::Far::PrimvarRefiner::Mask>()
{
  __assert_rtn("assignSmoothLimitMask", "loopScheme.h", 274, "valence != 2");
}

void C3DSkinnerSetOwnerNode_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DSkinnerUpdateBoundingBox_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: _C3DSkinnerUpdateBoundingBox invalid mesh source", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void _C3DSkinnerUpdateBoundingBox_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: We did not succeed in locating all the joints, so do not update the geometry as it might be worse if we use the wrong bones.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __C3DSkinnerPrepareSkinnedMesh_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __C3DSkinnerPrepareSkinnedMesh_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __C3DSkinnerPrepareSkinnedMesh_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Unreachable code: Unknown skinning calculation mode.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __C3DSkinnerPrepareSkinnedMesh_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DSkinnerGetEffectiveCalculationMode_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5();
}

void _computeJointMatrices_cold_1(uint8_t *buf, _QWORD *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "joint";
  _os_log_fault_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Null argument", buf, 0xCu);
}

void C3DSkinnerUpdateCurrentMesh_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Normal source should be mutable", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DSkinnerUpdateCurrentMesh_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Position source should be mutable", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DSkinnerUpdateCurrentMesh_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. flags not up to date", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DSkinnerUpdateCurrentMesh_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. flags not up to date", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DSkinnerUpdateCurrentMesh_cold_5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void C3DSkinnerGetSkinnedMeshLegacy_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DSkinnerUpdateJointsAndBoundingBox_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: C3DSkinnerUpdateJointsAndBoundingBox skinner has no mesh", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DSkinnerUpdateJointsAndBoundingBox_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. CPU skinning: normal not mutable", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DSkinnerUpdateJointsAndBoundingBox_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. CPU Skinning dst normal source not created.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DSkinnerUpdateJointsAndBoundingBox_cold_5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. CPU skinning: position not mutable", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DSkinnerUpdateJointsAndBoundingBox_cold_6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. CPU Skinning dst position source not created.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DSkinnerUpdateJointsAndBoundingBox_cold_7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DSkinnerFinalizeDeserialization_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: Skinner deserialization: cannot find a joint", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void _C3DSkinnerFinalizeDeserialization_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: Skinner deserialization: cannot find the skin", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __EntryNumberCreate_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: C3DSkinner serialization: lib entry not found", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __EntryNumberCreate_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Too many objects", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __EntryForEntryNumber_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: C3DSkinner deserialization: lib entry not found", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __EntryForEntryNumber_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: C3DSkinner deserialization: Could not get a valid number value", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DSkinCreateWithSkinnableMesh_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0_3(&dword_1DCCB8000, a1, a3, "Error: Unsupported skin weight format", v3);
  OUTLINED_FUNCTION_5();
}

void C3DSkinCopyInverseBindMatricesPtr_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DSkinFillJointWeightsBuffers_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0_3(&dword_1DCCB8000, a1, a3, "Error: invalid skin indices", v3);
  OUTLINED_FUNCTION_5();
}

void C3DSkinFillJointWeightsBuffers_cold_2(os_log_t log)
{
  int v1;
  const char *v2;
  __int16 v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = 136315394;
  v2 = "count == dstJoints.count && (!dstWeights.ptr || (count == dstWeights.count))";
  v3 = 2080;
  v4 = "C3DSkinFillJointWeightsBuffers";
  _os_log_fault_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. inconsistency in %s", (uint8_t *)&v1, 0x16u);
  OUTLINED_FUNCTION_1();
}

void _C3DSkinInitWithPropertyList_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: No jointsCount in the skin %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _C3DSkinInitWithPropertyList_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: Unable to read the jointsCount in the skin %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _C3DSkinInitWithPropertyList_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: No inverseBindMatrices in the skin %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _C3DSkinInitWithPropertyList_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: No defaultShapeMatrix in the skin %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _C3DSkinInitWithPropertyList_cold_6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, a1, a3, "Error: invalid propertylist in %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DSkinCopyPropertyList_cold_1(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_3(&dword_1DCCB8000, a3, (uint64_t)a3, "Error: A vertex weight index does not fit on an int", a1);
}

void _C3DSkinFinalizeDeserialization_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: Skin deserialization: no weightsCount in %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _C3DSkinFinalizeDeserialization_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: Skin deserialization: no jointsForVertexWeights in %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _C3DSkinFinalizeDeserialization_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: Skin deserialization: no vertexWeights in %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _C3DSkinFinalizeDeserialization_cold_4(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0_3(&dword_1DCCB8000, a1, a3, "Error: Skin deserialization: invalid vertexWeights", v3);
  OUTLINED_FUNCTION_5();
}

void _C3DSkinFinalizeDeserialization_cold_5(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_1DCCB8000, a2, OS_LOG_TYPE_ERROR, "Error: Skin: Could not remap the ID for geometry %d", (uint8_t *)v3, 8u);
  OUTLINED_FUNCTION_5();
}

void _C3DSourceAccessorInitWithPropertyList_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: GenericSource deserialize => no data type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void _C3DSourceAccessorInitWithPropertyList_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: GenericSource deserialize => no count, bailing out", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void _C3DSourceAccessorInitWithPropertyList_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: GenericSource deserialize => no comp/value, bailing out", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void _C3DSourceAccessorInitWithPropertyList_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: GenericSource deserialize => no padding, bailing out", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void _C3DSourceAccessorInitWithPropertyList_cold_7(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "_C3DSourceAccessorInitWithPropertyList";
  _os_log_error_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_ERROR, "Error: invalid propertylist in %s", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

void _C3DSourceAccessorCopyPropertyList_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: Accessor serialization failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void _C3DSourceAccessorCopyPropertyList_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: Could not serialize the accessor's type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void _C3DSourceAccessorCopyPropertyList_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: accessor->_count too big", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void _C3DSourceAccessorCopyPropertyList_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: accessor->_offset too big", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void _C3DSourceAccessorCopyPropertyList_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: accessor->_padding too big", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void _C3DSourceAccessorFinalizeDeserialization_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: Accessor deserialization: : no serialized data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void _C3DSourceAccessorFinalizeDeserialization_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: Accessor deserialization: Could not find the source ID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void _C3DSourceAccessorFinalizeDeserialization_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: Accessor deserialization: Could not find a valid source type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void _C3DSourceAccessorFinalizeDeserialization_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1DCCB8000, a1, a3, "Error: Accessor deserialization: Could not remap the ID for source %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void _C3DSourceAccessorFinalizeDeserialization_cold_5(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1DCCB8000, a2, a3, "Error: Accessor deserialization: Could not remap the ID for source %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void C3DSourceAccessorGetData_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DSourceAccessorGetValuePtrAtIndex_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: C3DSourceAccessorGetValuePtrAtIndex - no data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DSourceAccessorGetValuePtrAtIndex_cold_2()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_7(&dword_1DCCB8000, v0, v1, "Error: C3DSourceAccessorGetValuePtrAtIndex - index out of bounds : %d > %d", v2, v3);
  OUTLINED_FUNCTION_1();
}

void C3DSourceAccessorGetMutableValuePtrAtIndex_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_7(&dword_1DCCB8000, v0, v1, "Error: C3DSourceAccessorGetMutableValuePtrAtIndex - index out of bounds : %d > %d", v2, v3);
  OUTLINED_FUNCTION_1();
}

void C3DSourceAccessorGetVolatileValuePtrAtIndex_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. cannot access volatile data on non volatile source", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DSourceAccessorGetVolatileValuePtrAtIndex_cold_2()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_7(&dword_1DCCB8000, v0, v1, "Error: C3DSourceAccessorGetVolatileValuePtrAtIndex - index out of bounds : %d > %d", v2, v3);
  OUTLINED_FUNCTION_1();
}

void C3DSourceAccessorCopyDataToAccessor_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: The destination does not have enough room to copy this data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DSourceAccessorCopyDataToAccessor_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: error in C3DSourceAccessorCopyDataToAccessor", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void _C3DGenericSourceInitWithPropertyList_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: ERROR: GenericSource deserialize => no data type, bailing out", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void _C3DGenericSourceInitWithPropertyList_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: ERROR: GenericSource deserialize => no count, bailing out", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void _C3DGenericSourceInitWithPropertyList_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: ERROR: GenericSource deserialize => no stride, bailing out", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void _C3DGenericSourceInitWithPropertyList_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. We used to support only floats, but another type was encountered", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DGenericSourceInitWithPropertyList_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: Could not deserialize an accessor", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void _C3DGenericSourceInitWithPropertyList_cold_6(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "_C3DGenericSourceInitWithPropertyList";
  _os_log_error_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_ERROR, "Error: invalid propertylist in %s", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

void _C3DGenericSourceCopyPropertyList_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: Could not serialize an accessor", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void _C3DGenericSourceFinalizeDeserialization_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: Cannot finalize the deserialization of mesh source: accessor data missing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DGenericSourceCreate_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DGenericSourceSetData_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. cannot set data to MTL buffer", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DGenericSourceSetData_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. cannot set data to volatile source", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DGenericSourceSetVolatileData_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. cannot set volatile data to MTL buffer", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DGenericSourceSetVolatileData_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. cannot set volatile data to non volatile source", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DGenericSourceCreateSerializedDataWithAccessors_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DGenericSourceCreateDeserializedDataWithAccessors_cold_1(uint8_t *buf, _QWORD *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "C3DSourceAccessorGetSource(accessor) == (C3DGenericSourceRef) genericsource";
  _os_log_fault_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. This accessor doesn't point back to the primary source", buf, 0xCu);
}

void C3DResourceCacheCreate_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DResourceCacheCopyResourceForSource_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DResourceCacheGetSourceForResource_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3D::DrawNodesPass::setup(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. DrawNodes must output in color or depth as first outputs", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3D::DrawNodesPass::_renderEye(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3D::DrawNodesPass::_setupPointOfView(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3D::DrawNodesPass::_setupPointOfViewMatrices(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Can't get a valid projection info", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DAnimationGroupAddAnimation_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DAnimationGroupAddAnimations_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DAnimationGroupAddAnimations_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DAnimationGroupCopy_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DAnimationGroupInitWithPropertyList_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, a2, a3, "Error: Could not deserialize an animation: animation not found in %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DAnimationGroupInitWithPropertyList_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, a2, a3, "Error: Could not deserialize an animation: targetPath not found in %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DAnimationGroupInitWithPropertyList_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, a1, a3, "Error: Could not deserialize a keyframe animation", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void _C3DAnimationGroupInitWithPropertyList_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, a1, a3, "Error: Could not deserialize an animation", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void _C3DAnimationGroupInitWithPropertyList_cold_5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, a1, a3, "Error: Animation group deserialization: could not deserialize the animation", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void _C3DAnimationGroupCopyPropertyList_cold_1(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_ERROR, "Error: _C3DAnimationChannelCopyPropertyList - no target path", buf, 2u);
}

void C3D::JitteringPass::execute(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "count > 0";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Count should be > 0", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

void ___Z90C3DWrapDeformerComputeSharedBindingPointIndicesAndBarycentricCoordsFromSandwichedPositions34SCNGeometryWrapDeformerBindingMode13simd_float4x4jP9__C3DMeshS2_S2_PK15__C3DMeshSourceS5_S5_ll38SCNWrapDeformerBarycentricCoordsPolicyPhPtPjPfS8_SA_PSA_SB_PmSB_SB_SC__block_invoke_2_cold_1()
{
  __assert_rtn("C3DWrapDeformerComputeSharedBindingPointIndicesAndBarycentricCoordsFromSandwichedPositions_block_invoke_2", "SCNGeometryWrapDeformerUtils.mm", 1055, "faceVertexCount == 4");
}

void __adjustDistanceByAligningProjection()
{
  __assert_rtn("__adjustDistanceByAligningProjection", "SCNGeometryWrapDeformerUtils.mm", 328, "0");
}

void ___ZL10__bindToUVDv2_fP9__C3DMeshPK15__C3DMeshSourceS4_llPDv3_fS6_PDv3_j_block_invoke_cold_1()
{
  __assert_rtn("__bindToUV_block_invoke", "SCNGeometryWrapDeformerUtils.mm", 193, "faceVertexCount == 4");
}

void __computeBarycentricCoordinates2D()
{
  __assert_rtn("__computeBarycentricCoordinates2D", "SCNGeometryWrapDeformerUtils.mm", 109, "0");
}

void C3D::ScenePass::setup(uint8_t *buf, _QWORD *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "previousFilterPass";
  _os_log_fault_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Null argument", buf, 0xCu);
}

void C3D::Array<C3D::PassIODescriptor,0u,C3D::StackAllocator>::back(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Trying to access last element of empty Array.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3D::ScenePass::_shouldPushNodeToVisible(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Not enough space allocated", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Top level filtered node must have a filter", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DParametricGeometryGeneratePoints_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, a1, a3, "Unreachable code: NOT IMPLEMENTED YET", a5, a6, a7, a8, 0);
}

void C3DParametricGeometryValidate_cold_1()
{
  __assert_rtn("_C3DParametricGeometryCreateCacheHash_not_thread_safe", "C3DParametricGeometry.c", 175, "size <= sizeof(C3DParametricGeometryType) + sizeof(C3DParametricGeometryParameters)");
}

void C3DParametricGeometryGetType_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, a1, a3, "Unreachable code: C3DParametricGeometryGetType - unknown type", a5, a6, a7, a8, 0);
}

void C3DParametricGeometryGetChamferRadius_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DParametricGeometryCreate_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DParametricGeometryCopy_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. A parametric geometry with a mesh must also have a hash", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DParametricGeometryCacheIncrRetainCountForHash_not_thread_safe_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. inconsistency in _C3DParametricGeometryCacheIncrRetainCount", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DParametricGeometryIsHemispheric_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DParametricGeometryReleaseCachedMesh_not_thread_safe_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. inconsistency in _C3DParametricGeometryReleaseCachedMesh", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DGLSLProfileBindProfileInputs_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_ERROR, "Error: C3DGLSLProfileBindProfileInputs - profile has no technique", v1, 2u);
}

void C3DValueSetValueFromString_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. string to type conversion not supported", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DValueConcat_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. C3DValueAdd - invalid arguments", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DValueConcat_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. C3DValueAdd - invalid arguments", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DValueConcat_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DValueConcat_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DValueConcat_cold_5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DFXSamplerSetTextureSampler_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DIOFinalizeLoadScene_cold_1(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_ERROR, "Unreachable code: __OptimizeMesh:bytesPerIndex != 1, 2, or 4 during conversion, this should not happen !!", buf, 2u);
}

void C3D::CIFilterPass::execute(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3D::SmartPtr<CIContext *,C3D::detail::NSRetainFct,C3D::detail::NSReleaseFct>::operator CIContext *(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Dereferencing null pointer", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DIOCreateSceneWithData_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: This file cannot be opened (version is too old)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void _C3DIOCreateSceneWithData_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: This file cannot be opened (version of this c3d is too recent for this version of the framework)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void _C3DIOCreateSceneWithData_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: Cannot get the library in the serialized data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void _C3DIOCreateSceneWithData_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: cannot finalize scene deserialization", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void _C3DIOCreateSceneWithData_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: cannot initialize scene", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void _C3DIOCreateSceneWithData_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: cannot initialize library", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void _C3DIOCreateSceneWithData_cold_7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: Could not find the zipped data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void _C3DIOCreateSceneWithData_cold_8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: Could not unzip the zipped data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void _C3DIOCreateSceneWithData_cold_9(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, a2, a3, "Error: Error loading the unzipped data: %@", a5, a6, a7, a8, 2u);
}

void _C3DCreatePropertyListFromScene_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: Could not get the data for the serialized property list", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void _C3DCreatePropertyListFromScene_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, a2, a3, "Error: can't serize plist :%@", a5, a6, a7, a8, 2u);
}

void _C3DCreatePropertyListFromScene_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: Could not zip the serialized property list", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DEntityRemoveAllAnimations_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DEntityCFInit_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, a1, a3, "Unreachable code: _C3DEntityCFInit", a5, a6, a7, a8, 0);
}

void _C3DEntityCFFinalize_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, a1, a3, "Unreachable code: _C3DEntityCFFinalize", a5, a6, a7, a8, 0);
}

void C3DEntityGetAttribute_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DEntityInitWithPropertyList_cold_1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "C3DEntityInitWithPropertyList";
  _os_log_error_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_ERROR, "Error: invalid propertylist in %s", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

void _C3DEntityGetSubAttributeOrderedDictionary_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. C3DEntitySetAttribute failed to cache attribute", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DEntityRemoveBindingWithKeyPath_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DEntityAddAction_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DEntitySetValueForKey_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DEngineNotificationQueueEnqueueEvent_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. missing attribute", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DEngineNotificationQueueEnqueueEvent_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DEngineNotificationQueueStartObserving_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __EnqueueNotification_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_ERROR, "Error: unknown notification name", v1, 2u);
}

void C3DDynamicBatchingSystemSetMaxBatchSize_cold_1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "dynamicBatchingSystem->_currentBatchInstancesCount == 0";
  _os_log_fault_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Can't change max batch size while in batch", (uint8_t *)&v1, 0xCu);
}

void _initializeRenderFromLightPass_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: _initializeRenderFromLightPass - no light", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void _initializeDeferredShadows_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: _initializeDeferredShadows - no light", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void _willExecuteDeferredShadows_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: _willExecuteDeferredShadows - no light", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void _setupDeferredShadows_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: _setupDeferredShadows - no light", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void ___ZL21SCNLoadUsdKitIfNeededv_block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_ERROR, "Error: Could not load UsdKit", v1, 2u);
}

void __morphWeightsHaveChanged_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Morpher failed to update all its runtime weights", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DMorphUpdateCPUMeshIncrementally_cold_1(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "element";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. Null argument", a1);
}

void __blendsparse_dst_float_src_float_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Morph of other type than float not yet implemented", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DMorphGetWeightCount_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DMorphConvertToSparse_cold_1(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "morph->_calculationMode == kC3DMorpherCalculationModeAdditive";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. sparse targets should be in additive mode", a1);
}

void C3DMorphConvertToSparse_cold_2(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "C3DMeshGetElementsCount(targetMesh) == 1";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. sparse target should only contain 1 mesh element", a1);
}

void C3DMorphConvertToSparse_cold_3(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "channels[i] == channels[0]";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. It doesn't make sense to call C3DMeshElementCreateIntervalList for sources with different channels", a1);
}

void C3DMorphGetIndexOfTargetWithName_cold_1(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "name";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. Null argument", a1);
}

void _C3DMorphInitWithPropertyList_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, a2, a3, "Error: No morphingType in the morph %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DMorphInitWithPropertyList_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, a2, a3, "Error: Unable to read the morphingType in the morph %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DMorphInitWithPropertyList_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, a1, a3, "Error: invalid propertylist in %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DMorphFinalizeDeserialization_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1DCCB8000, a2, a3, "Error: Could not remap the ID for mesh %d", a5, a6, a7, a8, 0);
}

void _C3DMorphFinalizeDeserialization_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1DCCB8000, a2, a3, "Error: Could not remap the ID for weights source %d", a5, a6, a7, a8, 0);
}

void __evaluateRuntimeWeightsForInBetween_cold_1(int a1, int a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109376;
  v3[1] = a2;
  v4 = 1024;
  v5 = a1;
  _os_log_error_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_ERROR, "Error: Internal consistency error. There should be %d runtime morph target weights, but we the current morph weight index is %d.", (uint8_t *)v3, 0xEu);
  OUTLINED_FUNCTION_1();
}

void C3DMorpherBeginIncrementalPass_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DMorpherPrepareMorphedMesh_cold_1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "_C3DMorpherPrepareMorphedMesh";
  _os_log_error_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_ERROR, "Unreachable code: %s should never be called when using the new deformer pipeline", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

void _C3DMorpherFinalizeDeserialization_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, a1, a3, "Error: Morpher deserialization: cannot find the morph", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void _C3DMorpherFinalizeDeserialization_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, a1, a3, "Error: C3DMorpher deserialization: lib entry not found", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void _C3DMorpherFinalizeDeserialization_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, a1, a3, "Error: C3DMorpher deserialization: Could not get a valid number value", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void C3DFXContextSetPostProcessTechnique_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DFXContextIsMainPass_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DFXContextGetCurrentPassInstance_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. C3DFXContextGetCurrentPassInstance - invalid index", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DFXContextSetup_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: _C3DFXSetupPasses : no context", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DEngineContextRenderSubTechnique_cold_1(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "pass->_drawInstruction != kC3DFXDrawScene";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. sub techniques of type draw scene is not supported", a1);
}

void C3DEngineContextRenderSubTechnique_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. C3DEngineContextRenderSubTechnique is already being rendered", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DEngineContextRenderSubTechnique_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __C3DEngineContextRenderPassInstance_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: C3DEngineContextRenderTechnique - unknown draw instruction", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __C3DEngineContextRenderPassInstance_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, a2, a3, "Error: pass %@ has no program set", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __C3DEngineContextRenderPassInstance_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. unexpected subpass fbo", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __C3DEngineContextRenderPassInstance_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: C3DFXRenderPassWillExecute: invalid framebuffer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __C3DEngineContextRenderPassInstance_cold_5(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, a2, a3, "Error: failed to bind program for pass %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __appendTechnique_cold_1(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "store";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. Null argument", a1);
}

void __appendTechnique_cold_2(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "pipeline";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. Null argument", a1);
}

void __appendTechnique_cold_3(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "scene";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. Null argument", a1);
}

void C3DEngineContextRenderMainTechnique_cold_1(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "passInstance";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. Null argument", a1);
}

void C3DEngineContextRenderMainTechnique_cold_2(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "engineContext";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. Null argument", a1);
}

void C3DEngineContextRenderMainTechnique_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Need one type of render context", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DFXContextSetCurrentColor_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. C3DFXContextSetCurrentColor invalid retainCount", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DFXContextSetCurrentDepth_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. C3DFXContextSetCurrentDepth invalid retainCount", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3D::CustomPass::name(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Override custom pass name if it doesn't have any fxPass", a5, a6, a7, a8, 2u);
}

void C3D::CustomPass::execute(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Override custom pass execute if it doesn't have any fxPass", a5, a6, a7, a8, 2u);
}

void __HandleProfileWillDieNotification_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. wrong notification sent", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DFXGLSLProgramSetUniformIndex_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. program is of wrong type", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DFXGLSLProgramSetUniformIndex_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DFXGLSLProgramSetAttributeIndex_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DVertexAttribFromParameterSemantic_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. C3DVertexAttribFromParameterSemantic channel out of bounds", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DRendererDelegateCreate_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DRendererDelegateFireWithNode_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void SCNMTLTexturePool::allocate(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, a2, a3, "Error: Could not create texture with descriptor : %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void SCNMTLTexturePool::allocateWithStagingBuffer(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "(tex.pixelFormat == MTLPixelFormatR16Uint) || (tex.pixelFormat == MTLPixelFormatRG16Uint) || (tex.pixelFormat == "
       "MTLPixelFormatRGBA16Uint)";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Only uint16 format are supported for the compute path of the copy buffer to texture", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

void SCNMTLTexturePool::free(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, a2, a3, "Unreachable code: Wrong texture given to the cache %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __ReplaceCodeWithModifiers_cold_1(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_3(&dword_1DCCB8000, a3, (uint64_t)a3, "Error: Invalid shader modifier : no code provided", a1);
}

void _willExecuteDof_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, a1, a3, "Error: DOF pass: no point of view", a5, a6, a7, a8, 0);
}

void _willExecuteDof_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, a1, a3, "Error: DOF pass: no camera", a5, a6, a7, a8, 0);
}

void C3DExecuteProgressBlocks_cold_1(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "progress.fractionCompleted <= 1.0";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. Progress fraction is greater than 1.0", a1);
}

void C3DExecuteProgressBlocks_cold_2(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "progress == nil || (progress == [NSProgress currentProgress])";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. Progress not current.", a1);
}

void C3DExecuteIncrementalProgressBlock_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Progress fraction is greater than 1.0", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DExecuteIncrementalProgressBlock_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Progress not current.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _createSCNGeometrySubArrayFromC3DGeometryArray_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Invalid range", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DProgramHashCodeCFFinalize_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DProgramHashCodeCFFinalize_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. ProgramHashCode should be in the dictionary", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __UpdateHashCodeWithTextureType_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. __UpdateHashCodeWithTextureType:inconsistent textureType", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DProgramHashCodeGetUVSetInfo_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DProgramHashCodeGetCustomSlotSortedName_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, a1, a3, "Error: invalid custom texture slot.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void C3DProgramHashCodeCreate_cold_1(uint8_t *buf, _QWORD *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "programHashCode->_desc.effectSlotsHash[i] <= ((1 << (kC3DEffectSlotHashIndexMax + 1)) - 1)";
  _os_log_fault_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. effect slot hash out of bounds", buf, 0xCu);
}

void C3DResourceManagerRegistryReleaseContext_cold_1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "retainCount >= 0";
  _os_log_fault_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. C3DResourceManagerRegistryReleaseContext invalid retainCount", (uint8_t *)&v1, 0xCu);
}

void C3DTransactionCheckUncommitted_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Unflushed transaction present.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DTransactionCheckUncommitted_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: Transaction stack contains an uncommited transaction.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DTransactionCheckUncommitted_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: Unflushed transaction present.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DTransactionFlush_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DTransactionCommit_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: C3DTransactionCommit - transaction already committed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DTransactionCommit_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: unexpected transaction commit (missing begin?)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DTransactionCommit_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Error in C3DTransactionPop -> stack empty", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DTransactionTestForDidComplete_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: C3DTransactionRemoveChild - inconsistency", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DTransactionTestForDidComplete_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. C3DTransactionRemoveChild inconsistency", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DTransactionTestForDidComplete_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DTransactionAllowImmediate_cold_1(id *a1, id **a2, NSObject *a3)
{
  id *ObjCWrapper;
  id *v6;
  int v7;
  id *v8;
  __int16 v9;
  id *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  ObjCWrapper = C3DEntityGetObjCWrapper(a1);
  v6 = C3DEntityGetObjCWrapper(*a2);
  v7 = 138412546;
  v8 = ObjCWrapper;
  v9 = 2112;
  v10 = v6;
  _os_log_error_impl(&dword_1DCCB8000, a3, OS_LOG_TYPE_ERROR, "Error: Scene %@ is modified within a rendering callback of another scene (%@). This is not allowed and may lead to crash", (uint8_t *)&v7, 0x16u);
}

void C3DTransactionAnimationDidComplete_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. C3DTransactionAnimationDidComplete inconsistent animation count", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DTransactionAnimationDidInterrupt_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. C3DTransactionAnimationDidInterrupt inconsistent animation count", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DTransactionAddCommandBlock_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DTransactionAddCommandBlock_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void CPP3DAudioContext::Init(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "mainMixerNode";
  _os_log_fault_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Null argument", (uint8_t *)&v1, 0xCu);
}

void CPP3DAudioEngine::GetAVEngine(id *a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(*a1, "description");
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1DCCB8000, a2, OS_LOG_TYPE_ERROR, "Error: Error starting the audio engine: %@", (uint8_t *)&v4, 0xCu);
}

void __appendVerticesAndIndices_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. A mesh should have been allocated by now", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __appendVerticesAndIndices_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Base index should be reset at this point\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __appendVerticesAndIndices_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. basevertex should be 0 here.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __appendVerticesAndIndices_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Only GL_LINES and kC3DManipulatorDrawModeTriangles are supported", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __appendVerticesAndIndices_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: Cannot append manipulator vertex data because we encountered an overflow and we are not allowed to flush", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __createGLInfoIfNeeded_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. No program for the auth env!", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __createGLInfoIfNeeded_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Unreachable code: Unknown use of manipulators", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __createGLInfoIfNeeded_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. There should be at lease a valid C3DRendererContext or a valid SCNRenderer", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __appendRect2D_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. __appendRect2D: no uv but texture", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __appendRect2D_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. __appendRect2D: uv but not texture", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DAuthoringEnvironmentBeginTimedRecord_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Can not nest two Timed record", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __displayRangeTimeRecord_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. start != end", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DAuthoringEnvironmentAppendDebugNodeGeometryCreases_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Found crease element with more than 1 channel", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __createAlphabetTextureIfNeeded_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: Unable to create context", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __AppendArgument_cold_1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1DCCB8000, a2, OS_LOG_TYPE_ERROR, "Unreachable code: Argument type not supported %d", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_5();
}

void __UnifyModifierVaryings_cold_1(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "modifier";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. Null argument", a1);
}

void __InjectAllModifiersIfNeeded_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: cannot handle more than one lighting modifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __InjectModifiers_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: Invalid shader modifier : no code provided", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __InjectModifiers_cold_2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "C3DShaderModifierGetEntryPoint(shaderModifier) == entryPoint";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. wrong entry point", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

void C3DIOCopyURLForInitialURL_cold_1(uint8_t *buf, _QWORD *a2, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *a2 = 0;
  _os_log_error_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_ERROR, "Error: Unable to resolve URL %@", buf, 0xCu);
}

void C3DAvoidOccluderConstraintDelegateCreate_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DAvoidOccluderConstraintDelegateShouldAvoidOccluder_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DGlyphCreate_cold_1()
{
  __assert_rtn("C3DGlyphCreate", "C3DGlyph.c", 44, "shapeParams.cgPath == NULL");
}

void C3DCreateProgram_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, a2, a3, "Error: program failed to build:\n%s\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _create_and_compile_shader_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, a2, a3, "Error: Cannot compile empty shader %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _create_and_compile_shader_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, a2, a3, "Error: failed to link program: %s\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DRasterizerStatesCFFinalize_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. RasterizerStates should be in the registry", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DRasterizerStatesCFFinalize_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Calling C3DRasterizerStatesCFFinalize outside of C3DReleaseRasterizerStates probably direct call to CFRelease", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DRasterizerStatesGetDesc_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DShapeBuildConnectedComponents_cold_1(uint8_t *buf, _QWORD *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "boundaryCount > 1";
  _os_log_fault_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. realloc has an allocation size of 0 bytes", buf, 0xCu);
}

void C3DAppendPointToPath_cold_1()
{
  __assert_rtn("C3DAppendPointToPath", "C3DShapeUtils.c", 443, "origin != C3DShapeVertexOriginCurveStart");
}

void C3DParticleModifier_PhysicsField_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_ERROR, "Error: C3DParticleModifier_PhysicsField - no aether", v1, 2u);
}

void C3DShapeTriangulationGetNewTriangle_cold_1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "triangulation->triangleCount < triangulation->maxTriangleCount";
  _os_log_fault_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Cannot produce any additional triangle.", (uint8_t *)&v1, 0xCu);
}

void C3DShapeTriangulationTriangleContainingPoint_cold_1()
{
  __assert_rtn("C3DShapeTriangulationTriangleContainingPoint", "C3DShapeTriangulation.c", 265, "start");
}

void C3DShapeTriangulationTriangleContainingPoint_cold_2()
{
  __assert_rtn("C3DShapeTriangulationTriangleContainingPoint", "C3DShapeTriangulation.c", 272, "start");
}

void C3DPointFallsOnTriangleEdgeAndLinks_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0_8("C3DLinkIndexFromTriangleToTriangle", "C3DShapeTriangulation.c", a3, "0");
}

void C3DVertexNotSharedByTriangles_cold_1()
{
  __assert_rtn("C3DVertexNotSharedByTriangles", "C3DShapeTriangulation.c", 489, "L");
}

void C3DVertexNotSharedByTriangles_cold_2()
{
  __assert_rtn("C3DVertexNotSharedByTriangles", "C3DShapeTriangulation.c", 490, "K");
}

void C3DVertexNotSharedByTriangles_cold_3()
{
  __assert_rtn("C3DVertexNotSharedByTriangles", "C3DShapeTriangulation.c", 497, "0");
}

void C3DShapeConnectedComponentTriangulatePseudopolygon_cold_1()
{
  __assert_rtn("C3DShapeConnectedComponentTriangulatePseudopolygon", "C3DShapeTriangulation.c", 533, "list->count > 1");
}

void C3DShapeConnectedComponentTriangulatePseudopolygon_cold_2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_ERROR, "Error: C3DShapeConnectedComponentTriangulatePseudopolygon - neighbor index out of bounds", v1, 2u);
}

void C3DShapeTriangulationAddEdge_cold_1()
{
  __assert_rtn("C3DShapeTriangulationAddEdge", "C3DShapeTriangulation.c", 846, "recycledTriangles.count == 0");
}

void C3DSpokeCreate_cold_1()
{
  __assert_rtn("C3DSpokeCreate", "C3DShapeStraightSkeleton.c", 382, "CGPointEqualToPoint(origin, prev) == false");
}

void C3DSpokeCreate_cold_2()
{
  __assert_rtn("C3DSpokeCreate", "C3DShapeStraightSkeleton.c", 383, "CGPointEqualToPoint(origin, next) == false");
}

void C3DSpokeCreate_cold_3()
{
  __assert_rtn("C3DSpokeCreate", "C3DShapeStraightSkeleton.c", 424, "!isnan(spoke.direction.y)");
}

void C3DSpokeCreate_cold_4()
{
  __assert_rtn("C3DSpokeCreate", "C3DShapeStraightSkeleton.c", 423, "!isnan(spoke.direction.x)");
}

void intersectionForSpokeAndSpoke_cold_1()
{
  __assert_rtn("intersectionForSpokeAndSpoke", "C3DShapeStraightSkeleton.c", 445, "fabs(CGPointNorm(spoke1->direction) - 1) < epsilon");
}

void intersectionForSpokeAndSpoke_cold_2()
{
  __assert_rtn("intersectionForSpokeAndSpoke", "C3DShapeStraightSkeleton.c", 446, "fabs(CGPointNorm(spoke2->direction) - 1) < epsilon");
}

void intersectionForSpokeAndEdge_cold_1()
{
  __assert_rtn("intersectionForSpokeAndEdge", "C3DShapeStraightSkeleton.c", 476, "spoke != edgeStart");
}

void intersectionForSpokeAndEdge_cold_2()
{
  __assert_rtn("intersectionForSpokeAndEdge", "C3DShapeStraightSkeleton.c", 477, "spoke != edgeEnd");
}

void splitJoinFace_cold_1()
{
  __assert_rtn("splitJoinFace", "C3DShapeStraightSkeleton.c", 754, "spoke->boundaryOfVerticesIndex != INVALID_INDEX");
}

void splitJoinFace_cold_2()
{
  __assert_rtn("splitJoinFace", "C3DShapeStraightSkeleton.c", 755, "other->boundaryOfVerticesIndex != INVALID_INDEX");
}

void splitJoinFace_cold_3()
{
  __assert_rtn("splitJoinFace", "C3DShapeStraightSkeleton.c", 769, "d != INVALID_INDEX");
}

void splitJoinFace_cold_4()
{
  __assert_rtn("splitJoinFace", "C3DShapeStraightSkeleton.c", 770, "f != INVALID_INDEX");
}

void splitJoinFace_cold_5()
{
  __assert_rtn("splitJoinFace", "C3DShapeStraightSkeleton.c", 749, "event.type == C3DStraightSkeletonEventSplit");
}

void C3DOffsetBuild_cold_1()
{
  __assert_rtn("C3DOffsetBuild", "C3DShapeStraightSkeleton.c", 1026, "newFace.boundaries == NULL");
}

void C3DOffsetBuild_cold_2(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "bestSplitEvents";
  _os_log_fault_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Null argument", (uint8_t *)&v1, 0xCu);
}

void C3DRenderBufferGetSlotForOutputBufferType_cold_1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1DCCB8000, a2, OS_LOG_TYPE_ERROR, "Error: C3DRenderBufferGetSlotForOutputBufferType : unsupported type %d", (uint8_t *)v2, 8u);
}

void __C3DShaderModifierCreate_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __C3DShaderModifierCreate_cold_2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_ERROR, "Error: modifier without code is invalid", v1, 2u);
}

void C3DShaderModifierGetDeclaration_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void SCNCopyValueFromObjCValue_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1DCCB8000, a2, OS_LOG_TYPE_ERROR, "Error: unexpected value (%@)", (uint8_t *)&v2, 0xCu);
}

void SCNCopyValueFromObjCProperty_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_ERROR, "Error: unexpected returned value for property %@ of object %@", (uint8_t *)&v3, 0x16u);
}

void SCNObject_resolveInstanceMethod_cold_1(unsigned __int16 a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1DCCB8000, a2, OS_LOG_TYPE_ERROR, "Error: can't generate implementation for property of type %d", (uint8_t *)v2, 8u);
}

void __analyseUniformDeclaration_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1DCCB8000, a2, OS_LOG_TYPE_ERROR, "Error: syntax error in the uniform declaration : %@", (uint8_t *)&v2, 0xCu);
}

void C3DConstraintControllerInitializeConstraint_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DConstraintApply_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DConstraintApplyIK_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, a1, a3, "Error: C3DConstraintApplyIK root and leaf nodes are the same node", a5, a6, a7, a8, 0);
}

void C3DConstraintApplyIK_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, a1, a3, "Error: C3DConstraintApplyIK leef is not a child of root", a5, a6, a7, a8, 0);
}

void C3DConstraintApplyIK_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DConstraintManagerSetConstraintsForKey_cold_1(uint8_t *buf, _QWORD *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "path";
  _os_log_fault_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Null argument", buf, 0xCu);
}

void C3DModelPathResolveCommonProfileProperty_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: C3DModelPathResolveCommonProfileProperty unknown path %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void C3DModelPathResolveCommonProfileProperty_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: _C3DModelPathResolveCommonProfileTexture unknown path %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _C3DModelPathResolveColor4_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: _C3DModelPathResolveColor4 unknown path %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _C3DModelPathResolveMatrix_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: _C3DModelPathResolveMatrix unknown path %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _C3DModelPathResolveTransform_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: _C3DModelPathResolveTransform unknown path %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _C3DModelPathResolverRegistryResolveSubPath_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: _C3DModelPathResolveVector4 unknown path %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _C3DModelPathResolveVector3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: _C3DModelPathResolveVector3 unknown path %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _C3DModelPathResolverRegistryResolvePathWithClassName_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: _C3DModelPathResolverRegistryResolvePathWithClassName unknown path %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _C3DModelPathResolveEntity_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. _C3DModelPathResolveEntity inconsistent cftype", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DModelPathResolveNode_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: _C3DModelPathResolveNode unknown path %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _C3DModelPathResolveMorph_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: _C3DModelPathResolveMorpher unknown path %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _C3DModelPathResolverRegistryResolveKeyAndSubscriptIndexWithClassName_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Unreachable code: Support for subscript model path is not implemented for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _C3DModelPathResolveMorphKeyAndSubscriptIndex_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0_1(&dword_1DCCB8000, v0, v1, "Error: _C3DModelPathResolveMorpher unknown key subscript %@[%ld]");
  OUTLINED_FUNCTION_1();
}

void _C3DModelPathResolveMorphKeyAndSubscriptKey_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0_1(&dword_1DCCB8000, v0, v1, "Error: _C3DModelPathResolveMorpher unknown key subscript %@[%@]");
  OUTLINED_FUNCTION_1();
}

void C3DModelPathResolverRegisterProperty_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "CFDictionaryGetCountOfKey(_currentClassRegistry, propertyName) == 0";
  v4 = 2112;
  v5 = a1;
  _os_log_fault_impl(&dword_1DCCB8000, a2, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Cannot register twice the same propertyName : %@", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

void C3DModelPathResolverRegisterProperty_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DModelPathResolveRotation_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: _C3DModelPathResolveRotation unknown path %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _C3DModelPathResolveDynamicParameter_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: _C3DModelPathResolveDynamicParameter unknown path %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _C3DModelPathResolveArray_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DModelPathResolveArray_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DModelPathResolveCommonProfile_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: _C3DModelPathResolveCommonProfile unknown path %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void C3DModelTargetGetValue_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void SCNVideoTextureSourceCreateMetalTexture_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, a2, a3, "Error: Invalid pixel buffer pixel format: %s", a5, a6, a7, a8, 2u);
}

void SCNVideoTextureSourceCreateMetalTexture_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1DCCB8000, a2, a3, "Error: CVMetalTextureCacheCreateTextureFromImage failed with status %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void C3DModelValueStorageItemRelease_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DModelValueStorageAddAndRetainModelValue_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DModelValueStorageAddAndRetainModelValue_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DModelValueStorageUpdateModelValueFromPresentationValue_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. C3DModelValueStorageUpdateModelValueFromPresentationValue - unexpected class", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DModelValueStorageGetModelValueForAddressIfAny_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DModelValueStorageUpdateItemModelValueWithValue_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DTransformTreeAddNode_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __C3DTransformTree::add(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. no more handle available", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __C3DTransformTree::remove(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "_handles[ node->_transformHandle ].index >= minIndexToDestroyPerLevel[ l ]";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. Null argument", a1);
}

{
  *(_DWORD *)a1 = 136315138;
  *a2 = "_handles[ node->_transformHandle ].level == l";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. Null argument", a1);
}

{
  *(_DWORD *)a1 = 136315138;
  *a2 = "firstChildToRemainAfterDeletion != INT32_MAX";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. Null argument", a1);
}

{
  *(_DWORD *)a1 = 136315138;
  *a2 = "lastChild.index >= firstChild.index";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. Null argument", a1);
}

{
  *(_DWORD *)a1 = 136315138;
  *a2 = "lastChild.level == firstChild.level";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. Null argument", a1);
}

{
  *(_DWORD *)a1 = 136315138;
  *a2 = "lastChild.index != kC3DTransformIndexInvalid";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. Null argument", a1);
}

{
  *(_DWORD *)a1 = 136315138;
  *a2 = "firstChild.index != kC3DTransformIndexInvalid";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. Null argument", a1);
}

void __C3DTransformTree::remove()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_2_0(&dword_1DCCB8000, v0, v1, "Assertion '%s' failed. invalid handle (%d) given", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __C3DTransformTree::update(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DTransformTreeUpdateCullingHandle_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __C3DTransformTree::_fixupParentAndSiblings(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. child must be one level under parent", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DTransformLevel::moveData(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. overflow !", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. can't move negative number of data", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DTransformLevel::offsetChildIndices(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __C3DTransformTree::_findFirstChildInRange(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void getFloat(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void computeFilterPos(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "end != index - 1";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. Null argument", a1);
}

{
  *(_DWORD *)a1 = 136315138;
  *a2 = "start != index";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. Null argument", a1);
}

void computeFilterPos(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void getCandelaValue(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DIESInfoGenerateTexture2D_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DIESInfoGenerateTexture2D_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DIESInfoGenerateTexture2D_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DIESInfoGenerateTexture2D_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DAnimationEventsAddEvent_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. C3DAnimationEventsAddEvent - index out of bounds", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DAnimationEventsAddEvent_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DAnimationEventsTriggerEventsWithTimeChanges_cold_1(uint8_t *buf, _QWORD *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "index < events->_eventCount";
  _os_log_fault_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. _C3DAnimationEventsTriggerEventAtIndex - index out of bounds", buf, 0xCu);
}

void _C3DAnimationEventsTriggerEventsWithTimeChanges_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. _C3DAnimationEventsTriggerEventsWithTimeChanges invalid time", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __C3DRendererElementStoreDeallocateSpan_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. C3DRendererElementStoreDeallocateSpan - null span", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DRendererElementStoreAllocateSpanForNode_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. RendererElement should not be in span already", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __AllocateSpansAndInitializeRendererElementsForNodeGeometryLOD_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. __AllocateSpansForNodeGeometryLOD unexpected lod count", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DRendererElementStoreDeallocateSpanForNode_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. C3DRendererElementStoreDeallocateSpanForNodeGeometryLOD unexpected lod count", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DRendererElementStoreDeallocateSpanForNode_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DRendererElementStoreGetElementInSpanAtIndex_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. wrong index in rendererElements span", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DIndexStoreGetIndexForKey_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _getNextFreeIndex_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_ERROR, "Error: indexstore::_getNextFreeIndex - no more free index", v1, 2u);
}

void C3DIndexStoreGetOrderedIndexForKey_cold_1(uint8_t *buf, _QWORD *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "alignedIndex >= 0 && alignedIndex < bufferLength";
  _os_log_fault_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. C3DIndexStoreGetOrderedIndexForKey index out of bounds", buf, 0xCu);
}

void C3DAllocatorNew_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DAllocatorDelete_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_ERROR, "Error: C3DAllocatorDelete - unknown address", v1, 2u);
}

void _pipelineDescriptorForPipelineDesc_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_1();
}

void _pipelineDescriptorForPipelineDesc_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_1();
}

void _pipelineDescriptorForPipelineDesc_cold_3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_5(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4_13();
  OUTLINED_FUNCTION_1();
}

void _pipelineDescriptorForPipelineDesc_cold_4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_5(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4_13();
  OUTLINED_FUNCTION_1();
}

void C3DMeshBuildRenderableData_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, a2, a3, "Error: Failed to build renderable data for mesh %p", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void C3DMeshBuildRenderableData_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DMeshBuildRenderableData_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Consistency error: there must be as many renderable elements as original elements", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DMeshBuildRenderableData_cold_5(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_ERROR, "Error: Inconsistent index count after triangulation.", buf, 2u);
}

void C3DMeshBuildRenderableData_cold_6(int a1, NSObject *a2, uint64_t a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 136315394;
  v4 = "__C3DMeshElementCreateRenderablePrimitiveTypeCopy";
  v5 = 1024;
  v6 = a1;
  OUTLINED_FUNCTION_6_6(&dword_1DCCB8000, a2, a3, "Error: %s - Invalid polygon edge count (%u)", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

void C3DMeshBuildRenderableData_cold_7()
{
  os_log_t v0;
  int v1[3];
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_5_3();
  v2 = "__C3DMeshElementCreateRenderablePrimitiveTypeCopy";
  _os_log_fault_impl(&dword_1DCCB8000, v0, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. %s - Cannot create a renderable topology from indexed vertices", (uint8_t *)v1, 0x16u);
  OUTLINED_FUNCTION_1();
}

void __C3DMeshDeindex(unsigned __int8 a1, uint64_t a2, NSObject *a3)
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109376;
  v3[1] = a1;
  v4 = 2048;
  v5 = a2;
  OUTLINED_FUNCTION_6_6(&dword_1DCCB8000, a3, (uint64_t)a3, "Unreachable code: Requested channel (%d) does not exist in element (%p)", (uint8_t *)v3);
  OUTLINED_FUNCTION_1();
}

void __C3DMeshDeindex(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Deindexing failed - Count of deindexed mesh elements does not match count of indexed mesh elements", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Deindexing failed - Count of deindexed mesh sources does not match count of indexed mesh sources", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __C3DMeshDeindex(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "overallVertexIndex == (CFIndex)indexCount";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. Deindexing failed - Vertex count inconsistency", a1);
}

{
  *(_DWORD *)a1 = 136315138;
  *a2 = "value == sourceInfo.dataVectorCount";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. Deindexer failed - Hash value inconsistency", a1);
}

void __writeIndexInBuffer()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_7_5();
  OUTLINED_FUNCTION_3_8(&dword_1DCCB8000, v0, v1, "Assertion '%s' failed. %s - unsupported index size (%ld)", v2, v3, v4, v5, 2u);
}

void __C3DMeshDeindexerKeyComparator::operator()(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Two elements in the same mesh do not have the same number of index channels", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __readIndexInBuffer()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_7_5();
  OUTLINED_FUNCTION_3_8(&dword_1DCCB8000, v0, v1, "Assertion '%s' failed. %s - unsupported index size (%ld)", v2, v3, v4, v5, 2u);
}

void C3D::ConvertCubeComputePass::compile(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "computeFunction";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", (uint8_t *)&v3);
}

void C3DAnimatableParamControllerGetParamDescription_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. C3DAnimatableParamControllerGetParamDescription - address out of bounds", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _C3DAnimatableParamControllerSetValue_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __allocateChunk()
{
  __assert_rtn("__allocateChunk", "C3DStackAllocator.cpp", 38, "chunk");
}

{
  __assert_rtn("__allocateChunk", "C3DStackAllocator.cpp", 39, "n");
}

{
  __assert_rtn("__allocateChunk", "C3DStackAllocator.cpp", 43, "chunk->data");
}

void C3DStackAllocatorAllocateAligned_cold_1()
{
  __assert_rtn("C3DStackAllocatorAllocateAligned", "C3DStackAllocator.cpp", 149, "allocator->_currentChunck");
}

void C3DStackAllocatorAllocateAligned_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. You have to push frames before allocating memory.", a5, a6, a7, a8, 2u);
}

void C3DStackAllocatorPushFrame_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_ERROR, "Unreachable code: C3DStackAllocator: Max Restore Points reached!!!!", v1, 2u);
}

void C3DStackAllocatorPopFrame_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. C3DStackAllocator: You cannot pop frames without pushing first.", a5, a6, a7, a8, 2u);
}

void C3DCullingContextForcePushGeometryRenderableElementsToVisible_cold_2(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "sequence->count + count <= sequence->allocatedCount";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. Not enough space allocated", a1);
}

void __shouldPushRenderableElementsToVisible_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, a1, a3, "Error: technique should not be null", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void C3DCullingContextSetupLOD_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Invalid point of view", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DCullingContextSetupPointOfViewMatrices_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, a1, a3, "Unreachable code: Unsupported configuration", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void C3DCullingContextSetupCullingMatricesAndPlanes_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Multiple viewport is for stero only", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DCullingContextInitialize_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DCullingContextInitialize_cold_3(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "passInstance->_cullingData[eye] == NULL";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. leaking culling data", a1);
}

void C3DFXMetalProgramUpdateHashWithCommonProfileHashCode_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DFXMetalProgramGetHash_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. program is of wrong type", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __updateRequireLighting_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DFXPassSetupWithPropertyList_cold_1(os_log_t log)
{
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 67109120;
  v1[1] = 4;
  _os_log_error_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_ERROR, "Error: too many blend states: max render target is %d", (uint8_t *)v1, 8u);
}

void C3DFXPassSetupWithPropertyList_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: unknown cull mode named %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _depthFuncNameToDepthFunc_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: unknown depth comparison function named %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _parseTargets_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: _bufferTypeFromName - unknown output type: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void C3DFXPassAddInputWithName_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DFXPassInitialize_cold_1(uint8_t *buf, _QWORD *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "input->_semantic != kC3DFXSemanticNone";
  _os_log_fault_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. attributes should have a semantic", buf, 0xCu);
}

void C3DFXPassInitialize_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DFXPassInitialize_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Unsuported shading language", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DFXPassInitialize_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: failed to load program %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void C3DFXPassInitialize_cold_5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Sub technique should only have 1 pass", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DFXPassInitialize_cold_6(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 56);
  v2 = *(_QWORD *)(*(_QWORD *)a1 + 64);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = v2;
  _os_log_error_impl(&dword_1DCCB8000, a2, OS_LOG_TYPE_ERROR, "Error: failed to load program %@ %@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_1();
}

void C3DFXPassInitialize_cold_7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. C3DFXPassInitialize pass is already initialized", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DFXPassAddInputsWithDescription_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. unexpected error in C3DFXPassSetInputs", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _convertInputsDescriptionToInputs_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DFXPassAddOutputsWithDescription_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. unexpected error in C3DFXPassSetOutput", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _convertOutputsDescriptionToOutputs_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: _convertOutputsDescriptionToOutputs - unknown output type: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __RendererElementWillDie_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _blendFactorFromString_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: unknown blend factor named %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _blendOpFromString_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: unknown blend op named %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _setupInput_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: description for input named %@ is missing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _setupInput_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: 'type' is required for symbol %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _setupInput_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. pass:_setupInput unexpected type", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DBlendFactorToString_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. bad blend mode", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DBlendOpToString_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. bad blend operation", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DBlendStatesGetDesc_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. wrong target index", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DBlendStatesGetDesc_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _updateMatrix_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. _updateMatrix - already valid", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _updateMatrix_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. _updateMatrix - no valid rep", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _updateAffine_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. _updateAffine - already valid", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _updateAffine_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. _updateAffine - no valid rep", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _updateAffineScale_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. _updateAffineScale - already valid", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _updateAffineScale_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. _updateAffineScale - no valid rep", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DTransformSetScale_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. _updateAffineRotation - already valid", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DTransformSetScale_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. _updateAffineRotation - no valid rep", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DTransformGetValue_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, a1, a3, "Error: C3DTransformGetValue - unexpected semantic", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void C3DTransformGetValue_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. C3DTransformGetValue offset out of bounds", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __setQuaternionValue_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_6(&dword_1DCCB8000, v0, v1, "Error: C3DTransformSetValue unexptected component index %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __setQuaternionValue_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. C3DTransformSetValue unexpected size", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __setValueError_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, a1, a3, "Error: C3DTransformSetValue - unexpected semantic", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void C3DTransformSetValue_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. C3DTransformSetValue offset out of bounds", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void ____arrayOfC3DModifiersFromDictionary_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: ShaderModifiers - unkwnown entrypoint '%@'", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void C3DArrayGetCount_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DArrayGetValuePtrAtIndex_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. index out of bounds", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void CATextTruncationModeFromC3DTextTruncationMode_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, a1, a3, "Unreachable code: CATextAlignmentModeFromC3DTextAlignmentMode unknown mode", a5, a6, a7, a8, 0);
}

void __AddToFreeList_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __AddToFreeList_cold_2(uint8_t *buf, _QWORD *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "(freeSpan->start.index + freeSpan->count) <= page->capacity";
  _os_log_fault_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. page overflow", buf, 0xCu);
}

void __AddToFreeList_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. cannot remove null span", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __AllocateNewSpanInPage_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. page overflow", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __AllocateNewSpanInPage_cold_3(int a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "spanSize <= page->freeMaxSpan";
  v4 = 1024;
  v5 = a1;
  _os_log_fault_impl(&dword_1DCCB8000, a2, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. wrong page selected for span size %d", (uint8_t *)&v2, 0x12u);
  OUTLINED_FUNCTION_1();
}

void __AllocateNewSpan_cold_1(os_log_t log)
{
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 67109120;
  v1[1] = 0x10000;
  _os_log_error_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_ERROR, "Error: RendererElementStore does not support span of more than %d", (uint8_t *)v1, 8u);
}

void __DeallocateSpan_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. pages are broken...", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DSpanAllocatorGetElementInSpanAtIndex_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. re is broken...", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DSpanAllocatorGetElementInSpanAtIndex_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. handle is broken...", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void fillPositions(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "vertexCount == CFIndex(baseMesh.pointCount())";
  _os_log_fault_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Morph target has a vertex count different from the base geometry", (uint8_t *)&v1, 0xCu);
}

void AnimCodec::Mesh<float>::point()
{
  __assert_rtn("point", "Mesh.h", 461, "index < pointCount()");
}

void fillMesh()
{
  __assert_rtn("setPoint", "Mesh.h", 468, "index < pointCount()");
}

void ___Z8fillMeshRN9AnimCodec4MeshIfEEP9__C3DMesh_block_invoke_2_cold_1()
{
  __assert_rtn("setIndex", "Mesh.h", 397, "i < indexCount()");
}

void ___Z8fillMeshRN9AnimCodec4MeshIfEEP9__C3DMesh_block_invoke_2_cold_2()
{
  __assert_rtn("setPolygonSize", "Mesh.h", 393, "j < polygonCount()");
}

void SCNEncodeMorpherUsingAnimCodec_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: AnimCodec - Failed to compress mesh", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void SCNDecodeMorpherUsingAnimCodec_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: AnimCodec - Can't decode metadata", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void SCNDecodeMorpherUsingAnimCodec_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: AnimCodec - Failed to decompress animation", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void SCNDecodeMorpherUsingAnimCodec_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: AnimCodec - Failed to parse header", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void C3DShapeGeometryValidate_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DShapeGeometryValidate_cold_2()
{
  __assert_rtn("C3DShapeGeometryValidate", "C3DShapeGeometry.m", 173, "CFGetTypeID(geometry) == C3DShapeGeometryGetTypeID()");
}

void C3DShapeGeometryGetChamferMode_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DShapeGeometryMeshForBoundingBox_cold_1()
{
  __assert_rtn("C3DShapeGeometryMeshForBoundingBox", "C3DShapeGeometry.m", 905, "CFGetTypeID(geometry) == C3DShapeGeometryGetTypeID()");
}

void C3DShapeGeometryGetBoundingBox_cold_1()
{
  __assert_rtn("C3DShapeGeometryGetBoundingBox", "C3DShapeGeometry.m", 926, "CFGetTypeID(geometry) == C3DShapeGeometryGetTypeID()");
}

void C3DShapeGeometryGetBoundingSphere_cold_1()
{
  __assert_rtn("C3DShapeGeometryGetBoundingSphere", "C3DShapeGeometry.m", 932, "CFGetTypeID(geometry) == C3DShapeGeometryGetTypeID()");
}

void C3D::SmartPtr<SCNMTLMesh *,C3D::detail::NSRetainFct,C3D::detail::NSReleaseFct>::operator SCNMTLMesh *(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Dereferencing null pointer", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void C3DShaderAddStandardUniform_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "CFDictionaryGetValue(dic, uniformName) == NULL";
  v4 = 2112;
  v5 = a1;
  _os_log_fault_impl(&dword_1DCCB8000, a2, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. uniform %@ already set", (uint8_t *)&v2, 0x16u);
}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x1E0CD2388]();
  return result;
}

CATransform3D *__cdecl CATransform3DConcat(CATransform3D *__return_ptr retstr, CATransform3D *a, CATransform3D *b)
{
  return (CATransform3D *)MEMORY[0x1E0CD25F0](retstr, a, b);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x1E0CD2640](retstr, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DMakeTranslation(CATransform3D *__return_ptr retstr, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x1E0CD2648](retstr, tx, ty, tz);
}

unsigned __int8 *__cdecl CC_MD5(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80308](data, *(_QWORD *)&len, md);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1E0C80370](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1E0C80378](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80380](c, data, *(_QWORD *)&len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
  MEMORY[0x1E0C97CE8](theArray, otherArray, otherRange.location, otherRange.length);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
  MEMORY[0x1E0C97D00](theArray, range.location, range.length, applier, context);
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1E0C97D10](theArray, range.location, range.length, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1E0C97D20](allocator, values, numValues, callBacks);
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x1E0C97D30](allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D50](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1E0C97D78](theArray, range.location, range.length, value);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1E0C97D90]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

void CFArrayGetValues(CFArrayRef theArray, CFRange range, const void **values)
{
  MEMORY[0x1E0C97DA8](theArray, range.location, range.length, values);
}

void CFArrayInsertValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
  MEMORY[0x1E0C97DB0](theArray, idx, value);
}

void CFArrayRemoveAllValues(CFMutableArrayRef theArray)
{
  MEMORY[0x1E0C97DB8](theArray);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
  MEMORY[0x1E0C97DC0](theArray, idx);
}

void CFArrayReplaceValues(CFMutableArrayRef theArray, CFRange range, const void **newValues, CFIndex newCount)
{
  MEMORY[0x1E0C97DC8](theArray, range.location, range.length, newValues, newCount);
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
  MEMORY[0x1E0C97DD0](theArray, idx, value);
}

void CFArraySortValues(CFMutableArrayRef theArray, CFRange range, CFComparatorFunction comparator, void *context)
{
  MEMORY[0x1E0C97DE0](theArray, range.location, range.length, comparator, context);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1E0C97E90](arg);
}

void CFBagAddValue(CFMutableBagRef theBag, const void *value)
{
  MEMORY[0x1E0C97E98](theBag, value);
}

CFMutableBagRef CFBagCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFBagCallBacks *callBacks)
{
  return (CFMutableBagRef)MEMORY[0x1E0C97EB8](allocator, capacity, callBacks);
}

CFIndex CFBagGetCountOfValue(CFBagRef theBag, const void *value)
{
  return MEMORY[0x1E0C97ED0](theBag, value);
}

void CFBagRemoveValue(CFMutableBagRef theBag, const void *value)
{
  MEMORY[0x1E0C97EF8](theBag, value);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

CFURLRef CFBundleCopyBundleURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x1E0C98000](bundle);
}

CFStringRef CFBundleCopyLocalizedString(CFBundleRef bundle, CFStringRef key, CFStringRef value, CFStringRef tableName)
{
  return (CFStringRef)MEMORY[0x1E0C98050](bundle, key, value, tableName);
}

CFURLRef CFBundleCopyResourceURL(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFURLRef)MEMORY[0x1E0C98080](bundle, resourceName, resourceType, subDirName);
}

CFBundleRef CFBundleGetBundleWithIdentifier(CFStringRef bundleID)
{
  return (CFBundleRef)MEMORY[0x1E0C980E8](bundleID);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1E0C98120](bundle);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x1E0C98150]();
}

void CFBundleGetPackageInfo(CFBundleRef bundle, UInt32 *packageType, UInt32 *packageCreator)
{
  MEMORY[0x1E0C98158](bundle, packageType, packageCreator);
}

CFCharacterSetRef CFCharacterSetGetPredefined(CFCharacterSetPredefinedSet theSetIdentifier)
{
  return (CFCharacterSetRef)MEMORY[0x1E0C982F0](theSetIdentifier);
}

Boolean CFCharacterSetIsCharacterMember(CFCharacterSetRef theSet, UniChar theChar)
{
  return MEMORY[0x1E0C98320](theSet, theChar);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x1E0C98350](cf);
}

uint64_t CFCopySearchPathForDirectoriesInDomains()
{
  return MEMORY[0x1E0C98370]();
}

CFStringRef CFCopyTypeIDDescription(CFTypeID type_id)
{
  return (CFStringRef)MEMORY[0x1E0C98380](type_id);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
  MEMORY[0x1E0C98390](theData, bytes, length);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1E0C983A0](allocator, bytes, length);
}

CFDataRef CFDataCreateCopy(CFAllocatorRef allocator, CFDataRef theData)
{
  return (CFDataRef)MEMORY[0x1E0C983B0](allocator, theData);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1E0C983B8](allocator, capacity);
}

CFMutableDataRef CFDataCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDataRef theData)
{
  return (CFMutableDataRef)MEMORY[0x1E0C983C0](allocator, capacity, theData);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x1E0C983C8](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
  MEMORY[0x1E0C983F0](theData, range.location, range.length, buffer);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x1E0C98408](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1E0C98418]();
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
  MEMORY[0x1E0C98430](theData, length);
}

CFTypeID CFDateGetTypeID(void)
{
  return MEMORY[0x1E0C984E8]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98500](theDict, key, value);
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
  MEMORY[0x1E0C98508](theDict, applier, context);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x1E0C98518](theDict, key);
}

Boolean CFDictionaryContainsValue(CFDictionaryRef theDict, const void *value)
{
  return MEMORY[0x1E0C98520](theDict, value);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98530](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98538](allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98558](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1E0C98570](theDict);
}

CFIndex CFDictionaryGetCountOfKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x1E0C98578](theDict, key);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
  MEMORY[0x1E0C985A0](theDict, keys, values);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1E0C985A8]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x1E0C985C8](theDict, key, value);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
  MEMORY[0x1E0C985D8](theDict);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x1E0C985E8](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFStringRef CFErrorCopyRecoverySuggestion(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x1E0C98640](err);
}

CFDictionaryRef CFErrorCopyUserInfo(CFErrorRef err)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98648](err);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x1E0C98650](allocator, domain, code, userInfo);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x1E0C98660](err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return (CFErrorDomain)MEMORY[0x1E0C98670](err);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x1E0C98718](cf);
}

CFIndex CFGetRetainCount(CFTypeRef cf)
{
  return MEMORY[0x1E0C98720](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x1E0C98758](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988D0]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x1E0C988E0](center, name, object, userInfo, deliverImmediately);
}

void CFNotificationCenterPostNotificationWithOptions(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, CFOptionFlags options)
{
  MEMORY[0x1E0C988E8](center, name, object, userInfo, options);
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x1E0C98900](center, observer, name, object);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1E0C98928](allocator, theType, valuePtr);
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return MEMORY[0x1E0C989A8](number);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1E0C98AA0](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98AD0](allocator, data, options, format, error);
}

CFIndex CFPropertyListWrite(CFPropertyListRef propertyList, CFWriteStreamRef stream, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return MEMORY[0x1E0C98AF8](propertyList, stream, format, options, error);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
  MEMORY[0x1E0C98B10](stream);
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFReadStreamRef)MEMORY[0x1E0C98B48](alloc, fileURL);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x1E0C98B80](stream);
}

CFIndex CFReadStreamRead(CFReadStreamRef stream, UInt8 *buffer, CFIndex bufferLength)
{
  return MEMORY[0x1E0C98B88](stream, buffer, bufferLength);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

void CFRunLoopAddObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98BE8](rl, observer, mode);
}

CFRunLoopMode CFRunLoopCopyCurrentMode(CFRunLoopRef rl)
{
  return (CFRunLoopMode)MEMORY[0x1E0C98C28](rl);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C30]();
}

CFRunLoopObserverRef CFRunLoopObserverCreate(CFAllocatorRef allocator, CFOptionFlags activities, Boolean repeats, CFIndex order, CFRunLoopObserverCallBack callout, CFRunLoopObserverContext *context)
{
  return (CFRunLoopObserverRef)MEMORY[0x1E0C98C60](allocator, activities, repeats, order, callout, context);
}

void CFRunLoopObserverInvalidate(CFRunLoopObserverRef observer)
{
  MEMORY[0x1E0C98C78](observer);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x1E0C98D70](theSet, value);
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
  MEMORY[0x1E0C98D78](theSet, applier, context);
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x1E0C98D80](theSet, value);
}

CFSetRef CFSetCreateCopy(CFAllocatorRef allocator, CFSetRef theSet)
{
  return (CFSetRef)MEMORY[0x1E0C98D90](allocator, theSet);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x1E0C98D98](allocator, capacity, callBacks);
}

CFMutableSetRef CFSetCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFSetRef theSet)
{
  return (CFMutableSetRef)MEMORY[0x1E0C98DA0](allocator, capacity, theSet);
}

CFIndex CFSetGetCount(CFSetRef theSet)
{
  return MEMORY[0x1E0C98DA8](theSet);
}

const void *__cdecl CFSetGetValue(CFSetRef theSet, const void *value)
{
  return (const void *)MEMORY[0x1E0C98DC0](theSet, value);
}

void CFSetRemoveAllValues(CFMutableSetRef theSet)
{
  MEMORY[0x1E0C98DD8](theSet);
}

void CFSetRemoveValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x1E0C98DE0](theSet, value);
}

void CFSetSetValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x1E0C98DF0](theSet, value);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x1E0C98ED8](theString, appendedString);
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  MEMORY[0x1E0C98EF0](theString, formatOptions, format);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

CFComparisonResult CFStringCompareWithOptions(CFStringRef theString1, CFStringRef theString2, CFRange rangeToCompare, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F18](theString1, theString2, rangeToCompare.location, rangeToCompare.length, compareOptions);
}

CFArrayRef CFStringCreateArrayBySeparatingStrings(CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return (CFArrayRef)MEMORY[0x1E0C98F58](alloc, theString, separatorString);
}

CFStringRef CFStringCreateByCombiningStrings(CFAllocatorRef alloc, CFArrayRef theArray, CFStringRef separatorString)
{
  return (CFStringRef)MEMORY[0x1E0C98F68](alloc, theArray, separatorString);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x1E0C98F78](alloc, theString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F90](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F98](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1E0C98FB8](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98FD0](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1E0C98FE0](alloc, cStr, *(_QWORD *)&encoding, contentsDeallocator);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1E0C99018](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x1E0C99030](alloc, str, range.location, range.length);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3;
  CFIndex v4;
  CFRange result;

  v3 = MEMORY[0x1E0C99050](theString, stringToFind, compareOptions);
  result.length = v4;
  result.location = v3;
  return result;
}

CFIndex CFStringFindAndReplace(CFMutableStringRef theString, CFStringRef stringToFind, CFStringRef replacementString, CFRange rangeToSearch, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C99058](theString, stringToFind, replacementString, rangeToSearch.location, rangeToSearch.length, compareOptions);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x1E0C99080](theString, range.location, range.length, *(_QWORD *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99098](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1E0C990A0](theString, *(_QWORD *)&encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x1E0C990B0](theString, idx);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
  MEMORY[0x1E0C990C0](theString, range.location, range.length, buffer);
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x1E0C990C8](theString);
}

double CFStringGetDoubleValue(CFStringRef str)
{
  double result;

  MEMORY[0x1E0C990D0](str);
  return result;
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x1E0C990F0](str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99118](length, *(_QWORD *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x1E0C99180](theString, prefix);
}

void CFStringLowercase(CFMutableStringRef theString, CFLocaleRef locale)
{
  MEMORY[0x1E0C991D0](theString, locale);
}

void CFStringReplace(CFMutableStringRef theString, CFRange range, CFStringRef replacement)
{
  MEMORY[0x1E0C991F0](theString, range.location, range.length, replacement);
}

void CFStringReplaceAll(CFMutableStringRef theString, CFStringRef replacement)
{
  MEMORY[0x1E0C991F8](theString, replacement);
}

void CFStringTrimWhitespace(CFMutableStringRef theString)
{
  MEMORY[0x1E0C99258](theString);
}

void CFStringUppercase(CFMutableStringRef theString, CFLocaleRef locale)
{
  MEMORY[0x1E0C99260](theString, locale);
}

CFURLRef CFURLCopyAbsoluteURL(CFURLRef relativeURL)
{
  return (CFURLRef)MEMORY[0x1E0C992C8](relativeURL);
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x1E0C992D8](anURL, pathStyle);
}

CFStringRef CFURLCopyLastPathComponent(CFURLRef url)
{
  return (CFStringRef)MEMORY[0x1E0C992F8](url);
}

CFStringRef CFURLCopyPath(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1E0C99318](anURL);
}

CFStringRef CFURLCopyPathExtension(CFURLRef url)
{
  return (CFStringRef)MEMORY[0x1E0C99320](url);
}

CFStringRef CFURLCopyScheme(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1E0C99348](anURL);
}

CFStringRef CFURLCopyStrictPath(CFURLRef anURL, Boolean *isAbsolute)
{
  return (CFStringRef)MEMORY[0x1E0C99350](anURL, isAbsolute);
}

CFURLRef CFURLCreateCopyAppendingPathComponent(CFAllocatorRef allocator, CFURLRef url, CFStringRef pathComponent, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1E0C99380](allocator, url, pathComponent, isDirectory);
}

CFURLRef CFURLCreateCopyAppendingPathExtension(CFAllocatorRef allocator, CFURLRef url, CFStringRef extension)
{
  return (CFURLRef)MEMORY[0x1E0C99388](allocator, url, extension);
}

CFURLRef CFURLCreateCopyDeletingLastPathComponent(CFAllocatorRef allocator, CFURLRef url)
{
  return (CFURLRef)MEMORY[0x1E0C99390](allocator, url);
}

CFURLRef CFURLCreateCopyDeletingPathExtension(CFAllocatorRef allocator, CFURLRef url)
{
  return (CFURLRef)MEMORY[0x1E0C99398](allocator, url);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1E0C99420](allocator, filePath, pathStyle, isDirectory);
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x1E0C99448](allocator, URLString, baseURL);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x1E0C99490](url, resolveAgainstBase, buffer, maxBufLen);
}

CFStringRef CFURLGetString(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1E0C994A0](anURL);
}

CFTypeID CFURLGetTypeID(void)
{
  return MEMORY[0x1E0C994B8]();
}

Boolean CFURLHasDirectoryPath(CFURLRef anURL)
{
  return MEMORY[0x1E0C994C0](anURL);
}

void CFWriteStreamClose(CFWriteStreamRef stream)
{
  MEMORY[0x1E0C99600](stream);
}

CFTypeRef CFWriteStreamCopyProperty(CFWriteStreamRef stream, CFStreamPropertyKey propertyName)
{
  return (CFTypeRef)MEMORY[0x1E0C99610](stream, propertyName);
}

CFWriteStreamRef CFWriteStreamCreateWithAllocatedBuffers(CFAllocatorRef alloc, CFAllocatorRef bufferAllocator)
{
  return (CFWriteStreamRef)MEMORY[0x1E0C99620](alloc, bufferAllocator);
}

CFWriteStreamRef CFWriteStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFWriteStreamRef)MEMORY[0x1E0C99630](alloc, fileURL);
}

Boolean CFWriteStreamOpen(CFWriteStreamRef stream)
{
  return MEMORY[0x1E0C99650](stream);
}

BOOL CGAffineTransformEqualToTransform(CGAffineTransform *t1, CGAffineTransform *t2)
{
  return MEMORY[0x1E0C9BAA0](t1, t2);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1E0C9BB10](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1E0C9BB20](context);
}

CGBitmapInfo CGBitmapContextGetBitmapInfo(CGContextRef context)
{
  return MEMORY[0x1E0C9BB48](context);
}

size_t CGBitmapContextGetBitsPerComponent(CGContextRef context)
{
  return MEMORY[0x1E0C9BB50](context);
}

size_t CGBitmapContextGetBitsPerPixel(CGContextRef context)
{
  return MEMORY[0x1E0C9BB58](context);
}

size_t CGBitmapContextGetBytesPerRow(CGContextRef context)
{
  return MEMORY[0x1E0C9BB60](context);
}

CGColorSpaceRef CGBitmapContextGetColorSpace(CGContextRef context)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BB68](context);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return (void *)MEMORY[0x1E0C9BB70](context);
}

size_t CGBitmapContextGetHeight(CGContextRef context)
{
  return MEMORY[0x1E0C9BB78](context);
}

size_t CGBitmapContextGetWidth(CGContextRef context)
{
  return MEMORY[0x1E0C9BB80](context);
}

CGColorConversionInfoRef CGColorConversionInfoCreateFromList(CFDictionaryRef options, CGColorSpaceRef a2, CGColorConversionInfoTransformType a3, CGColorRenderingIntent a4, ...)
{
  return (CGColorConversionInfoRef)MEMORY[0x1E0C9BC50](options, a2, *(_QWORD *)&a3, *(_QWORD *)&a4);
}

uint64_t CGColorConversionInfoIterateFunctionsWithCallbacks()
{
  return MEMORY[0x1E0C9BC70]();
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1E0C9BC78](space, components);
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BD00](color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x1E0C9BD08](color);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x1E0C9BD20](color);
}

CFTypeID CGColorGetTypeID(void)
{
  return MEMORY[0x1E0C9BD38]();
}

uint64_t CGColorMatrixGetMatrix()
{
  return MEMORY[0x1E0C9BD40]();
}

void CGColorRelease(CGColorRef color)
{
  MEMORY[0x1E0C9BD60](color);
}

CGColorRef CGColorRetain(CGColorRef color)
{
  return (CGColorRef)MEMORY[0x1E0C9BD68](color);
}

CFPropertyListRef CGColorSpaceCopyPropertyList(CGColorSpaceRef space)
{
  return (CFPropertyListRef)MEMORY[0x1E0C9BDC0](space);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDF0]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BE50](name);
}

CGColorSpaceRef CGColorSpaceCreateWithPropertyList(CFPropertyListRef plist)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BE60](plist);
}

uint64_t CGColorSpaceEqualToColorSpaceIgnoringRange()
{
  return MEMORY[0x1E0C9BE70]();
}

CGColorSpaceRef CGColorSpaceGetBaseColorSpace(CGColorSpaceRef space)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BE80](space);
}

size_t CGColorSpaceGetNumberOfComponents(CGColorSpaceRef space)
{
  return MEMORY[0x1E0C9BED8](space);
}

BOOL CGColorSpaceIsWideGamutRGB(CGColorSpaceRef a1)
{
  return MEMORY[0x1E0C9BF28](a1);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x1E0C9BF30](space);
}

uint64_t CGColorTRCGetFunction()
{
  return MEMORY[0x1E0C9BF58]();
}

uint64_t CGColorTRCGetGammaID()
{
  return MEMORY[0x1E0C9BF60]();
}

uint64_t CGColorTransformConvertColor()
{
  return MEMORY[0x1E0C9BF78]();
}

uint64_t CGColorTransformConvertColorComponents()
{
  return MEMORY[0x1E0C9BF80]();
}

uint64_t CGColorTransformConvertData()
{
  return MEMORY[0x1E0C9BF88]();
}

uint64_t CGColorTransformCreate()
{
  return MEMORY[0x1E0C9BF90]();
}

uint64_t CGColorTransformGetColorSpace()
{
  return MEMORY[0x1E0C9BF98]();
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C020](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x1E0C9C170](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C220](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextFlush(CGContextRef c)
{
  MEMORY[0x1E0C9C230](c);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x1E0C9C340](c);
}

CGContextRef CGContextRetain(CGContextRef c)
{
  return (CGContextRef)MEMORY[0x1E0C9C378](c);
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
  MEMORY[0x1E0C9C390](c, sx, sy);
}

void CGContextSetFillColor(CGContextRef c, const CGFloat *components)
{
  MEMORY[0x1E0C9C3F8](c, components);
}

void CGContextSetFillColorSpace(CGContextRef c, CGColorSpaceRef space)
{
  MEMORY[0x1E0C9C400](c, space);
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x1E0C9C408](c, color);
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
  MEMORY[0x1E0C9C458](c, *(_QWORD *)&quality);
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
  MEMORY[0x1E0C9C588](c, tx, ty);
}

CGDataProviderRef CGDataProviderCreateWithData(void *info, const void *data, size_t size, CGDataProviderReleaseDataCallback releaseData)
{
  return (CGDataProviderRef)MEMORY[0x1E0C9C600](info, data, size, releaseData);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
  MEMORY[0x1E0C9C638](provider);
}

CFStringRef CGFontCopyFullName(CGFontRef font)
{
  return (CFStringRef)MEMORY[0x1E0C9C6E0](font);
}

CFStringRef CGFontCopyGlyphNameForGlyph(CGFontRef font, CGGlyph glyph)
{
  return (CFStringRef)MEMORY[0x1E0C9C6E8](font, glyph);
}

void CGFontRelease(CGFontRef font)
{
  MEMORY[0x1E0C9C8E0](font);
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x1E0C9CB80](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(_QWORD *)&bitmapInfo, provider);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
  MEMORY[0x1E0CBC308](idst, image, properties);
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1E0CBC348](url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1E0CBC358](idst);
}

CGImageAlphaInfo CGImageGetAlphaInfo(CGImageRef image)
{
  return MEMORY[0x1E0C9CBE8](image);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x1E0C9CBF0](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9CC20](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1E0C9CC60](image);
}

CFTypeID CGImageGetTypeID(void)
{
  return MEMORY[0x1E0C9CCC0]();
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1E0C9CCD0](image);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x1E0C9CDA0](image);
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x1E0C9CDA8](image);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x1E0CBC530](isrc, index, options);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1E0CBC568](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC590](data, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC5C0](url, options);
}

CGImageSourceStatus CGImageSourceGetStatusAtIndex(CGImageSourceRef isrc, size_t index)
{
  return MEMORY[0x1E0CBC608](isrc, index);
}

CFStringRef CGImageSourceGetType(CGImageSourceRef isrc)
{
  return (CFStringRef)MEMORY[0x1E0CBC618](isrc);
}

void CGPathAddArcToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x1, CGFloat y1, CGFloat x2, CGFloat y2, CGFloat radius)
{
  MEMORY[0x1E0C9D288](path, m, x1, y1, x2, y2, radius);
}

void CGPathAddCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cp1x, CGFloat cp1y, CGFloat cp2x, CGFloat cp2y, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9D298](path, m, cp1x, cp1y, cp2x, cp2y, x, y);
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9D2A8](path, m, x, y);
}

void CGPathAddQuadCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cpx, CGFloat cpy, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9D2C0](path, m, cpx, cpy, x, y);
}

void CGPathAddRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
  MEMORY[0x1E0C9D2C8](path, m, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGPathApply(CGPathRef path, void *info, CGPathApplierFunction function)
{
  MEMORY[0x1E0C9D2E8](path, info, function);
}

void CGPathApplyWithBlock(CGPathRef path, CGPathApplyBlock block)
{
  MEMORY[0x1E0C9D300](path, block);
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
  MEMORY[0x1E0C9D310](path);
}

CGPathRef CGPathCreateCopy(CGPathRef path)
{
  return (CGPathRef)MEMORY[0x1E0C9D320](path);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x1E0C9D388]();
}

CGRect CGPathGetBoundingBox(CGPathRef path)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x1E0C9D3F0](path);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9D490](path, m, x, y);
}

void CGPathRelease(CGPathRef path)
{
  MEMORY[0x1E0C9D498](path);
}

CGPathRef CGPathRetain(CGPathRef path)
{
  return (CGPathRef)MEMORY[0x1E0C9D4A0](path);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1E0C9D550]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D570]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D588]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0C9D5E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D600]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1E0C9D608]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CVImageBufferRef CMSampleBufferGetImageBuffer(CMSampleBufferRef sbuf)
{
  return (CVImageBufferRef)MEMORY[0x1E0C9EFD8](sbuf);
}

uint64_t CSIsNull()
{
  return MEMORY[0x1E0D19FB8]();
}

uint64_t CSRelease()
{
  return MEMORY[0x1E0D1A018]();
}

uint64_t CSSymbolGetRange()
{
  return MEMORY[0x1E0D1A090]();
}

uint64_t CSSymbolicatorCreateWithPid()
{
  return MEMORY[0x1E0D1A228]();
}

uint64_t CSSymbolicatorForeachSymbolWithMangledNameAtTime()
{
  return MEMORY[0x1E0D1A298]();
}

uint64_t CSSymbolicatorGetTask()
{
  return MEMORY[0x1E0D1A368]();
}

CGFontRef CTFontCopyGraphicsFont(CTFontRef font, CTFontDescriptorRef *attributes)
{
  return (CGFontRef)MEMORY[0x1E0CA79C8](font, attributes);
}

CGPathRef CTFontCreatePathForGlyph(CTFontRef font, CGGlyph glyph, const CGAffineTransform *matrix)
{
  return (CGPathRef)MEMORY[0x1E0CA7A60](font, glyph, matrix);
}

void CTFontDrawGlyphs(CTFontRef font, const CGGlyph *glyphs, const CGPoint *positions, size_t count, CGContextRef context)
{
  MEMORY[0x1E0CA7B70](font, glyphs, positions, count, context);
}

double CTFontGetAdvancesForGlyphs(CTFontRef font, CTFontOrientation orientation, const CGGlyph *glyphs, CGSize *advances, CFIndex count)
{
  double result;

  MEMORY[0x1E0CA7B98](font, *(_QWORD *)&orientation, glyphs, advances, count);
  return result;
}

CGFloat CTFontGetAscent(CTFontRef font)
{
  CGFloat result;

  MEMORY[0x1E0CA7BA0](font);
  return result;
}

CGRect CTFontGetBoundingBox(CTFontRef font)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x1E0CA7BB0](font);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGFloat CTFontGetDescent(CTFontRef font)
{
  CGFloat result;

  MEMORY[0x1E0CA7BD8](font);
  return result;
}

BOOL CTFontGetGlyphsForCharacters(CTFontRef font, const UniChar *characters, CGGlyph *glyphs, CFIndex count)
{
  return MEMORY[0x1E0CA7C08](font, characters, glyphs, count);
}

CGFloat CTFontGetLeading(CTFontRef font)
{
  CGFloat result;

  MEMORY[0x1E0CA7C20](font);
  return result;
}

void CTFrameGetLineOrigins(CTFrameRef frame, CFRange range, CGPoint *origins)
{
  MEMORY[0x1E0CA7DA8](frame, range.location, range.length, origins);
}

CFArrayRef CTFrameGetLines(CTFrameRef frame)
{
  return (CFArrayRef)MEMORY[0x1E0CA7DB0](frame);
}

CTFrameRef CTFramesetterCreateFrame(CTFramesetterRef framesetter, CFRange stringRange, CGPathRef path, CFDictionaryRef frameAttributes)
{
  return (CTFrameRef)MEMORY[0x1E0CA7DD8](framesetter, stringRange.location, stringRange.length, path, frameAttributes);
}

CTFramesetterRef CTFramesetterCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTFramesetterRef)MEMORY[0x1E0CA7DE0](attrString);
}

CGSize CTFramesetterSuggestFrameSizeWithConstraints(CTFramesetterRef framesetter, CFRange stringRange, CFDictionaryRef frameAttributes, CGSize constraints, CFRange *fitRange)
{
  double v5;
  double v6;
  CGSize result;

  MEMORY[0x1E0CA7DF8](framesetter, stringRange.location, stringRange.length, frameAttributes, fitRange, (__n128)constraints, *(__n128 *)&constraints.height);
  result.height = v6;
  result.width = v5;
  return result;
}

CFArrayRef CTLineGetGlyphRuns(CTLineRef line)
{
  return (CFArrayRef)MEMORY[0x1E0CA7ED8](line);
}

void CTRunGetAdvances(CTRunRef run, CFRange range, CGSize *buffer)
{
  MEMORY[0x1E0CA7FA0](run, range.location, range.length, buffer);
}

CFDictionaryRef CTRunGetAttributes(CTRunRef run)
{
  return (CFDictionaryRef)MEMORY[0x1E0CA7FB0](run);
}

CFIndex CTRunGetGlyphCount(CTRunRef run)
{
  return MEMORY[0x1E0CA7FD0](run);
}

void CTRunGetGlyphs(CTRunRef run, CFRange range, CGGlyph *buffer)
{
  MEMORY[0x1E0CA7FE0](run, range.location, range.length, buffer);
}

CFDictionaryRef CVBufferCopyAttachments(CVBufferRef buffer, CVAttachmentMode attachmentMode)
{
  return (CFDictionaryRef)MEMORY[0x1E0CA8908](buffer, *(_QWORD *)&attachmentMode);
}

CGColorSpaceRef CVImageBufferCreateColorSpaceFromAttachments(CFDictionaryRef attachments)
{
  return (CGColorSpaceRef)MEMORY[0x1E0CA89D0](attachments);
}

CVReturn CVMetalTextureCacheCreate(CFAllocatorRef allocator, CFDictionaryRef cacheAttributes, id metalDevice, CFDictionaryRef textureAttributes, CVMetalTextureCacheRef *cacheOut)
{
  return MEMORY[0x1E0CA8A30](allocator, cacheAttributes, metalDevice, textureAttributes, cacheOut);
}

CVReturn CVMetalTextureCacheCreateTextureFromImage(CFAllocatorRef allocator, CVMetalTextureCacheRef textureCache, CVImageBufferRef sourceImage, CFDictionaryRef textureAttributes, MTLPixelFormat pixelFormat, size_t width, size_t height, size_t planeIndex, CVMetalTextureRef *textureOut)
{
  return MEMORY[0x1E0CA8A38](allocator, textureCache, sourceImage, textureAttributes, pixelFormat, width, height, planeIndex);
}

void CVMetalTextureCacheFlush(CVMetalTextureCacheRef textureCache, CVOptionFlags options)
{
  MEMORY[0x1E0CA8A40](textureCache, options);
}

id CVMetalTextureGetTexture(CVMetalTextureRef image)
{
  return (id)MEMORY[0x1E0CA8A50](image);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x1E0CA8AE0](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8AF8](pixelBuffer);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8B20](pixelBuffer);
}

size_t CVPixelBufferGetHeightOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x1E0CA8B28](pixelBuffer, planeIndex);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x1E0CA8B30](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8B38](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8B50](pixelBuffer);
}

size_t CVPixelBufferGetWidthOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x1E0CA8B58](pixelBuffer, planeIndex);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x1E0CA8B70](pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferPoolCreatePixelBuffer(CFAllocatorRef allocator, CVPixelBufferPoolRef pixelBufferPool, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1E0CA8B80](allocator, pixelBufferPool, pixelBufferOut);
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return (CVPixelBufferRef)MEMORY[0x1E0CA8BF8](texture);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x1E0CA8C00](pixelBuffer, unlockFlags);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x1E0CBB668](*(_QWORD *)&iterator);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1E0CBB6F0](*(_QWORD *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1E0CBB900](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x1E0CBB9F0](*(_QWORD *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0CBBA00](name);
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return (IOSurfaceRef)MEMORY[0x1E0CBBAF0](properties);
}

void IOSurfaceDecrementUseCount(IOSurfaceRef buffer)
{
  MEMORY[0x1E0CBBB18](buffer);
}

void IOSurfaceIncrementUseCount(IOSurfaceRef buffer)
{
  MEMORY[0x1E0CBBD00](buffer);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x1E0CC6980]();
}

uint64_t MTLDataTypeGetAlignment()
{
  return MEMORY[0x1E0CC6988]();
}

uint64_t MTLDataTypeString()
{
  return MEMORY[0x1E0CC6990]();
}

uint64_t MTLPixelFormatGetInfo()
{
  return MEMORY[0x1E0CC69B8]();
}

uint64_t MTLPixelFormatGetInfoForDevice()
{
  return MEMORY[0x1E0CC69C8]();
}

uint64_t MTLPixelFormatGetName()
{
  return MEMORY[0x1E0CC69D0]();
}

uint64_t MTLValidationEnabled()
{
  return MEMORY[0x1E0CC69F8]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

NSZone *NSDefaultMallocZone(void)
{
  return (NSZone *)MEMORY[0x1E0CB2960]();
}

void NSEndMapTableEnumeration(NSMapEnumerator *enumerator)
{
  MEMORY[0x1E0CB29A0](enumerator);
}

NSMapEnumerator *__cdecl NSEnumerateMapTable(NSMapEnumerator *__return_ptr retstr, NSMapTable *table)
{
  return (NSMapEnumerator *)MEMORY[0x1E0CB29B0](retstr, table);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

BOOL NSNextMapEnumeratorPair(NSMapEnumerator *enumerator, void **key, void **value)
{
  return MEMORY[0x1E0CB2F88](enumerator, key, value);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1E0CB3190](aSelectorName);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x1E0CEA110]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x1E0CEB640]();
}

void UIGraphicsPopContext(void)
{
  MEMORY[0x1E0CEB650]();
}

void UIGraphicsPushContext(CGContextRef context)
{
  MEMORY[0x1E0CEB658](context);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x1E0CEB688](image);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x1E0C80940](a1, a2, *(_QWORD *)&a3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x1E0C9A498]();
}

uint64_t _CFRuntimeGetClassWithTypeID()
{
  return MEMORY[0x1E0C9A4A0]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x1E0C9A4B0]();
}

uint64_t _UIApplicationIsExtension()
{
  return MEMORY[0x1E0CEBEE0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

int std::string::compare(const std::string *this, std::string::size_type __pos1, std::string::size_type __n1, const std::string::value_type *__s)
{
  return MEMORY[0x1E0DE41E0](this, __pos1, __n1, __s);
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x1E0DE41F0]();
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1E0DE4248](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1E0DE4258](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1E0DE43E8](__n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1E0DE4420](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1E0DE4428](this, __s, __n);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1E0DE4440](this, __s);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1E0DE4450](this, __str, __pos, __n);
}

void std::string::reserve(std::string *this, std::string::size_type __requested_capacity)
{
  MEMORY[0x1E0DE44A8](this, __requested_capacity);
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return (std::string *)MEMORY[0x1E0DE44C8](this, __str, __pos, __n, __a);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x1E0DE44D8](this, __str);
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x1E0DE46B0]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x1E0DE46B8]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x1E0DE46E8]();
}

{
  return MEMORY[0x1E0DE4700]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x1E0DE47A8]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x1E0DE47E0]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x1E0DE47E8]();
}

std::chrono::steady_clock::time_point std::chrono::steady_clock::now(void)
{
  return (std::chrono::steady_clock::time_point)MEMORY[0x1E0DE4B38]();
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x1E0DE4B98](this);
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
  MEMORY[0x1E0DE4C68](this, __sb);
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
  MEMORY[0x1E0DE4C80](this, *(_QWORD *)&__state);
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x1E0DE4D28]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x1E0DE4D58](retstr, *(_QWORD *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return (std::string *)MEMORY[0x1E0DE4D70](retstr, __val);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

uint64_t operator delete[]()
{
  return off_1EA593C80();
}

void operator delete(void *__p)
{
  off_1EA593C88(__p);
}

uint64_t operator delete()
{
  return off_1EA593C90();
}

uint64_t operator new[]()
{
  return off_1EA593C98();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1EA593CA0(__sz);
}

void *__cdecl operator new(size_t __sz, const std::nothrow_t *a2)
{
  return (void *)off_1EA593CA8(__sz, a2);
}

uint64_t operator new()
{
  return off_1EA593CB0();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x1E0C80A98](lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

void __cxa_guard_abort(__guard *a1)
{
  MEMORY[0x1E0DE50B0](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x1E0DE50B8](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x1E0DE50C0](a1);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

double __exp10(double a1)
{
  double result;

  MEMORY[0x1E0C80AC8](a1);
  return result;
}

uint64_t __invert_d4()
{
  return MEMORY[0x1E0C80B20]();
}

simd_float3x3 __invert_f3(simd_float3x3 a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  simd_float3x3 result;

  MEMORY[0x1E0C80B30]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2]);
  result.columns[2].i64[1] = v6;
  result.columns[2].i64[0] = v5;
  result.columns[1].i64[1] = v4;
  result.columns[1].i64[0] = v3;
  result.columns[0].i64[1] = v2;
  result.columns[0].i64[0] = v1;
  return result;
}

simd_float4x4 __invert_f4(simd_float4x4 a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  simd_float4x4 result;

  MEMORY[0x1E0C80B38]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2], (__n128)a1.columns[3]);
  result.columns[3].i64[1] = v8;
  result.columns[3].i64[0] = v7;
  result.columns[2].i64[1] = v6;
  result.columns[2].i64[0] = v5;
  result.columns[1].i64[1] = v4;
  result.columns[1].i64[0] = v3;
  result.columns[0].i64[1] = v2;
  result.columns[0].i64[0] = v1;
  return result;
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1E0C80B50](*(_QWORD *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1E0C80B68]();
}

__double2 __sincos_stret(double a1)
{
  double v1;
  double v2;
  __double2 result;

  MEMORY[0x1E0C80BC8](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  float v1;
  float v2;
  __float2 result;

  MEMORY[0x1E0C80BD0](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

uint64_t __strcat_chk()
{
  return MEMORY[0x1E0C80C30]();
}

uint64_t __strcpy_chk()
{
  return MEMORY[0x1E0C80C38]();
}

double __tanpi(double a1)
{
  double result;

  MEMORY[0x1E0C80C68](a1);
  return result;
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1E0C80C70](*(_QWORD *)&a1);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

int access(const char *a1, int a2)
{
  return MEMORY[0x1E0C813D0](a1, *(_QWORD *)&a2);
}

float acosf(float a1)
{
  float result;

  MEMORY[0x1E0C81508](a1);
  return result;
}

uint32_t arc4random(void)
{
  return MEMORY[0x1E0C81570]();
}

long double asin(long double __x)
{
  long double result;

  MEMORY[0x1E0C81598](__x);
  return result;
}

float asinf(float a1)
{
  float result;

  MEMORY[0x1E0C815A0](a1);
  return result;
}

long double atan(long double __x)
{
  long double result;

  MEMORY[0x1E0C81618](__x);
  return result;
}

float atan2f(float a1, float a2)
{
  float result;

  MEMORY[0x1E0C81628](a1, a2);
  return result;
}

float atanf(float a1)
{
  float result;

  MEMORY[0x1E0C81630](a1);
  return result;
}

double atof(const char *a1)
{
  double result;

  MEMORY[0x1E0C81658](a1);
  return result;
}

int atoi(const char *a1)
{
  return MEMORY[0x1E0C81668](a1);
}

void *__cdecl bsearch(const void *__key, const void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  return (void *)MEMORY[0x1E0C81738](__key, __base, __nel, __width, __compar);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

float cbrtf(float a1)
{
  float result;

  MEMORY[0x1E0C81858](a1);
  return result;
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return MEMORY[0x1E0DE7A50](cls, name, imp, types);
}

BOOL class_addProtocol(Class cls, Protocol *protocol)
{
  return MEMORY[0x1E0DE7A60](cls, protocol);
}

Method *__cdecl class_copyMethodList(Class cls, unsigned int *outCount)
{
  return (Method *)MEMORY[0x1E0DE7A78](cls, outCount);
}

objc_property_t *__cdecl class_copyPropertyList(Class cls, unsigned int *outCount)
{
  return (objc_property_t *)MEMORY[0x1E0DE7A80](cls, outCount);
}

Method class_getClassMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1E0DE7A98](cls, name);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1E0DE7AA8](cls, name);
}

objc_property_t class_getProperty(Class cls, const char *name)
{
  return (objc_property_t)MEMORY[0x1E0DE7AD0](cls, name);
}

Class class_getSuperclass(Class cls)
{
  return (Class)MEMORY[0x1E0DE7AD8](cls);
}

uint64_t clear_mapped_memory()
{
  return MEMORY[0x1E0D1A3A8]();
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

compression_status compression_stream_destroy(compression_stream *stream)
{
  return MEMORY[0x1E0DE5290](stream);
}

compression_status compression_stream_init(compression_stream *stream, compression_stream_operation operation, compression_algorithm algorithm)
{
  return MEMORY[0x1E0DE52A0](stream, *(_QWORD *)&operation, *(_QWORD *)&algorithm);
}

compression_status compression_stream_process(compression_stream *stream, int flags)
{
  return MEMORY[0x1E0DE52B0](stream, *(_QWORD *)&flags);
}

long double cos(long double __x)
{
  long double result;

  MEMORY[0x1E0C82B40](__x);
  return result;
}

float cosf(float a1)
{
  float result;

  MEMORY[0x1E0C82B48](a1);
  return result;
}

uLong crc32(uLong crc, const Bytef *buf, uInt len)
{
  return MEMORY[0x1E0DE92B0](crc, buf, *(_QWORD *)&len);
}

uint64_t create_mapped_memory_cache_for_task()
{
  return MEMORY[0x1E0D1A3B8]();
}

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x1E0DE92C0](strm, *(_QWORD *)&flush);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x1E0DE92D0](strm);
}

int deflateInit2_(z_streamp strm, int level, int method, int windowBits, int memLevel, int strategy, const char *version, int stream_size)
{
  return MEMORY[0x1E0DE92D8](strm, *(_QWORD *)&level, *(_QWORD *)&method, *(_QWORD *)&windowBits, *(_QWORD *)&memLevel, *(_QWORD *)&strategy, version, *(_QWORD *)&stream_size);
}

uint64_t destroy_mapped_memory_cache()
{
  return MEMORY[0x1E0D1A3C8]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
  MEMORY[0x1E0C82BD8](iterations, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C60](flags, block);
}

intptr_t dispatch_block_wait(dispatch_block_t block, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82C98](block, timeout);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x1E0C82E98](object);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA8](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_merge_data(dispatch_source_t source, uintptr_t value)
{
  MEMORY[0x1E0C82F40](source, value);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F48](source, handler);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x1E0C82F88](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1E0C83158]();
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x1E0C83280](__x);
  return result;
}

long double exp2(long double __x)
{
  long double result;

  MEMORY[0x1E0C83288](__x);
  return result;
}

float exp2f(float a1)
{
  float result;

  MEMORY[0x1E0C83290](a1);
  return result;
}

float expf(float a1)
{
  float result;

  MEMORY[0x1E0C83298](a1);
  return result;
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C83440](__x, __y);
  return result;
}

float fmodf(float a1, float a2)
{
  float result;

  MEMORY[0x1E0C83448](a1, a2);
  return result;
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83478](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x1E0C83488](*(_QWORD *)&a1, a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C835E0](__ptr, __size, __nitems, __stream);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1E0C83660](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

void glActiveTexture(GLenum texture)
{
  MEMORY[0x1E0CD0960](*(_QWORD *)&texture);
}

void glAttachShader(GLuint program, GLuint shader)
{
  MEMORY[0x1E0CD0968](*(_QWORD *)&program, *(_QWORD *)&shader);
}

void glBindAttribLocation(GLuint program, GLuint index, const GLchar *name)
{
  MEMORY[0x1E0CD0970](*(_QWORD *)&program, *(_QWORD *)&index, name);
}

void glBindBuffer(GLenum target, GLuint buffer)
{
  MEMORY[0x1E0CD0978](*(_QWORD *)&target, *(_QWORD *)&buffer);
}

void glBindFramebuffer(GLenum target, GLuint framebuffer)
{
  MEMORY[0x1E0CD0980](*(_QWORD *)&target, *(_QWORD *)&framebuffer);
}

void glBindRenderbuffer(GLenum target, GLuint renderbuffer)
{
  MEMORY[0x1E0CD0988](*(_QWORD *)&target, *(_QWORD *)&renderbuffer);
}

void glBindTexture(GLenum target, GLuint texture)
{
  MEMORY[0x1E0CD0990](*(_QWORD *)&target, *(_QWORD *)&texture);
}

uint64_t glBindVertexArrayOES()
{
  return MEMORY[0x1E0CD0998]();
}

void glBlendColor(GLfloat red, GLfloat green, GLfloat blue, GLfloat alpha)
{
  MEMORY[0x1E0CD09A0](red, green, blue, alpha);
}

void glBlendEquation(GLenum mode)
{
  MEMORY[0x1E0CD09A8](*(_QWORD *)&mode);
}

void glBlendEquationSeparate(GLenum modeRGB, GLenum modeAlpha)
{
  MEMORY[0x1E0CD09B0](*(_QWORD *)&modeRGB, *(_QWORD *)&modeAlpha);
}

void glBlendFunc(GLenum sfactor, GLenum dfactor)
{
  MEMORY[0x1E0CD09B8](*(_QWORD *)&sfactor, *(_QWORD *)&dfactor);
}

void glBlendFuncSeparate(GLenum srcRGB, GLenum dstRGB, GLenum srcAlpha, GLenum dstAlpha)
{
  MEMORY[0x1E0CD09C0](*(_QWORD *)&srcRGB, *(_QWORD *)&dstRGB, *(_QWORD *)&srcAlpha, *(_QWORD *)&dstAlpha);
}

void glBufferData(GLenum target, GLsizeiptr size, const GLvoid *data, GLenum usage)
{
  MEMORY[0x1E0CD09C8](*(_QWORD *)&target, size, data, *(_QWORD *)&usage);
}

void glClear(GLbitfield mask)
{
  MEMORY[0x1E0CD09E0](*(_QWORD *)&mask);
}

void glClearColor(GLfloat red, GLfloat green, GLfloat blue, GLfloat alpha)
{
  MEMORY[0x1E0CD09E8](red, green, blue, alpha);
}

void glCompileShader(GLuint shader)
{
  MEMORY[0x1E0CD0A08](*(_QWORD *)&shader);
}

void glCompressedTexImage2D(GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLint border, GLsizei imageSize, const GLvoid *data)
{
  MEMORY[0x1E0CD0A10](*(_QWORD *)&target, *(_QWORD *)&level, *(_QWORD *)&internalformat, *(_QWORD *)&width, *(_QWORD *)&height, *(_QWORD *)&border, *(_QWORD *)&imageSize, data);
}

GLuint glCreateProgram(void)
{
  return MEMORY[0x1E0CD0A18]();
}

GLuint glCreateShader(GLenum type)
{
  return MEMORY[0x1E0CD0A20](*(_QWORD *)&type);
}

void glCullFace(GLenum mode)
{
  MEMORY[0x1E0CD0A28](*(_QWORD *)&mode);
}

void glDeleteBuffers(GLsizei n, const GLuint *buffers)
{
  MEMORY[0x1E0CD0A30](*(_QWORD *)&n, buffers);
}

void glDeleteFramebuffers(GLsizei n, const GLuint *framebuffers)
{
  MEMORY[0x1E0CD0A38](*(_QWORD *)&n, framebuffers);
}

void glDeleteProgram(GLuint program)
{
  MEMORY[0x1E0CD0A40](*(_QWORD *)&program);
}

void glDeleteRenderbuffers(GLsizei n, const GLuint *renderbuffers)
{
  MEMORY[0x1E0CD0A48](*(_QWORD *)&n, renderbuffers);
}

void glDeleteShader(GLuint shader)
{
  MEMORY[0x1E0CD0A50](*(_QWORD *)&shader);
}

void glDeleteTextures(GLsizei n, const GLuint *textures)
{
  MEMORY[0x1E0CD0A60](*(_QWORD *)&n, textures);
}

uint64_t glDeleteVertexArraysOES()
{
  return MEMORY[0x1E0CD0A68]();
}

void glDepthFunc(GLenum func)
{
  MEMORY[0x1E0CD0A70](*(_QWORD *)&func);
}

void glDepthMask(GLBOOLean flag)
{
  MEMORY[0x1E0CD0A78](flag);
}

void glDisable(GLenum cap)
{
  MEMORY[0x1E0CD0A88](*(_QWORD *)&cap);
}

uint64_t glDiscardFramebufferEXT()
{
  return MEMORY[0x1E0CD0A98]();
}

void glDrawArrays(GLenum mode, GLint first, GLsizei count)
{
  MEMORY[0x1E0CD0AA0](*(_QWORD *)&mode, *(_QWORD *)&first, *(_QWORD *)&count);
}

void glDrawElements(GLenum mode, GLsizei count, GLenum type, const GLvoid *indices)
{
  MEMORY[0x1E0CD0AB0](*(_QWORD *)&mode, *(_QWORD *)&count, *(_QWORD *)&type, indices);
}

void glEnable(GLenum cap)
{
  MEMORY[0x1E0CD0AB8](*(_QWORD *)&cap);
}

void glEnableVertexAttribArray(GLuint index)
{
  MEMORY[0x1E0CD0AC0](*(_QWORD *)&index);
}

void glFlush(void)
{
  MEMORY[0x1E0CD0AD8]();
}

uint64_t glFlushMappedBufferRangeEXT()
{
  return MEMORY[0x1E0CD0AE0]();
}

void glFramebufferRenderbuffer(GLenum target, GLenum attachment, GLenum renderbuffertarget, GLuint renderbuffer)
{
  MEMORY[0x1E0CD0AE8](*(_QWORD *)&target, *(_QWORD *)&attachment, *(_QWORD *)&renderbuffertarget, *(_QWORD *)&renderbuffer);
}

void glFramebufferTexture2D(GLenum target, GLenum attachment, GLenum textarget, GLuint texture, GLint level)
{
  MEMORY[0x1E0CD0AF0](*(_QWORD *)&target, *(_QWORD *)&attachment, *(_QWORD *)&textarget, *(_QWORD *)&texture, *(_QWORD *)&level);
}

void glFrontFace(GLenum mode)
{
  MEMORY[0x1E0CD0AF8](*(_QWORD *)&mode);
}

void glGenBuffers(GLsizei n, GLuint *buffers)
{
  MEMORY[0x1E0CD0B00](*(_QWORD *)&n, buffers);
}

void glGenFramebuffers(GLsizei n, GLuint *framebuffers)
{
  MEMORY[0x1E0CD0B08](*(_QWORD *)&n, framebuffers);
}

void glGenRenderbuffers(GLsizei n, GLuint *renderbuffers)
{
  MEMORY[0x1E0CD0B10](*(_QWORD *)&n, renderbuffers);
}

void glGenTextures(GLsizei n, GLuint *textures)
{
  MEMORY[0x1E0CD0B18](*(_QWORD *)&n, textures);
}

uint64_t glGenVertexArraysOES()
{
  return MEMORY[0x1E0CD0B20]();
}

void glGenerateMipmap(GLenum target)
{
  MEMORY[0x1E0CD0B28](*(_QWORD *)&target);
}

void glGetActiveAttrib(GLuint program, GLuint index, GLsizei bufsize, GLsizei *length, GLint *size, GLenum *type, GLchar *name)
{
  MEMORY[0x1E0CD0B30](*(_QWORD *)&program, *(_QWORD *)&index, *(_QWORD *)&bufsize, length, size, type, name);
}

void glGetActiveUniform(GLuint program, GLuint index, GLsizei bufsize, GLsizei *length, GLint *size, GLenum *type, GLchar *name)
{
  MEMORY[0x1E0CD0B38](*(_QWORD *)&program, *(_QWORD *)&index, *(_QWORD *)&bufsize, length, size, type, name);
}

int glGetAttribLocation(GLuint program, const GLchar *name)
{
  return MEMORY[0x1E0CD0B48](*(_QWORD *)&program, name);
}

GLenum glGetError(void)
{
  return MEMORY[0x1E0CD0B58]();
}

void glGetFloatv(GLenum pname, GLfloat *params)
{
  MEMORY[0x1E0CD0B60](*(_QWORD *)&pname, params);
}

void glGetIntegerv(GLenum pname, GLint *params)
{
  MEMORY[0x1E0CD0B68](*(_QWORD *)&pname, params);
}

void glGetProgramInfoLog(GLuint program, GLsizei bufsize, GLsizei *length, GLchar *infolog)
{
  MEMORY[0x1E0CD0B70](*(_QWORD *)&program, *(_QWORD *)&bufsize, length, infolog);
}

void glGetProgramiv(GLuint program, GLenum pname, GLint *params)
{
  MEMORY[0x1E0CD0B78](*(_QWORD *)&program, *(_QWORD *)&pname, params);
}

void glGetRenderbufferParameteriv(GLenum target, GLenum pname, GLint *params)
{
  MEMORY[0x1E0CD0B80](*(_QWORD *)&target, *(_QWORD *)&pname, params);
}

void glGetShaderInfoLog(GLuint shader, GLsizei bufsize, GLsizei *length, GLchar *infolog)
{
  MEMORY[0x1E0CD0B88](*(_QWORD *)&shader, *(_QWORD *)&bufsize, length, infolog);
}

void glGetShaderiv(GLuint shader, GLenum pname, GLint *params)
{
  MEMORY[0x1E0CD0B98](*(_QWORD *)&shader, *(_QWORD *)&pname, params);
}

int glGetUniformLocation(GLuint program, const GLchar *name)
{
  return MEMORY[0x1E0CD0BA8](*(_QWORD *)&program, name);
}

GLBOOLean glIsEnabled(GLenum cap)
{
  return MEMORY[0x1E0CD0BB8](*(_QWORD *)&cap);
}

void glLinkProgram(GLuint program)
{
  MEMORY[0x1E0CD0BD0](*(_QWORD *)&program);
}

uint64_t glMapBufferRangeEXT()
{
  return MEMORY[0x1E0CD0BD8]();
}

void glPixelStorei(GLenum pname, GLint param)
{
  MEMORY[0x1E0CD0BE0](*(_QWORD *)&pname, *(_QWORD *)&param);
}

void glPolygonOffset(GLfloat factor, GLfloat units)
{
  MEMORY[0x1E0CD0BE8](factor, units);
}

void glPopGroupMarkerEXT(void)
{
  MEMORY[0x1E0CD0BF0]();
}

void glPushGroupMarkerEXT(GLsizei length, const char *marker)
{
  MEMORY[0x1E0CD0BF8](*(_QWORD *)&length, marker);
}

void glReadPixels(GLint x, GLint y, GLsizei width, GLsizei height, GLenum format, GLenum type, GLvoid *pixels)
{
  MEMORY[0x1E0CD0C00](*(_QWORD *)&x, *(_QWORD *)&y, *(_QWORD *)&width, *(_QWORD *)&height, *(_QWORD *)&format, *(_QWORD *)&type, pixels);
}

void glRenderbufferStorage(GLenum target, GLenum internalformat, GLsizei width, GLsizei height)
{
  MEMORY[0x1E0CD0C08](*(_QWORD *)&target, *(_QWORD *)&internalformat, *(_QWORD *)&width, *(_QWORD *)&height);
}

uint64_t glRenderbufferStorageMultisampleAPPLE()
{
  return MEMORY[0x1E0CD0C10]();
}

uint64_t glResolveMultisampleFramebufferAPPLE()
{
  return MEMORY[0x1E0CD0C18]();
}

void glScissor(GLint x, GLint y, GLsizei width, GLsizei height)
{
  MEMORY[0x1E0CD0C20](*(_QWORD *)&x, *(_QWORD *)&y, *(_QWORD *)&width, *(_QWORD *)&height);
}

void glShaderSource(GLuint shader, GLsizei count, const GLchar *const *string, const GLint *length)
{
  MEMORY[0x1E0CD0C28](*(_QWORD *)&shader, *(_QWORD *)&count, string, length);
}

void glStencilFuncSeparate(GLenum face, GLenum func, GLint ref, GLuint mask)
{
  MEMORY[0x1E0CD0C30](*(_QWORD *)&face, *(_QWORD *)&func, *(_QWORD *)&ref, *(_QWORD *)&mask);
}

void glStencilMask(GLuint mask)
{
  MEMORY[0x1E0CD0C38](*(_QWORD *)&mask);
}

void glStencilMaskSeparate(GLenum face, GLuint mask)
{
  MEMORY[0x1E0CD0C40](*(_QWORD *)&face, *(_QWORD *)&mask);
}

void glStencilOpSeparate(GLenum face, GLenum fail, GLenum zfail, GLenum zpass)
{
  MEMORY[0x1E0CD0C48](*(_QWORD *)&face, *(_QWORD *)&fail, *(_QWORD *)&zfail, *(_QWORD *)&zpass);
}

void glTexImage2D(GLenum target, GLint level, GLint internalformat, GLsizei width, GLsizei height, GLint border, GLenum format, GLenum type, const GLvoid *pixels)
{
  MEMORY[0x1E0CD0C50](*(_QWORD *)&target, *(_QWORD *)&level, *(_QWORD *)&internalformat, *(_QWORD *)&width, *(_QWORD *)&height, *(_QWORD *)&border, *(_QWORD *)&format, *(_QWORD *)&type);
}

void glTexParameterf(GLenum target, GLenum pname, GLfloat param)
{
  MEMORY[0x1E0CD0C58](*(_QWORD *)&target, *(_QWORD *)&pname, param);
}

void glTexParameteri(GLenum target, GLenum pname, GLint param)
{
  MEMORY[0x1E0CD0C60](*(_QWORD *)&target, *(_QWORD *)&pname, *(_QWORD *)&param);
}

void glTexSubImage2D(GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLenum type, const GLvoid *pixels)
{
  MEMORY[0x1E0CD0C68](*(_QWORD *)&target, *(_QWORD *)&level, *(_QWORD *)&xoffset, *(_QWORD *)&yoffset, *(_QWORD *)&width, *(_QWORD *)&height, *(_QWORD *)&format, *(_QWORD *)&type);
}

void glUniform1f(GLint location, GLfloat x)
{
  MEMORY[0x1E0CD0C70](*(_QWORD *)&location, x);
}

void glUniform1fv(GLint location, GLsizei count, const GLfloat *v)
{
  MEMORY[0x1E0CD0C78](*(_QWORD *)&location, *(_QWORD *)&count, v);
}

void glUniform1i(GLint location, GLint x)
{
  MEMORY[0x1E0CD0C80](*(_QWORD *)&location, *(_QWORD *)&x);
}

void glUniform2fv(GLint location, GLsizei count, const GLfloat *v)
{
  MEMORY[0x1E0CD0C90](*(_QWORD *)&location, *(_QWORD *)&count, v);
}

void glUniform2i(GLint location, GLint x, GLint y)
{
  MEMORY[0x1E0CD0C98](*(_QWORD *)&location, *(_QWORD *)&x, *(_QWORD *)&y);
}

void glUniform3f(GLint location, GLfloat x, GLfloat y, GLfloat z)
{
  MEMORY[0x1E0CD0CA0](*(_QWORD *)&location, x, y, z);
}

void glUniform3fv(GLint location, GLsizei count, const GLfloat *v)
{
  MEMORY[0x1E0CD0CA8](*(_QWORD *)&location, *(_QWORD *)&count, v);
}

void glUniform3i(GLint location, GLint x, GLint y, GLint z)
{
  MEMORY[0x1E0CD0CB0](*(_QWORD *)&location, *(_QWORD *)&x, *(_QWORD *)&y, *(_QWORD *)&z);
}

void glUniform4f(GLint location, GLfloat x, GLfloat y, GLfloat z, GLfloat w)
{
  MEMORY[0x1E0CD0CB8](*(_QWORD *)&location, x, y, z, w);
}

void glUniform4fv(GLint location, GLsizei count, const GLfloat *v)
{
  MEMORY[0x1E0CD0CC0](*(_QWORD *)&location, *(_QWORD *)&count, v);
}

void glUniform4i(GLint location, GLint x, GLint y, GLint z, GLint w)
{
  MEMORY[0x1E0CD0CC8](*(_QWORD *)&location, *(_QWORD *)&x, *(_QWORD *)&y, *(_QWORD *)&z, *(_QWORD *)&w);
}

void glUniformMatrix4fv(GLint location, GLsizei count, GLBOOLean transpose, const GLfloat *value)
{
  MEMORY[0x1E0CD0CD8](*(_QWORD *)&location, *(_QWORD *)&count, transpose, value);
}

uint64_t glUnmapBufferOES()
{
  return MEMORY[0x1E0CD0CE0]();
}

void glUseProgram(GLuint program)
{
  MEMORY[0x1E0CD0CE8](*(_QWORD *)&program);
}

void glVertexAttribDivisor(GLuint index, GLuint divisor)
{
  MEMORY[0x1E0CD0D00](*(_QWORD *)&index, *(_QWORD *)&divisor);
}

void glVertexAttribPointer(GLuint indx, GLint size, GLenum type, GLBOOLean normalized, GLsizei stride, const GLvoid *ptr)
{
  MEMORY[0x1E0CD0D08](*(_QWORD *)&indx, *(_QWORD *)&size, *(_QWORD *)&type, normalized, *(_QWORD *)&stride, ptr);
}

void glViewport(GLint x, GLint y, GLsizei width, GLsizei height)
{
  MEMORY[0x1E0CD0D10](*(_QWORD *)&x, *(_QWORD *)&y, *(_QWORD *)&width, *(_QWORD *)&height);
}

long double hypot(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C838E8](__x, __y);
  return result;
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x1E0DE93A0](strm, *(_QWORD *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x1E0DE93B8](strm);
}

int inflateInit2_(z_streamp strm, int windowBits, const char *version, int stream_size)
{
  return MEMORY[0x1E0DE93C8](strm, *(_QWORD *)&windowBits, version, *(_QWORD *)&stream_size);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1E0C83A20]();
}

long double ldexp(long double __x, int __e)
{
  long double result;

  MEMORY[0x1E0C83B40](*(_QWORD *)&__e, __x);
  return result;
}

float ldexpf(float a1, int a2)
{
  float result;

  MEMORY[0x1E0C83B48](*(_QWORD *)&a2, a1);
  return result;
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BB8](__x);
  return result;
}

float log10f(float a1)
{
  float result;

  MEMORY[0x1E0C83BC8](a1);
  return result;
}

float log2f(float a1)
{
  float result;

  MEMORY[0x1E0C83BF0](a1);
  return result;
}

float logf(float a1)
{
  float result;

  MEMORY[0x1E0C83C00](a1);
  return result;
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

int malloc_type_posix_memalign(void **memptr, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return MEMORY[0x1E0C83F08](memptr, alignment, size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F10](ptr, size, type_id);
}

void *__cdecl malloc_type_valloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F18](size, type_id);
}

uint64_t mapped_memory_read()
{
  return MEMORY[0x1E0D1A590]();
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1E0C84070](__s, *(_QWORD *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
  MEMORY[0x1E0C840B8](__b, __pattern16, __len);
}

void memset_pattern4(void *__b, const void *__pattern4, size_t __len)
{
  MEMORY[0x1E0C840C0](__b, __pattern4, __len);
}

IMP method_getImplementation(Method m)
{
  return (IMP)MEMORY[0x1E0DE7B68](m);
}

SEL method_getName(Method m)
{
  return (SEL)MEMORY[0x1E0DE7B70](m);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

Class objc_getMetaClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CC8](name);
}

Protocol *__cdecl objc_getProtocol(const char *name)
{
  return (Protocol *)MEMORY[0x1E0DE7CD8](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeak(id *location)
{
  return (id)MEMORY[0x1E0DE7D00](location);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F98](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

BOOL os_unfair_lock_trylock(os_unfair_lock_t lock)
{
  return MEMORY[0x1E0C849A8](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1E0C849F8]();
}

uint64_t os_workgroup_attr_set_flags()
{
  return MEMORY[0x1E0C84A20]();
}

uint64_t os_workgroup_create()
{
  return MEMORY[0x1E0C84A48]();
}

int os_workgroup_join(os_workgroup_t wg, os_workgroup_join_token_t token_out)
{
  return MEMORY[0x1E0C84AA0](wg, token_out);
}

void os_workgroup_leave(os_workgroup_t wg, os_workgroup_join_token_t token)
{
  MEMORY[0x1E0C84AA8](wg, token);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C84BB8](__x, __y);
  return result;
}

float powf(float a1, float a2)
{
  float result;

  MEMORY[0x1E0C84BC0](a1, a2);
  return result;
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1E0C84BD0](a1);
}

uint64_t proc_disable_wakemon()
{
  return MEMORY[0x1E0C84BE8]();
}

const char *__cdecl property_getAttributes(objc_property_t property)
{
  return (const char *)MEMORY[0x1E0DE8068](property);
}

const char *__cdecl property_getName(objc_property_t property)
{
  return (const char *)MEMORY[0x1E0DE8070](property);
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return MEMORY[0x1E0C84CB0](a1);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return MEMORY[0x1E0C84CC8](a1);
}

int pthread_attr_setschedparam(pthread_attr_t *a1, const sched_param *a2)
{
  return MEMORY[0x1E0C84CE8](a1, a2);
}

int pthread_attr_setschedpolicy(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x1E0C84CF0](a1, *(_QWORD *)&a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x1E0C84D50](a1, a2, a3, a4);
}

void pthread_exit(void *a1)
{
  MEMORY[0x1E0C84D88](a1);
}

int pthread_getname_np(pthread_t a1, char *a2, size_t a3)
{
  return MEMORY[0x1E0C84DB0](a1, a2, a3);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1E0C84DC0](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x1E0C84DE0](a1, a2);
}

int pthread_main_np(void)
{
  return MEMORY[0x1E0C84E08]();
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E18](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1E0C84E20](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

int pthread_mutexattr_destroy(pthread_mutexattr_t *a1)
{
  return MEMORY[0x1E0C84E40](a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return MEMORY[0x1E0C84E48](a1);
}

int pthread_mutexattr_setpolicy_np(pthread_mutexattr_t *a1, int a2)
{
  return MEMORY[0x1E0C84E50](a1, *(_QWORD *)&a2);
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  return MEMORY[0x1E0C84E60](a1, *(_QWORD *)&a2);
}

int pthread_rwlock_init(pthread_rwlock_t *a1, const pthread_rwlockattr_t *a2)
{
  return MEMORY[0x1E0C84E98](a1, a2);
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1E0C84EA0](a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1E0C84EB8](a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1E0C84EC0](a1);
}

int pthread_rwlockattr_destroy(pthread_rwlockattr_t *a1)
{
  return MEMORY[0x1E0C84EC8](a1);
}

int pthread_rwlockattr_init(pthread_rwlockattr_t *a1)
{
  return MEMORY[0x1E0C84ED0](a1);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1E0C84ED8]();
}

uint64_t pthread_set_fixedpriority_self()
{
  return MEMORY[0x1E0C84EE8]();
}

int pthread_setname_np(const char *a1)
{
  return MEMORY[0x1E0C84F08](a1);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x1E0C84F18](a1, a2);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  MEMORY[0x1E0C84F88](__base, __nel, __width, __compar);
}

void qsort_r(void *__base, size_t __nel, size_t __width, void *a4, int (__cdecl *__compar)(void *, const void *, const void *))
{
  MEMORY[0x1E0C84F98](__base, __nel, __width, a4, __compar);
}

int rand(void)
{
  return MEMORY[0x1E0C84FB0]();
}

uint64_t random(void)
{
  return MEMORY[0x1E0C84FC0]();
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1E0C85040](a1, a2);
}

long double sin(long double __x)
{
  long double result;

  MEMORY[0x1E0C85418](__x);
  return result;
}

float sinf(float a1)
{
  float result;

  MEMORY[0x1E0C85420](a1);
  return result;
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C85498](a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C85540](__s1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1E0C855B0](__dst, __src, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1E0C855C0](__s1, __n);
}

double strtod(const char *a1, char **a2)
{
  double result;

  MEMORY[0x1E0C85618](a1, a2);
  return result;
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1E0C85798](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C857A0](a1, a2, a3, a4, a5);
}

long double tan(long double __x)
{
  long double result;

  MEMORY[0x1E0C857E8](__x);
  return result;
}

float tanf(float a1)
{
  float result;

  MEMORY[0x1E0C857F0](a1);
  return result;
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1E0C859E0](*(_QWORD *)&a1);
}

uint64_t vImageDecodeVectorHalf()
{
  return MEMORY[0x1E0C8D1F8]();
}

uint64_t vImageEncodeVectorHalf()
{
  return MEMORY[0x1E0C8D220]();
}

uint64_t vImageEncodeVectorOptionsCreate()
{
  return MEMORY[0x1E0C8D228]();
}

uint64_t vImageEncodeVectorOptionsFree()
{
  return MEMORY[0x1E0C8D230]();
}

uint64_t vImageEncodeVectorOptionsSetQuantization()
{
  return MEMORY[0x1E0C8D238]();
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x1E0C85A80](*(_QWORD *)&target_task, address, size, *(_QWORD *)&flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x1E0C85A98](*(_QWORD *)&target_task, address, size);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x1E0C85B98](__str, __size, __format, a4);
}

__int32 *__cdecl wmemchr(__int32 *__s, __int32 __c, size_t __n)
{
  return (__int32 *)MEMORY[0x1E0C85CB8](__s, *(_QWORD *)&__c, __n);
}

