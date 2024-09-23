@implementation __NSSKGraph

- (BOOL)addEdgeWithH1:(unint64_t)a3 withH2:(unint64_t)a4
{
  edge *edges;
  vertex *vertices;
  vertex *v9;
  vertex *v10;
  unint64_t v11;
  uint64_t *p_var1;
  unint64_t var1;
  uint64_t v14;
  _QWORD *var2;
  vertex *v16;
  vertex *v17;
  uint64_t v18;
  vertex *v19;
  vertex *v20;
  vertex *v21;
  unint64_t v22;
  uint64_t *v23;
  unint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  vertex *v27;
  vertex *v28;
  uint64_t v29;

  edges = self->_edges;
  vertices = self->_vertices;
  edges[self->_currE].var0 = self->_currE;
  edges[self->_currE].var1[0] = a3;
  edges[self->_currE].var1[1] = a4;
  edges[self->_currE].var2 = 0x7FFFFFFFFFFFFFFFLL;
  v9 = &vertices[a3];
  if (v9->var0)
  {
    v10 = &vertices[a3];
    var1 = v10->var1;
    p_var1 = (uint64_t *)&v10->var1;
    v11 = var1;
    if (var1 - 1 == v9->var0)
    {
      v14 = 2 * v11;
      var2 = malloc_type_calloc(2 * v11, 8uLL, 0x100004000313F17uLL);
      v16 = &vertices[a3];
      memcpy(var2, v16->var2, 8 * *p_var1);
      free(v16->var2);
      v16->var2 = var2;
      *p_var1 = v14;
    }
    else
    {
      var2 = vertices[a3].var2;
    }
  }
  else
  {
    var2 = malloc_type_calloc(4uLL, 8uLL, 0x100004000313F17uLL);
    v17 = &vertices[a3];
    v17->var1 = 4;
    v17->var2 = var2;
    *var2 = 0x7FFFFFFFFFFFFFFFLL;
  }
  var2[v9->var0] = self->_currE;
  v18 = v9->var0 + 1;
  v9->var0 = v18;
  var2[v18] = 0x7FFFFFFFFFFFFFFFLL;
  v19 = self->_vertices;
  v20 = &v19[a4];
  if (v20->var0)
  {
    v21 = &v19[a4];
    v24 = v21->var1;
    v23 = (uint64_t *)&v21->var1;
    v22 = v24;
    if (v24 - 1 == v20->var0)
    {
      v25 = 2 * v22;
      v26 = malloc_type_calloc(2 * v22, 8uLL, 0x100004000313F17uLL);
      v27 = &v19[a4];
      memcpy(v26, v27->var2, 8 * *v23);
      free(v27->var2);
      v27->var2 = v26;
      *v23 = v25;
    }
    else
    {
      v26 = v19[a4].var2;
    }
  }
  else
  {
    v26 = malloc_type_calloc(4uLL, 8uLL, 0x100004000313F17uLL);
    v28 = &v19[a4];
    v28->var1 = 4;
    v28->var2 = v26;
    *v26 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v26[v20->var0] = self->_currE;
  v29 = v20->var0 + 1;
  v20->var0 = v29;
  v26[v29] = 0x7FFFFFFFFFFFFFFFLL;
  ++self->_currE;
  return 1;
}

- (void)dealloc
{
  unint64_t numV;
  uint64_t v4;
  void *v5;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  free(self->_edges);
  numV = self->_numV;
  if (numV)
  {
    v4 = 24 * numV - 8;
    do
    {
      v5 = *(void **)((char *)&self->_vertices->var0 + v4);
      if (v5)
        free(v5);
      v4 -= 24;
      --numV;
    }
    while (numV);
  }
  free(self->_vertices);
  v6.receiver = self;
  v6.super_class = (Class)__NSSKGraph;
  -[__NSSKGraph dealloc](&v6, sel_dealloc);
}

- (edge)isAcyclic
{
  edge **v3;
  _QWORD *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  vertex *vertices;
  edge *v9;
  unint64_t v10;
  unint64_t i;
  edge *v12;
  unint64_t l_end;
  vertex *v14;
  unint64_t v15;
  unint64_t v16;
  vertex *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t *var2;
  unint64_t v22;
  vertex *v23;
  unint64_t v24;
  unint64_t *v25;
  unint64_t v26;
  vertex *v27;
  unint64_t var1;
  uint64_t v29;
  vertex *v30;
  unint64_t **p_var2;
  unint64_t *v32;
  unint64_t *v33;
  unint64_t dump;
  unint64_t v35;
  edge *v36;
  vertex *v37;
  vertex *v38;
  unint64_t v39;
  uint64_t v40;
  vertex *v41;
  unint64_t *v42;
  unint64_t **v43;
  unint64_t *v44;
  unint64_t v45;
  unint64_t v46;
  edge *v47;

  v3 = (edge **)malloc_type_calloc(self->_numE, 8uLL, 0x2004093837F09uLL);
  v4 = malloc_type_calloc(self->_numE, 8uLL, 0x2004093837F09uLL);
  if (self->_numE)
  {
    v5 = 0;
    v6 = 0;
    v7 = 0;
    do
    {
      vertices = self->_vertices;
      v9 = &self->_edges[v5];
      v10 = v9->var1[0];
      if (vertices[v10].var0 == 1 || (v10 = v9->var1[1], vertices[v10].var0 == 1))
      {
        v9->var2 = v10;
        v4[v7++] = v9;
      }
      ++v6;
      ++v5;
    }
    while (v6 < self->_numE);
    if (v7)
    {
      for (i = 0; i < v7; ++i)
      {
        v12 = (edge *)v4[i];
        l_end = self->_l_end;
        self->_l_end = l_end + 1;
        v3[l_end] = v12;
        v14 = self->_vertices;
        v16 = v12->var1[0];
        v15 = v12->var1[1];
        v17 = &v14[v16];
        if (v17->var0 == 2)
          v18 = v12->var1[0];
        else
          v18 = 0x7FFFFFFFFFFFFFFFLL;
        if (v14[v15].var0 == 2)
          v19 = v12->var1[1];
        else
          v19 = 0x7FFFFFFFFFFFFFFFLL;
        if (v17->var1)
        {
          v20 = 0;
          var2 = v14[v16].var2;
          do
          {
            v22 = var2[v20];
            if (v22 == v12->var0)
            {
              var2[v20] = self->_dump;
              --v17->var0;
              v22 = var2[v20];
            }
            if (v22 == 0x7FFFFFFFFFFFFFFFLL)
              break;
            ++v20;
          }
          while (v20 < v17->var1);
          v15 = v12->var1[1];
        }
        v23 = &v14[v15];
        if (v23->var1)
        {
          v24 = 0;
          v25 = v14[v15].var2;
          do
          {
            v26 = v25[v24];
            if (v26 == v12->var0)
            {
              v25[v24] = self->_dump;
              --v23->var0;
              v26 = v25[v24];
            }
            if (v26 == 0x7FFFFFFFFFFFFFFFLL)
              break;
            ++v24;
          }
          while (v24 < v23->var1);
        }
        if (v18 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v27 = &v14[v18];
          var1 = v27->var1;
          if (var1)
          {
            v29 = 0;
            v30 = &v14[v18];
            v33 = v30->var2;
            p_var2 = &v30->var2;
            v32 = v33;
            dump = self->_dump;
            while (1)
            {
              v35 = v32[v29];
              if (v35 != dump)
                break;
              if (var1 == ++v29)
                goto LABEL_37;
            }
            v36 = &self->_edges[v35];
            if (v36->var2 == 0x7FFFFFFFFFFFFFFFLL)
            {
              v4[v7++] = v36;
              v36->var2 = v18;
              dump = self->_dump;
              v32 = *p_var2;
            }
            v32[v29] = dump;
            --v27->var0;
          }
        }
LABEL_37:
        if (v19 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v37 = self->_vertices;
          v38 = &v37[v19];
          v39 = v38->var1;
          if (v39)
          {
            v40 = 0;
            v41 = &v37[v19];
            v44 = v41->var2;
            v43 = &v41->var2;
            v42 = v44;
            v45 = self->_dump;
            while (1)
            {
              v46 = v42[v40];
              if (v46 != v45)
                break;
              if (v39 == ++v40)
                goto LABEL_46;
            }
            v47 = &self->_edges[v46];
            if (v47->var2 == 0x7FFFFFFFFFFFFFFFLL)
            {
              v4[v7++] = v47;
              v47->var2 = v19;
              v45 = self->_dump;
              v42 = *v43;
            }
            v42[v40] = v45;
            --v38->var0;
          }
        }
LABEL_46:
        ;
      }
    }
  }
  free(v4);
  return v3;
}

- (BOOL)isEmpty
{
  return self->_l_end == self->_numE;
}

- (__NSSKGraph)initWithNumberOfVertices:(int64_t)a3 numberOfEdges:(int64_t)a4
{
  __NSSKGraph *v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)__NSSKGraph;
  v6 = -[__NSSKGraph init](&v8, sel_init);
  if (v6)
  {
    v6->_vertices = (vertex *)malloc_type_calloc(a3, 0x18uLL, 0x1010040A79CA2DEuLL);
    v6->_edges = (edge *)malloc_type_calloc(a4, 0x20uLL, 0x1000040E0EAB150uLL);
    v6->_numV = a3;
    v6->_numE = a4;
    v6->_currE = 0;
    v6->_dump = a4 + 1;
    v6->_l_end = 0;
  }
  return v6;
}

- (unint64_t)numOfEdges
{
  return self->_numE;
}

@end
