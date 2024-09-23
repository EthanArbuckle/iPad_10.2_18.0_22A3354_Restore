@implementation ARMeshGeometry

- (ARMeshGeometry)initWithVertices:(id)a3 normals:(id)a4 faces:(id)a5
{
  id v9;
  id v10;
  id v11;
  ARMeshGeometry *v12;
  ARMeshGeometry *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ARMeshGeometry;
  v12 = -[ARMeshGeometry init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_vertices, a3);
    objc_storeStrong((id *)&v13->_normals, a4);
    objc_storeStrong((id *)&v13->_faces, a5);
  }

  return v13;
}

- (ARMeshGeometry)initWithVertices:(id)a3 faces:(id)a4
{
  id v7;
  id v8;
  ARMeshGeometry *v9;
  ARMeshGeometry *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ARMeshGeometry;
  v9 = -[ARMeshGeometry init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_vertices, a3);
    objc_storeStrong((id *)&v10->_faces, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  ARGeometrySource *vertices;
  id v5;

  vertices = self->_vertices;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", vertices, CFSTR("vertices"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_normals, CFSTR("normals"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_faces, CFSTR("faces"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_classification, CFSTR("classification"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_colors, CFSTR("colors"));

}

- (ARMeshGeometry)initWithCoder:(id)a3
{
  id v4;
  ARMeshGeometry *v5;
  uint64_t v6;
  ARGeometrySource *vertices;
  uint64_t v8;
  ARGeometrySource *normals;
  uint64_t v10;
  ARGeometryElement *faces;
  uint64_t v12;
  ARGeometrySource *classification;
  uint64_t v14;
  ARGeometrySource *colors;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ARMeshGeometry;
  v5 = -[ARMeshGeometry init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("vertices"));
    v6 = objc_claimAutoreleasedReturnValue();
    vertices = v5->_vertices;
    v5->_vertices = (ARGeometrySource *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("normals"));
    v8 = objc_claimAutoreleasedReturnValue();
    normals = v5->_normals;
    v5->_normals = (ARGeometrySource *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("faces"));
    v10 = objc_claimAutoreleasedReturnValue();
    faces = v5->_faces;
    v5->_faces = (ARGeometryElement *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("classification"));
    v12 = objc_claimAutoreleasedReturnValue();
    classification = v5->_classification;
    v5->_classification = (ARGeometrySource *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("colors"));
    v14 = objc_claimAutoreleasedReturnValue();
    colors = v5->_colors;
    v5->_colors = (ARGeometrySource *)v14;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  ARMeshGeometry *v5;
  ARMeshGeometry *v6;
  ARGeometrySource *vertices;
  ARGeometrySource *v8;
  ARGeometrySource *v9;
  char v10;
  ARGeometrySource *normals;
  ARGeometrySource *v12;
  ARGeometrySource *v13;
  void *v14;
  ARGeometryElement *faces;
  ARGeometryElement *v16;
  ARGeometryElement *v17;
  ARGeometrySource *classification;
  ARGeometrySource *v19;
  ARGeometrySource *v20;
  uint64_t v21;
  ARGeometrySource *v22;
  void *v23;
  ARGeometrySource *colors;
  uint64_t v25;
  void *v26;
  ARGeometrySource *v27;
  void *v28;
  BOOL v29;
  void *v31;
  void *v32;
  ARGeometrySource *v33;
  ARGeometrySource *v34;
  void *v35;
  void *v36;
  ARGeometryElement *v37;

  v5 = (ARMeshGeometry *)a3;
  if (v5 == self)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      vertices = self->_vertices;
      -[ARMeshGeometry vertices](v6, "vertices");
      v8 = (ARGeometrySource *)objc_claimAutoreleasedReturnValue();
      if (vertices != v8)
      {
        v9 = self->_vertices;
        -[ARMeshGeometry vertices](v6, "vertices");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[ARGeometrySource isEqual:](v9, "isEqual:", v3))
        {
          v10 = 0;
          goto LABEL_32;
        }
      }
      normals = self->_normals;
      -[ARMeshGeometry normals](v6, "normals");
      v12 = (ARGeometrySource *)objc_claimAutoreleasedReturnValue();
      if (normals != v12)
      {
        v13 = self->_normals;
        -[ARMeshGeometry normals](v6, "normals");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[ARGeometrySource isEqual:](v13, "isEqual:", v14))
        {
          v10 = 0;
LABEL_30:

LABEL_31:
          if (vertices == v8)
          {
LABEL_33:

            goto LABEL_34;
          }
LABEL_32:

          goto LABEL_33;
        }
        v36 = v14;
      }
      faces = self->_faces;
      -[ARMeshGeometry faces](v6, "faces");
      v16 = (ARGeometryElement *)objc_claimAutoreleasedReturnValue();
      v37 = faces;
      if (faces == v16)
      {
        v33 = vertices;
        v34 = normals;
      }
      else
      {
        v17 = self->_faces;
        -[ARMeshGeometry faces](v6, "faces");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[ARGeometryElement isEqual:](v17, "isEqual:"))
        {
          v10 = 0;
LABEL_28:

LABEL_29:
          v14 = v36;
          if (normals == v12)
            goto LABEL_31;
          goto LABEL_30;
        }
        v33 = vertices;
        v34 = normals;
      }
      classification = self->_classification;
      -[ARMeshGeometry classification](v6, "classification");
      v19 = (ARGeometrySource *)objc_claimAutoreleasedReturnValue();
      if (classification == v19)
      {
        v32 = v3;
      }
      else
      {
        v20 = self->_classification;
        -[ARMeshGeometry classification](v6, "classification");
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = v20;
        v23 = (void *)v21;
        if (!-[ARGeometrySource isEqual:](v22, "isEqual:", v21))
        {
          v10 = 0;
          vertices = v33;
          goto LABEL_26;
        }
        v31 = v23;
        v32 = v3;
      }
      colors = self->_colors;
      -[ARMeshGeometry colors](v6, "colors");
      v25 = objc_claimAutoreleasedReturnValue();
      if (colors == (ARGeometrySource *)v25)
      {

        v10 = 1;
      }
      else
      {
        v26 = (void *)v25;
        v27 = self->_colors;
        -[ARMeshGeometry colors](v6, "colors");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[ARGeometrySource isEqual:](v27, "isEqual:", v28);

      }
      v29 = classification == v19;
      v3 = v32;
      vertices = v33;
      v23 = v31;
      if (v29)
      {
LABEL_27:

        normals = v34;
        if (v37 == v16)
          goto LABEL_29;
        goto LABEL_28;
      }
