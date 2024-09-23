@implementation GEOPDLensProjection

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOPDLensProjection;
  -[GEOPDLensProjection description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDLensProjection dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDLensProjection _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  __int16 v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_WORD *)(a1 + 84);
  if ((v5 & 0x200) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 80));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("type"));

    v5 = *(_WORD *)(a1 + 84);
    if ((v5 & 8) == 0)
    {
LABEL_4:
      if ((v5 & 4) == 0)
        goto LABEL_5;
      goto LABEL_18;
    }
  }
  else if ((v5 & 8) == 0)
  {
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v8 = CFSTR("fovS");
  else
    v8 = CFSTR("fov_s");
  objc_msgSend(v4, "setObject:forKey:", v7, v8);

  v5 = *(_WORD *)(a1 + 84);
  if ((v5 & 4) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_22;
  }
LABEL_18:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 24));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v10 = CFSTR("fovH");
  else
    v10 = CFSTR("fov_h");
  objc_msgSend(v4, "setObject:forKey:", v9, v10);

  v5 = *(_WORD *)(a1 + 84);
  if ((v5 & 0x10) == 0)
  {
LABEL_6:
    if ((v5 & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 40));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("k2"));

  v5 = *(_WORD *)(a1 + 84);
  if ((v5 & 0x20) == 0)
  {
LABEL_7:
    if ((v5 & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 48));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("k3"));

  v5 = *(_WORD *)(a1 + 84);
  if ((v5 & 0x40) == 0)
  {
LABEL_8:
    if ((v5 & 1) == 0)
      goto LABEL_9;
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 56));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("k4"));

  v5 = *(_WORD *)(a1 + 84);
  if ((v5 & 1) == 0)
  {
LABEL_9:
    if ((v5 & 2) == 0)
      goto LABEL_10;
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 8));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("cx"));

  v5 = *(_WORD *)(a1 + 84);
  if ((v5 & 2) == 0)
  {
LABEL_10:
    if ((v5 & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 16));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("cy"));

  v5 = *(_WORD *)(a1 + 84);
  if ((v5 & 0x80) == 0)
  {
LABEL_11:
    if ((v5 & 0x100) == 0)
      return v4;
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 64));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("lx"));

  if ((*(_WORD *)(a1 + 84) & 0x100) != 0)
  {
LABEL_28:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 72));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("ly"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDLensProjection _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDLensProjectionReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  __int16 flags;
  id v5;

  v5 = a3;
  flags = (__int16)self->_flags;
  if ((flags & 0x200) != 0)
  {
    PBDataWriterWriteInt32Field();
    flags = (__int16)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((flags & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  flags = (__int16)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_4:
    if ((flags & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteDoubleField();
  flags = (__int16)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_5:
    if ((flags & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteDoubleField();
  flags = (__int16)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_6:
    if ((flags & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteDoubleField();
  flags = (__int16)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_7:
    if ((flags & 1) == 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteDoubleField();
  flags = (__int16)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_8:
    if ((flags & 2) == 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteDoubleField();
  flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_9:
    if ((flags & 0x80) == 0)
      goto LABEL_10;
LABEL_21:
    PBDataWriterWriteDoubleField();
    if ((*(_WORD *)&self->_flags & 0x100) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_20:
  PBDataWriterWriteDoubleField();
  flags = (__int16)self->_flags;
  if ((flags & 0x80) != 0)
    goto LABEL_21;
LABEL_10:
  if ((flags & 0x100) != 0)
LABEL_11:
    PBDataWriterWriteDoubleField();
LABEL_12:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int16 flags;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  flags = (__int16)self->_flags;
  if ((flags & 0x200) != 0)
  {
    *((_DWORD *)result + 20) = self->_type;
    *((_WORD *)result + 42) |= 0x200u;
    flags = (__int16)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((flags & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)result + 4) = *(_QWORD *)&self->_fovS;
  *((_WORD *)result + 42) |= 8u;
  flags = (__int16)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_4:
    if ((flags & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  *((_QWORD *)result + 3) = *(_QWORD *)&self->_fovH;
  *((_WORD *)result + 42) |= 4u;
  flags = (__int16)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_5:
    if ((flags & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  *((_QWORD *)result + 5) = *(_QWORD *)&self->_k2;
  *((_WORD *)result + 42) |= 0x10u;
  flags = (__int16)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_6:
    if ((flags & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  *((_QWORD *)result + 6) = *(_QWORD *)&self->_k3;
  *((_WORD *)result + 42) |= 0x20u;
  flags = (__int16)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_7:
    if ((flags & 1) == 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  *((_QWORD *)result + 7) = *(_QWORD *)&self->_k4;
  *((_WORD *)result + 42) |= 0x40u;
  flags = (__int16)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_8:
    if ((flags & 2) == 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  *((_QWORD *)result + 1) = *(_QWORD *)&self->_cx;
  *((_WORD *)result + 42) |= 1u;
  flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_9:
    if ((flags & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_21;
  }
LABEL_20:
  *((_QWORD *)result + 2) = *(_QWORD *)&self->_cy;
  *((_WORD *)result + 42) |= 2u;
  flags = (__int16)self->_flags;
  if ((flags & 0x80) == 0)
  {
LABEL_10:
    if ((flags & 0x100) == 0)
      return result;
    goto LABEL_11;
  }
LABEL_21:
  *((_QWORD *)result + 8) = *(_QWORD *)&self->_lx;
  *((_WORD *)result + 42) |= 0x80u;
  if ((*(_WORD *)&self->_flags & 0x100) == 0)
    return result;
LABEL_11:
  *((_QWORD *)result + 9) = *(_QWORD *)&self->_ly;
  *((_WORD *)result + 42) |= 0x100u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 flags;
  __int16 v6;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_52;
  flags = (__int16)self->_flags;
  v6 = *((_WORD *)v4 + 42);
  if ((flags & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 42) & 0x200) == 0 || self->_type != *((_DWORD *)v4 + 20))
      goto LABEL_52;
  }
  else if ((*((_WORD *)v4 + 42) & 0x200) != 0)
  {
LABEL_52:
    v7 = 0;
    goto LABEL_53;
  }
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_fovS != *((double *)v4 + 4))
      goto LABEL_52;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_52;
  }
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_fovH != *((double *)v4 + 3))
      goto LABEL_52;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_52;
  }
  if ((flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_k2 != *((double *)v4 + 5))
      goto LABEL_52;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_52;
  }
  if ((flags & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_k3 != *((double *)v4 + 6))
      goto LABEL_52;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_52;
  }
  if ((flags & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_k4 != *((double *)v4 + 7))
      goto LABEL_52;
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_52;
  }
  if ((flags & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_cx != *((double *)v4 + 1))
      goto LABEL_52;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_52;
  }
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_cy != *((double *)v4 + 2))
      goto LABEL_52;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_52;
  }
  if ((flags & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_lx != *((double *)v4 + 8))
      goto LABEL_52;
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_52;
  }
  if ((*(_WORD *)&self->_flags & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 42) & 0x100) == 0 || self->_ly != *((double *)v4 + 9))
      goto LABEL_52;
    v7 = 1;
  }
  else
  {
    v7 = (v6 & 0x100) == 0;
  }
LABEL_53:

  return v7;
}

- (unint64_t)hash
{
  __int16 flags;
  double fovS;
  double v5;
  long double v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  double fovH;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  double k2;
  double v16;
  long double v17;
  double v18;
  unint64_t v19;
  double k3;
  double v21;
  long double v22;
  double v23;
  unint64_t v24;
  double k4;
  double v26;
  long double v27;
  double v28;
  unint64_t v29;
  unint64_t v30;
  double cx;
  double v32;
  long double v33;
  double v34;
  unint64_t v35;
  unint64_t v36;
  double cy;
  double v38;
  long double v39;
  double v40;
  unint64_t v41;
  double lx;
  double v43;
  long double v44;
  double v45;
  unint64_t v46;
  double ly;
  double v48;
  long double v49;
  double v50;
  unint64_t v52;
  uint64_t v53;

  flags = (__int16)self->_flags;
  if ((flags & 0x200) != 0)
  {
    v53 = 2654435761 * self->_type;
    if ((flags & 8) != 0)
      goto LABEL_3;
LABEL_8:
    v8 = 0;
    goto LABEL_11;
  }
  v53 = 0;
  if ((flags & 8) == 0)
    goto LABEL_8;
LABEL_3:
  fovS = self->_fovS;
  v5 = -fovS;
  if (fovS >= 0.0)
    v5 = self->_fovS;
  v6 = floor(v5 + 0.5);
  v7 = (v5 - v6) * 1.84467441e19;
  v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0)
      v8 += (unint64_t)v7;
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
LABEL_11:
  if ((flags & 4) != 0)
  {
    fovH = self->_fovH;
    v11 = -fovH;
    if (fovH >= 0.0)
      v11 = self->_fovH;
    v12 = floor(v11 + 0.5);
    v13 = (v11 - v12) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  if ((flags & 0x10) != 0)
  {
    k2 = self->_k2;
    v16 = -k2;
    if (k2 >= 0.0)
      v16 = self->_k2;
    v17 = floor(v16 + 0.5);
    v18 = (v16 - v17) * 1.84467441e19;
    v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0)
        v14 += (unint64_t)v18;
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    v14 = 0;
  }
  if ((flags & 0x20) != 0)
  {
    k3 = self->_k3;
    v21 = -k3;
    if (k3 >= 0.0)
      v21 = self->_k3;
    v22 = floor(v21 + 0.5);
    v23 = (v21 - v22) * 1.84467441e19;
    v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0)
        v19 += (unint64_t)v23;
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    v19 = 0;
  }
  if ((flags & 0x40) != 0)
  {
    k4 = self->_k4;
    v26 = -k4;
    if (k4 >= 0.0)
      v26 = self->_k4;
    v27 = floor(v26 + 0.5);
    v28 = (v26 - v27) * 1.84467441e19;
    v24 = 2654435761u * (unint64_t)fmod(v27, 1.84467441e19);
    if (v28 >= 0.0)
    {
      if (v28 > 0.0)
        v24 += (unint64_t)v28;
    }
    else
    {
      v24 -= (unint64_t)fabs(v28);
    }
  }
  else
  {
    v24 = 0;
  }
  v52 = v19;
  if ((flags & 1) != 0)
  {
    cx = self->_cx;
    v32 = -cx;
    if (cx >= 0.0)
      v32 = self->_cx;
    v33 = floor(v32 + 0.5);
    v34 = (v32 - v33) * 1.84467441e19;
    v30 = 2654435761u * (unint64_t)fmod(v33, 1.84467441e19);
    v29 = v9;
    if (v34 >= 0.0)
    {
      if (v34 > 0.0)
        v30 += (unint64_t)v34;
    }
    else
    {
      v30 -= (unint64_t)fabs(v34);
    }
  }
  else
  {
    v29 = v9;
    v30 = 0;
  }
  v35 = v8;
  if ((flags & 2) != 0)
  {
    cy = self->_cy;
    v38 = -cy;
    if (cy >= 0.0)
      v38 = self->_cy;
    v39 = floor(v38 + 0.5);
    v40 = (v38 - v39) * 1.84467441e19;
    v36 = 2654435761u * (unint64_t)fmod(v39, 1.84467441e19);
    if (v40 >= 0.0)
    {
      if (v40 > 0.0)
        v36 += (unint64_t)v40;
    }
    else
    {
      v36 -= (unint64_t)fabs(v40);
    }
  }
  else
  {
    v36 = 0;
  }
  if ((flags & 0x80) != 0)
  {
    lx = self->_lx;
    v43 = -lx;
    if (lx >= 0.0)
      v43 = self->_lx;
    v44 = floor(v43 + 0.5);
    v45 = (v43 - v44) * 1.84467441e19;
    v41 = 2654435761u * (unint64_t)fmod(v44, 1.84467441e19);
    if (v45 >= 0.0)
    {
      if (v45 > 0.0)
        v41 += (unint64_t)v45;
    }
    else
    {
      v41 -= (unint64_t)fabs(v45);
    }
  }
  else
  {
    v41 = 0;
  }
  if ((flags & 0x100) != 0)
  {
    ly = self->_ly;
    v48 = -ly;
    if (ly >= 0.0)
      v48 = self->_ly;
    v49 = floor(v48 + 0.5);
    v50 = (v48 - v49) * 1.84467441e19;
    v46 = 2654435761u * (unint64_t)fmod(v49, 1.84467441e19);
    if (v50 >= 0.0)
    {
      if (v50 > 0.0)
        v46 += (unint64_t)v50;
    }
    else
    {
      v46 -= (unint64_t)fabs(v50);
    }
  }
  else
  {
    v46 = 0;
  }
  return v35 ^ v53 ^ v29 ^ v14 ^ v52 ^ v24 ^ v30 ^ v36 ^ v41 ^ v46;
}

@end