LABEL_26:

      goto LABEL_27;
    }
    v10 = 0;
  }
LABEL_34:

  return v10;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[ARMeshGeometry vertices](self, "vertices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(" vertices=\"%@\"), v7);

  -[ARMeshGeometry normals](self, "normals");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(" normals=\"%@\"), v8);

  -[ARMeshGeometry faces](self, "faces");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(" faces=\"%@\"), v9);

  -[ARMeshGeometry classification](self, "classification");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[ARMeshGeometry classification](self, "classification");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR(" classification=\"%@\"), v11);

  }
  -[ARMeshGeometry colors](self, "colors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[ARMeshGeometry colors](self, "colors");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR(" colors=\"%@\"), v13);

  }
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (ARGeometrySource)vertices
{
  return self->_vertices;
}

- (void)setVertices:(id)a3
{
  objc_storeStrong((id *)&self->_vertices, a3);
}

- (ARGeometrySource)normals
{
  return self->_normals;
}

- (void)setNormals:(id)a3
{
  objc_storeStrong((id *)&self->_normals, a3);
}

- (ARGeometryElement)faces
{
  return self->_faces;
}

- (void)setFaces:(id)a3
{
  objc_storeStrong((id *)&self->_faces, a3);
}

- (ARGeometrySource)classification
{
  return self->_classification;
}

- (void)setClassification:(id)a3
{
  objc_storeStrong((id *)&self->_classification, a3);
}

- (ARGeometrySource)colors
{
  return self->_colors;
}

- (void)setColors:(id)a3
{
  objc_storeStrong((id *)&self->_colors, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colors, 0);
  objc_storeStrong((id *)&self->_classification, 0);
  objc_storeStrong((id *)&self->_faces, 0);
  objc_storeStrong((id *)&self->_normals, 0);
  objc_storeStrong((id *)&self->_vertices, 0);
}

@end
