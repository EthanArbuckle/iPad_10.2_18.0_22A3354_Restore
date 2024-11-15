@implementation MKJunction

- (MKJunction)initWithJunction:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "junctionType");
  v6 = objc_msgSend(v4, "maneuverType");
  v7 = objc_msgSend(v4, "drivingSide");
  v8 = objc_msgSend(v4, "elements");
  v9 = objc_msgSend(v4, "numElements");

  return -[MKJunction initWithType:maneuver:drivingSide:elements:count:](self, "initWithType:maneuver:drivingSide:elements:count:", v5, v6, v7, v8, v9);
}

- (MKJunction)initWithType:(int)a3 maneuver:(int)a4 drivingSide:(int)a5 elements:(GEOJunctionElement *)a6 count:(unint64_t)a7
{
  MKJunction *v12;
  MKJunction *v13;
  MKJunction *v14;
  BOOL v15;
  _BOOL4 v16;
  uint64_t v17;
  unint64_t v18;
  unsigned int v19;
  GEOJunctionElement *v20;
  GEOJunctionElement **snapped;
  uint64_t v22;
  _QWORD *v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t i;
  GEOJunctionElement *v32;
  objc_super v34;
  _QWORD v35[2];
  uint64_t (*v36)(uint64_t, uint64_t, uint64_t, char *);
  void *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  _OWORD v44[3];
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v34.receiver = self;
  v34.super_class = (Class)MKJunction;
  v12 = -[MKJunction init](&v34, sel_init);
  v13 = v12;
  if (!v12)
  {
LABEL_43:
    v14 = v13;
    goto LABEL_44;
  }
  v14 = 0;
  if (((a4 - 4) > 0x3E || ((1 << (a4 - 4)) & 0x7000000086400081) == 0) && a4 != 88)
  {
    v14 = 0;
    v15 = (a4 & 0xFFFFFFFE) != 0x14 || a7 > 2;
    v16 = v15;
    if (a7 && v16)
    {
      v17 = 8;
      v18 = a7;
      while (*(int *)((char *)&a6->var0 + v17) != 2)
      {
        v14 = 0;
        v17 += 16;
        if (!--v18)
          goto LABEL_44;
      }
      v12->_type = a3;
      v12->_maneuver = a4;
      v19 = 1;
      v12->_drivingSide = a5;
      if (a4 <= 59)
      {
        switch(a4)
        {
          case 20:
          case 27:
            goto LABEL_23;
          case 21:
          case 28:
            goto LABEL_22;
          case 22:
          case 23:
          case 24:
          case 25:
          case 26:
            goto LABEL_45;
          default:
            if (a4 == 1)
              goto LABEL_23;
            if (a4 == 2)
              goto LABEL_22;
            goto LABEL_45;
        }
      }
      switch(a4)
      {
        case '<':
        case '>':
          break;
        case '=':
        case '?':
LABEL_22:
          v19 = 2;
          break;
        default:
LABEL_45:
          v19 = 0;
          break;
      }
LABEL_23:
      v20 = (GEOJunctionElement *)malloc_type_calloc(0x10uLL, a7, 0x39B05E4AuLL);
      v13->_elements = v20;
      memcpy(v20, a6, 16 * a7);
      v13->_count = a7;
      snapped = v13->_snapped;
      MKSnappedRouteFillWithElements((uint64_t)v13->_elements, a7, v13->_snapped, v19);
      if ((a4 - 41) < 0x13)
      {
        v22 = (a4 - 40);
        if (v22 > 6)
          goto LABEL_38;
        v39 = 0;
        v40 = &v39;
        v41 = 0x2020000000;
        v42 = 0;
        v35[0] = MEMORY[0x1E0C809B0];
        v35[1] = 3221225472;
        v36 = __MKJunctionManeuverShouldShowNAElementsForManeuverTypeInSnappedJunction_block_invoke;
        v37 = &unk_1E20DF7E0;
        v38 = &v39;
        v23 = v35;
        v44[0] = xmmword_18B2AFCB0;
        v44[1] = xmmword_18B2A9880;
        v44[2] = xmmword_18B2AFCC0;
        v45 = 5;
        v24 = a5 == 0;
        v25 = a5 ? 6 : 0;
        v26 = 7;
        if (v24)
        {
          v27 = 1;
        }
        else
        {
          v26 = -1;
          v27 = -1;
        }
        v43 = 0;
        v28 = v26 - v27;
        do
        {
          v36((uint64_t)v23, *((_QWORD *)v44 + v25), (uint64_t)snapped[*((_QWORD *)v44 + v25)], &v43);
          if (v43)
            v29 = 1;
          else
            v29 = v28 == v25;
          v25 += v27;
        }
        while (!v29);

        v30 = v40[3];
        _Block_object_dispose(&v39, 8);
        if (v30 != v22)
        {
LABEL_38:
          for (i = 0; i != 8; ++i)
          {
            v32 = snapped[i];
            if (v32 && v32->var2 != 2)
              snapped[i] = 0;
          }
        }
      }
      goto LABEL_43;
    }
  }
LABEL_44:

  return v14;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_elements);
  v3.receiver = self;
  v3.super_class = (Class)MKJunction;
  -[MKJunction dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;
  unint64_t i;
  uint64_t v7;
  unint64_t v8;
  BOOL v9;

  v4 = a3;
  objc_opt_class();
  v5 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    for (i = 0; i != 8; ++i)
    {
      v7 = v4[i + 5];
      v8 = (unint64_t)self->_snapped[i];
      if (v7)
        v9 = v8 == 0;
      else
        v9 = 1;
      if (v9)
      {
        if (v7 | v8)
          break;
      }
      else if (*(_DWORD *)(v7 + 4) != *(_DWORD *)(v8 + 4) || *(_DWORD *)(v7 + 8) != *(_DWORD *)(v8 + 8))
      {
        break;
      }
      v5 = i > 6;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  GEOJunctionElement **snapped;

  v3 = objc_msgSend((id)objc_opt_class(), "hash");
  v4 = 0;
  snapped = self->_snapped;
  do
  {
    if (snapped[v4])
      v3 ^= PBHashBytes();
    ++v4;
  }
  while (v4 != 8);
  return v3;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  GEOJunctionElement *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  int type;
  __CFString *v13;
  __CFString *v14;
  void *v15;

  v3 = (void *)objc_opt_new();
  if (self->_count)
  {
    v4 = 0;
    v5 = 0;
    do
    {
      v6 = &self->_elements[v4];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<GEOJunctionElement angle: %ld (%u), type: %ld (%u), usage: %ld (%u)>"), v6->var0, *(_BYTE *)&v6->var3 & 1, v6->var1, (*(_BYTE *)&v6->var3 >> 1) & 1, v6->var2, (*(_BYTE *)&v6->var3 >> 2) & 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v7);

      ++v5;
      ++v4;
    }
    while (v5 < self->_count);
  }
  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  type = self->_type;
  if (type)
  {
    if (type == 1)
    {
      v13 = CFSTR("JCTTYPE_ROUNDABOUT");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_type);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v13 = CFSTR("JCTTYPE_NORMAL");
  }
  v14 = CFSTR("NO_TURN");
  switch(self->_maneuver)
  {
    case 0:
      break;
    case 1:
      v14 = CFSTR("LEFT_TURN");
      break;
    case 2:
      v14 = CFSTR("RIGHT_TURN");
      break;
    case 3:
      v14 = CFSTR("STRAIGHT_AHEAD");
      break;
    case 4:
      v14 = CFSTR("U_TURN");
      break;
    case 5:
      v14 = CFSTR("FOLLOW_ROAD");
      break;
    case 6:
      v14 = CFSTR("ENTER_ROUNDABOUT");
      break;
    case 7:
      v14 = CFSTR("EXIT_ROUNDABOUT");
      break;
    case 0xB:
      v14 = CFSTR("OFF_RAMP");
      break;
    case 0xC:
      v14 = CFSTR("ON_RAMP");
      break;
    case 0x10:
      v14 = CFSTR("ARRIVE_END_OF_NAVIGATION");
      break;
    case 0x11:
      v14 = CFSTR("START_ROUTE");
      break;
    case 0x12:
      v14 = CFSTR("ARRIVE_AT_DESTINATION");
      break;
    case 0x14:
      v14 = CFSTR("KEEP_LEFT");
      break;
    case 0x15:
      v14 = CFSTR("KEEP_RIGHT");
      break;
    case 0x16:
      v14 = CFSTR("ENTER_FERRY");
      break;
    case 0x17:
      v14 = CFSTR("EXIT_FERRY");
      break;
    case 0x18:
      v14 = CFSTR("CHANGE_FERRY");
      break;
    case 0x19:
      v14 = CFSTR("START_ROUTE_WITH_U_TURN");
      break;
    case 0x1A:
      v14 = CFSTR("U_TURN_AT_ROUNDABOUT");
      break;
    case 0x1B:
      v14 = CFSTR("LEFT_TURN_AT_END");
      break;
    case 0x1C:
      v14 = CFSTR("RIGHT_TURN_AT_END");
      break;
    case 0x1D:
      v14 = CFSTR("HIGHWAY_OFF_RAMP_LEFT");
      break;
    case 0x1E:
      v14 = CFSTR("HIGHWAY_OFF_RAMP_RIGHT");
      break;
    case 0x21:
      v14 = CFSTR("ARRIVE_AT_DESTINATION_LEFT");
      break;
    case 0x22:
      v14 = CFSTR("ARRIVE_AT_DESTINATION_RIGHT");
      break;
    case 0x23:
      v14 = CFSTR("U_TURN_WHEN_POSSIBLE");
      break;
    case 0x27:
      v14 = CFSTR("ARRIVE_END_OF_DIRECTIONS");
      break;
    case 0x29:
      v14 = CFSTR("ROUNDABOUT_EXIT_1");
      break;
    case 0x2A:
      v14 = CFSTR("ROUNDABOUT_EXIT_2");
      break;
    case 0x2B:
      v14 = CFSTR("ROUNDABOUT_EXIT_3");
      break;
    case 0x2C:
      v14 = CFSTR("ROUNDABOUT_EXIT_4");
      break;
    case 0x2D:
      v14 = CFSTR("ROUNDABOUT_EXIT_5");
      break;
    case 0x2E:
      v14 = CFSTR("ROUNDABOUT_EXIT_6");
      break;
    case 0x2F:
      v14 = CFSTR("ROUNDABOUT_EXIT_7");
      break;
    case 0x30:
      v14 = CFSTR("ROUNDABOUT_EXIT_8");
      break;
    case 0x31:
      v14 = CFSTR("ROUNDABOUT_EXIT_9");
      break;
    case 0x32:
      v14 = CFSTR("ROUNDABOUT_EXIT_10");
      break;
    case 0x33:
      v14 = CFSTR("ROUNDABOUT_EXIT_11");
      break;
    case 0x34:
      v14 = CFSTR("ROUNDABOUT_EXIT_12");
      break;
    case 0x35:
      v14 = CFSTR("ROUNDABOUT_EXIT_13");
      break;
    case 0x36:
      v14 = CFSTR("ROUNDABOUT_EXIT_14");
      break;
    case 0x37:
      v14 = CFSTR("ROUNDABOUT_EXIT_15");
      break;
    case 0x38:
      v14 = CFSTR("ROUNDABOUT_EXIT_16");
      break;
    case 0x39:
      v14 = CFSTR("ROUNDABOUT_EXIT_17");
      break;
    case 0x3A:
      v14 = CFSTR("ROUNDABOUT_EXIT_18");
      break;
    case 0x3B:
      v14 = CFSTR("ROUNDABOUT_EXIT_19");
      break;
    case 0x3C:
      v14 = CFSTR("SHARP_LEFT_TURN");
      break;
    case 0x3D:
      v14 = CFSTR("SHARP_RIGHT_TURN");
      break;
    case 0x3E:
      v14 = CFSTR("SLIGHT_LEFT_TURN");
      break;
    case 0x3F:
      v14 = CFSTR("SLIGHT_RIGHT_TURN");
      break;
    case 0x40:
      v14 = CFSTR("CHANGE_HIGHWAY");
      break;
    case 0x41:
      v14 = CFSTR("CHANGE_HIGHWAY_LEFT");
      break;
    case 0x42:
      v14 = CFSTR("CHANGE_HIGHWAY_RIGHT");
      break;
    case 0x50:
      v14 = CFSTR("TOLL_STATION");
      break;
    case 0x51:
      v14 = CFSTR("ENTER_TUNNEL");
      break;
    case 0x52:
      v14 = CFSTR("WAYPOINT_STOP");
      break;
    case 0x53:
      v14 = CFSTR("WAYPOINT_STOP_LEFT");
      break;
    case 0x54:
      v14 = CFSTR("WAYPOINT_STOP_RIGHT");
      break;
    case 0x55:
      v14 = CFSTR("RESUME_ROUTE");
      break;
    case 0x56:
      v14 = CFSTR("RESUME_ROUTE_WITH_U_TURN");
      break;
    case 0x57:
      v14 = CFSTR("CUSTOM");
      break;
    case 0x58:
      v14 = CFSTR("TURN_AROUND");
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_maneuver);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
  }
  objc_msgSend(v8, "stringWithFormat:", CFSTR("<%@: %p, elements: %@, type: %@, maneuver: %@>"), v10, self, v11, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (BOOL)willSnapToSharpRight
{
  uint64_t v2;
  uint64_t v3;
  GEOJunctionElement *v4;

  if (self->_maneuver != 2)
    return 0;
  v2 = 0;
  v3 = -1;
  do
  {
    v4 = self->_snapped[v2];
    if (v4)
    {
      if (v4->var2 == 2)
        v3 = v2;
    }
    ++v2;
  }
  while (v2 != 8);
  return ((v3 - 3) & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (BOOL)willSnapToRightHandTurn
{
  return -[MKJunction _willSnapToNinetyDegreesForManeuverTypes:](self, "_willSnapToNinetyDegreesForManeuverTypes:", &unk_1E215A1B0);
}

- (BOOL)rightOrLeftTurnWillSnapToNinetyDegrees
{
  return -[MKJunction _willSnapToNinetyDegreesForManeuverTypes:](self, "_willSnapToNinetyDegreesForManeuverTypes:", &unk_1E215A1C8);
}

- (BOOL)_willSnapToNinetyDegreesForManeuverTypes:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  GEOJunctionElement *v9;
  BOOL v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_maneuver);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);

  if (v6)
  {
    v7 = 0;
    v8 = -1;
    do
    {
      v9 = self->_snapped[v7];
      if (v9 && v9->var2 == 2)
        v8 = v7;
      ++v7;
    }
    while (v7 != 8);
    v10 = ((v8 - 2) & 0xFFFFFFFFFFFFFFFBLL) == 0;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)getArrowPath:(id *)a3 arrowStrokePath:(id *)a4 intersectionBackgroundPath:(id *)a5 strokePath:(id *)a6 withSize:(CGSize)a7 metrics:(id *)a8 drivingSide:(int)a9 visualCenter:(CGPoint *)a10
{
  double height;
  double width;
  uint64_t v17;
  void *v19;
  void *v20;
  double var3;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  char v28;
  uint64_t i;
  GEOJunctionElement *v30;
  uint64_t v31;
  uint64_t v32;
  GEOJunctionElement *v33;
  double v34;
  __double2 v35;
  _MKJunctionElement *v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  double v59;
  long double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  long double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  BOOL v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  _BOOL4 v94;
  uint64_t v95;
  void *v96;
  void *v97;
  id *v98;
  double v99;
  double v100;
  double var6;
  double v102;
  double v103;
  double v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  double v108;
  double v109;
  _BYTE __dst[496];

  height = a7.height;
  width = a7.width;
  if (self->_type == 1)
  {
    v17 = *(_QWORD *)&a9;
    memcpy(__dst, a8, sizeof(__dst));
    -[MKJunction getRoundaboutArrowPath:intersectionBackgroundPath:strokePath:withSize:metrics:drivingSide:visualCenter:](self, "getRoundaboutArrowPath:intersectionBackgroundPath:strokePath:withSize:metrics:drivingSide:visualCenter:", a3, a5, a6, __dst, v17, a10, width, height);
    return;
  }
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CEA390], "bezierPath", a3, a4, a5, a6, a8, *(_QWORD *)&a9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = 0;
  }
  v98 = a5;
  if (a6)
  {
    objc_msgSend(MEMORY[0x1E0CEA390], "bezierPath");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }
  var3 = a8->var3;
  v108 = 0.0;
  v109 = 0.0;
  memcpy(__dst, a8, sizeof(__dst));
  -[MKJunction getArrowPath:arrowStrokePath:pivot:withSize:metrics:visualCenter:](self, "getArrowPath:arrowStrokePath:pivot:withSize:metrics:visualCenter:", a3, a4, &v108, __dst, a10, width, height);
  var6 = a8->var6;
  v22 = var3 * 0.5;
  v23 = v108;
  v24 = v109;
  v25 = width - v108;
  v26 = height - v109;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 8);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  for (i = 0; i != 8; ++i)
  {
    v30 = self->_snapped[i];
    if (v30 && v30->var2 == 2)
    {
      if ((i & 0x7FFFFFFFFFFFFFF9) != 0)
        v31 = 337;
      else
        v31 = 336;
      v28 = *(&a8->var0 + v31);
    }
  }
  v32 = 0;
  v100 = fmin(fmin(fmin(v23, v24), v25), v26);
  do
  {
    v33 = self->_snapped[v32];
    if (v33 && (v33->var2 == 0) | v28 & 1)
    {
      v34 = (double)v32 * 0.785398163 + -1.57079633;
      v35 = __sincos_stret(v34 + -1.57079633);
      v36 = objc_alloc_init(_MKJunctionElement);
      -[_MKJunctionElement setLeftBasePoint:](v36, "setLeftBasePoint:", v22 * v35.__cosval, v22 * v35.__sinval);
      -[_MKJunctionElement setRightBasePoint:](v36, "setRightBasePoint:", var3 * -0.5 * v35.__cosval, var3 * -0.5 * v35.__sinval);
      -[_MKJunctionElement setAngle:](v36, "setAngle:", v34);
      objc_msgSend(v27, "addObject:", v36);

    }
    ++v32;
  }
  while (v32 != 8);
  if (var6 >= v22)
    v37 = var3 * 0.5;
  else
    v37 = var6;
  v38 = v100 - v37;
  if (objc_msgSend(v27, "count") == 1)
  {
    objc_msgSend(v27, "lastObject");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "leftBasePoint");
    v41 = v40;
    v43 = v42;
    objc_msgSend(v39, "rightBasePoint");
    v103 = v44;
    v46 = v45;
    objc_msgSend(v39, "leftEdgePointAtDistanceFromBase:", v38);
    v48 = v47;
    v50 = v49;
    objc_msgSend(v39, "rightEdgePointAtDistanceFromBase:", v38);
    v52 = v51;
    v54 = v53;
    objc_msgSend(v19, "moveToPoint:", v41, v43);
    objc_msgSend(v19, "addLineToPoint:", v48, v50);
    if (fabs(v37) > 2.22044605e-16)
      -[MKJunction _addJunctionStemCapToPath:fromStartPoint:topEndPoint:cornerRadius:](self, "_addJunctionStemCapToPath:fromStartPoint:topEndPoint:cornerRadius:", v19, v48, v50, v52, v54, v37);
    objc_msgSend(v19, "addLineToPoint:", v52, v54);
    objc_msgSend(v19, "addLineToPoint:", v103, v46);
    objc_msgSend(v19, "closePath");
    objc_msgSend(v20, "moveToPoint:", v41, v43);
    objc_msgSend(v20, "addLineToPoint:", v48, v50);
    objc_msgSend(v20, "moveToPoint:", v103, v46);
    objc_msgSend(v20, "addLineToPoint:", v52, v54);
    goto LABEL_77;
  }
  v99 = v37;
  if ((unint64_t)objc_msgSend(v27, "count") >= 2)
  {
    v104 = v100 - v37;
    if (!objc_msgSend(v27, "count"))
    {
LABEL_76:
      objc_msgSend(v27, "objectAtIndex:", 0);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "leftEdgePointAtDistanceFromBase:", v104);
      objc_msgSend(v19, "addLineToPoint:");
LABEL_77:

      goto LABEL_78;
    }
    v55 = 0;
    v102 = fabs(v37);
    while (1)
    {
      objc_msgSend(v27, "objectAtIndex:", v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      if (v55 == objc_msgSend(v27, "count") - 1)
        v57 = 0;
      else
        v57 = v55 + 1;
      objc_msgSend(v27, "objectAtIndex:", v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "angle");
      v60 = v59;
      objc_msgSend(v56, "rightBasePoint");
      v62 = v61;
      v64 = v63;
      v65 = tan(v60);
      v66 = -v65;
      if (v65 >= 0.0)
        v66 = v65;
      if (v66 <= 10000000.0)
        v67 = v64 - v65 * v62;
      else
        v67 = v62;
      if (v66 <= 10000000.0)
        v68 = v65;
      else
        v68 = INFINITY;
      objc_msgSend(v58, "angle");
      v70 = v69;
      objc_msgSend(v58, "leftBasePoint");
      v72 = v71;
      v74 = v73;
      v75 = tan(v70);
      v76 = -v75;
      if (v75 >= 0.0)
        v76 = v75;
      v77 = v76 <= 10000000.0;
      if (v76 <= 10000000.0)
        v78 = v74 - v75 * v72;
      else
        v78 = v72;
      if (!v77)
        v75 = INFINITY;
      if (v68 == v75)
      {
        v79 = NAN;
        v80 = NAN;
      }
      else
      {
        if (v68 == INFINITY)
        {
          v80 = v67;
LABEL_57:
          v81 = v104;
          v79 = v78 + v75 * v80;
          goto LABEL_58;
        }
        if (v75 == INFINITY)
        {
          v80 = v78;
          v75 = v68;
          v78 = v67;
          goto LABEL_57;
        }
        v78 = v78 - v67;
        v80 = v78 / (v68 - v75);
        v79 = v67 + v68 * v80;
      }
      v81 = v104;
LABEL_58:
      objc_msgSend(v56, "leftEdgePointAtDistanceFromBase:", v81, v78);
      v83 = v82;
      v85 = v84;
      objc_msgSend(v56, "rightEdgePointAtDistanceFromBase:", v81);
      v87 = v86;
      v89 = v88;
      objc_msgSend(v58, "leftEdgePointAtDistanceFromBase:", v81);
      v92 = v90;
      v93 = v91;
      v94 = fabs(v80) == INFINITY;
      if (fabs(v79) == INFINITY)
        v94 = 1;
      if (v94)
      {
        v79 = (v89 + v91) * 0.5;
        v80 = (v87 + v90) * 0.5;
      }
      v95 = v55;
      if (v55)
        objc_msgSend(v19, "addLineToPoint:", v83, v85);
      else
        objc_msgSend(v19, "moveToPoint:", v83, v85);
      if (v102 > 2.22044605e-16)
        -[MKJunction _addJunctionStemCapToPath:fromStartPoint:topEndPoint:cornerRadius:](self, "_addJunctionStemCapToPath:fromStartPoint:topEndPoint:cornerRadius:", v19, v83, v85, v87, v89, v99);
      objc_msgSend(v19, "addLineToPoint:", v87, v89);
      if (v55 == objc_msgSend(v27, "count") - 1)
      {
        objc_msgSend(v56, "rightBasePoint");
        objc_msgSend(v19, "addLineToPoint:");
        objc_msgSend(v27, "objectAtIndexedSubscript:", 0);
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "leftBasePoint");
        objc_msgSend(v19, "addLineToPoint:");

      }
      else
      {
        objc_msgSend(v19, "addLineToPoint:", v80, v79);
      }
      objc_msgSend(v20, "moveToPoint:", v87, v89);
      if (v95 == objc_msgSend(v27, "count") - 1)
      {
        objc_msgSend(v56, "rightBasePoint");
        objc_msgSend(v20, "addLineToPoint:");
        objc_msgSend(v27, "objectAtIndexedSubscript:", 0);
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v97, "leftBasePoint");
        objc_msgSend(v20, "moveToPoint:");

      }
      else
      {
        objc_msgSend(v20, "addLineToPoint:", v80, v79);
      }
      objc_msgSend(v20, "addLineToPoint:", v92, v93);

      v55 = v95 + 1;
      if (v95 + 1 >= (unint64_t)objc_msgSend(v27, "count"))
        goto LABEL_76;
    }
  }
LABEL_78:
  memset(__dst, 0, 48);
  CGAffineTransformMakeTranslation((CGAffineTransform *)__dst, v108, v109);
  v105 = *(_OWORD *)__dst;
  v106 = *(_OWORD *)&__dst[16];
  v107 = *(_OWORD *)&__dst[32];
  objc_msgSend(v19, "applyTransform:", &v105);
  v105 = *(_OWORD *)__dst;
  v106 = *(_OWORD *)&__dst[16];
  v107 = *(_OWORD *)&__dst[32];
  objc_msgSend(v20, "applyTransform:", &v105);
  if (v98)
    *v98 = objc_retainAutorelease(v19);
  if (a6)
    *a6 = objc_retainAutorelease(v20);

}

- (void)_addJunctionStemCapToPath:(id)a3 fromStartPoint:(CGPoint)a4 topEndPoint:(CGPoint)a5 cornerRadius:(double)a6
{
  double y;
  double x;
  CGFloat v10;
  CGFloat v11;
  float v12;
  float v13;
  double v14;
  float v15;
  float v16;

  y = a5.y;
  x = a5.x;
  v10 = (a4.x + a5.x) * 0.5;
  v11 = (a4.y + a5.y) * 0.5;
  v12 = a4.y - v11;
  v13 = a4.x - v10;
  v14 = atan2f(v12, v13);
  v15 = y - v11;
  v16 = x - v10;
  objc_msgSend(a3, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v10, v11, a6, v14, atan2f(v15, v16));
}

- (void)getArrowPath:(id *)a3 arrowStrokePath:(id *)a4 pivot:(CGPoint *)a5 withSize:(CGSize)a6 metrics:(id *)a7 visualCenter:(CGPoint *)a8
{
  double height;
  unint64_t v11;
  unint64_t v12;
  GEOJunctionElement *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double var27;
  double var26;
  double v20;
  double var15;
  double var16;
  double v23;
  void *v24;
  void *v25;
  double var2;
  char v27;
  double v28;
  double v29;
  char v30;
  char v31;
  void *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  double v37;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat v41;
  CGFloat MidX;
  CGFloat MidY;
  double var17;
  double v48;
  double v49;
  double tx;
  double v51;
  CGAffineTransform v52;
  CGAffineTransform v53;
  CGAffineTransform v54;
  _BYTE __dst[496];
  CGRect BoundingBox;
  CGRect v57;

  height = a6.height;
  v11 = 0;
  v12 = -1;
  do
  {
    v13 = self->_snapped[v11];
    if (v13 && v13->var2 == 2)
      v12 = v11;
    ++v11;
  }
  while (v11 != 8);
  v14 = a6.width * 0.5;
  v15 = *MEMORY[0x1E0C9D538];
  v16 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v17 = 0.0;
  var27 = 0.0;
  var26 = 0.0;
  switch(v12)
  {
    case 0uLL:
      var17 = a7->var17;
      if (var17 != 0.0)
      {
        var27 = a7->var5.height;
        var26 = height - var17 - var27;
        v16 = height - var26;
        v17 = (height - var26 - var27) * 0.5;
        goto LABEL_14;
      }
      var26 = height * 0.400000006;
      v16 = height - height * 0.400000006;
      v15 = v14;
      var27 = v16;
      break;
    case 1uLL:
    case 7uLL:
      var26 = a7->var26;
      var27 = a7->var27;
      goto LABEL_13;
    case 2uLL:
    case 6uLL:
      v20 = fmax(a7->var13 - a7->var2, 0.0);
      var15 = a7->var15;
      var16 = a7->var16;
      var26 = var15 - v20;
      var27 = var16 - v20;
      v23 = a6.width - (var16 - v20);
      if (v12 == 2)
        v15 = var16 - v20;
      else
        v15 = v23;
      v16 = height - var15;
      v14 = v15;
      break;
    case 3uLL:
    case 5uLL:
      var26 = a7->var22;
      var27 = a7->var23;
LABEL_13:
      v16 = height - var26 + 2.0;
LABEL_14:
      v15 = v14;
      break;
    case 4uLL:
      break;
    default:
      v17 = 0.0;
      var27 = 0.0;
      var26 = 0.0;
      break;
  }
  v48 = v15;
  v49 = v16;
  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPath");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPath");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  var2 = a7->var2;
  memset(&v54, 0, sizeof(v54));
  CGAffineTransformMakeTranslation(&v54, v14 - var2 * 0.5, height - v17);
  v27 = 0;
  if (v12)
    v28 = var2 * 0.5;
  else
    v28 = 0.0;
  tx = -var2;
  v51 = var26 + var2 * -0.5;
  v29 = var27 - v28 - a7->var5.height;
  v30 = 1;
  do
  {
    v31 = v30;
    v53 = v54;
    if ((v30 & 1) != 0)
      v32 = v24;
    else
      v32 = v25;
    v33 = v32;
    memcpy(__dst, a7, sizeof(__dst));
    MKArrowAppendInitialSegmentToPathInvertingCorners(v33, (uint64_t)__dst, &v53, 0, v51);
    if (v12 <= 7)
    {
      if (((1 << v12) & 0xAA) != 0)
      {
        v52.a = 0.0;
        v52.b = 0.0;
        v34 = *(_OWORD *)&v53.a;
        v35 = *(_OWORD *)&v53.c;
        v36 = *(_OWORD *)&v53.tx;
        v37 = anglesToExit[v12];
        memcpy(__dst, a7, sizeof(__dst));
        MKArrowAppendCurveToPathWithOptions(v33, v27, (double *)__dst, &v53, &v52.a, v37);
        if ((v31 & 1) != 0 && v12 != 3 && v12 != 5)
        {
          v48 = *(double *)&v36 + *(double *)&v35 * v52.b + *(double *)&v34 * v52.a;
          v49 = *((double *)&v36 + 1) + *((double *)&v35 + 1) * v52.b + *((double *)&v34 + 1) * v52.a;
        }
      }
      else
      {
        if (v12 != 2)
        {
          if (v12 != 6)
            goto LABEL_32;
          v52 = v53;
          CGAffineTransformScale((CGAffineTransform *)__dst, &v52, -1.0, 1.0);
          v53 = *(CGAffineTransform *)__dst;
          v52 = *(CGAffineTransform *)__dst;
          CGAffineTransformTranslate((CGAffineTransform *)__dst, &v52, tx, 0.0);
          v53 = *(CGAffineTransform *)__dst;
        }
        memcpy(__dst, a7, sizeof(__dst));
        MKArrowAppendRightAngleCurveToPath(v33, (double *)__dst, &v53);
      }
    }
LABEL_32:
    memcpy(__dst, a7, sizeof(__dst));
    MKArrowAppendSegmentToPath(v33, (uint64_t)__dst, &v53, v29);
    if (a8 != 0 && (v31 & 1) != 0)
    {
      BoundingBox = CGPathGetBoundingBox((CGPathRef)objc_msgSend(objc_retainAutorelease(v33), "CGPath"));
      x = BoundingBox.origin.x;
      y = BoundingBox.origin.y;
      width = BoundingBox.size.width;
      v41 = BoundingBox.size.height;
      MidX = CGRectGetMidX(BoundingBox);
      v57.origin.x = x;
      v57.origin.y = y;
      v57.size.width = width;
      v57.size.height = v41;
      MidY = CGRectGetMidY(v57);
      a8->x = MidX;
      a8->y = MidY;
    }
    memcpy(__dst, a7, sizeof(__dst));
    MKArrowAppendArrowheadToPathAndReturnMetricsWithStemAdjustment(v33, (uint64_t)__dst, 0, (__int128 *)&v53, 0.0);

    v30 = 0;
    v27 = 1;
  }
  while ((v31 & 1) != 0);
  if (a5)
  {
    a5->x = v48;
    a5->y = v49;
  }
  if (a3)
    *a3 = objc_retainAutorelease(v24);
  if (a4)
    *a4 = objc_retainAutorelease(v25);

}

- (id)roundaboutArrowWithSize:(CGSize)a3 metrics:(id *)a4 outerRadius:(double)a5 endAngle:(double)a6 pivot:(CGPoint *)a7
{
  double var2;
  _BOOL4 v11;
  int v12;
  double v13;
  CGFloat v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  __double2 v21;
  double v22;
  double v23;
  double v24;
  double v25;
  __double2 v26;
  double v27;
  double v28;
  __double2 v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  float v36;
  float v37;
  float v38;
  float v39;
  double v40;
  double v41;
  double v42;
  double v43;
  _BOOL4 v44;
  double v45;
  double v46;
  float v47;
  float v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  BOOL v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  __double2 v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  BOOL v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  __double2 v87;
  double v88;
  double v89;
  BOOL v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  BOOL v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  BOOL v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  __double2 v112;
  double v113;
  double v114;
  double v115;
  double v116;
  float v117;
  float v118;
  float v119;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  CGFloat v130;
  CGFloat v131;
  double v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  CGAffineTransform v142;
  CGAffineTransform v143;
  _BYTE __dst[496];

  var2 = a4->var2;
  v11 = a6 <= 0.0;
  if (a6 <= -3.14159265)
    v11 = 0;
  v12 = a6 >= 3.14159265 || v11;
  v138 = floor((a3.height - a5) * 0.5) - a4->var21;
  v13 = a3.height * 0.5;
  if (a7)
  {
    a7->x = a3.width * 0.5;
    a7->y = v13;
  }
  v14 = a3.height - a4->var20;
  v140 = (a3.width - var2) * 0.5;
  v141 = a3.width * 0.5;
  v15 = var2 + v140;
  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPath");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "moveToPoint:", var2 + v140, v14);
  v129 = v13 + v141 * -0.0;
  v17 = v129 + (var2 + v140) * 0.0;
  v18 = sqrt((v141 - v15) * (v141 - v15) + (v13 - v17) * (v13 - v17));
  v128 = a5 * a5;
  v19 = sqrt(a5 * a5 - v18 * v18);
  v20 = atan(INFINITY);
  v21 = __sincos_stret(v20);
  v22 = sqrt((var2 + v140 + v19 * v21.__cosval - v15) * (var2 + v140 + v19 * v21.__cosval - v15)+ (v17 + v19 * v21.__sinval - v14) * (v17 + v19 * v21.__sinval - v14));
  v132 = var2 + v140;
  v133 = v14;
  v23 = sqrt((var2 + v140 - v19 * v21.__cosval - v15) * (var2 + v140 - v19 * v21.__cosval - v15)+ (v17 - v19 * v21.__sinval - v14) * (v17 - v19 * v21.__sinval - v14));
  if (v22 >= v23)
    v24 = v17 - v19 * v21.__sinval;
  else
    v24 = v17 + v19 * v21.__sinval;
  v126 = v24;
  if (v22 >= v23)
    v25 = var2 + v140 - v19 * v21.__cosval;
  else
    v25 = var2 + v140 + v19 * v21.__cosval;
  v134 = v25;
  objc_msgSend(v16, "addLineToPoint:", 0x7FF0000000000000);
  v26 = __sincos_stret(a6);
  v27 = v141 + v26.__cosval * a5;
  v28 = v13 + v26.__sinval * a5;
  v29 = __sincos_stret(a6 + -1.57079633);
  v30 = v29.__cosval * var2 * 0.5;
  v136 = v13;
  v137 = a5;
  v31 = v27 + v30;
  v124 = var2;
  v32 = v29.__sinval * var2 * 0.5;
  v33 = v28 + v32;
  v34 = v27 - v30;
  v35 = v28 - v32;
  *(float *)&v32 = v33 - v13;
  *(float *)&v30 = v31 - v141;
  v36 = atan2f(*(float *)&v32, *(float *)&v30);
  v37 = v35 - v13;
  v38 = v34 - v141;
  v39 = atan2f(v37, v38);
  v40 = v39;
  v41 = -v36;
  if (v36 >= 0.0)
    v41 = v36;
  if (v39 >= 0.0)
    v42 = v39;
  else
    v42 = -v40;
  if ((v12 & (v41 < v42)) != 0)
    v43 = v36;
  else
    v43 = v40;
  v44 = v43 == v36;
  if ((v12 & v44) != 0)
    v45 = v31;
  else
    v45 = v34;
  if ((v12 & v44) != 0)
    v46 = v33;
  else
    v46 = v35;
  if ((v12 & v44) != 0)
    v33 = v35;
  else
    v34 = v31;
  v47 = v126 - v136;
  v48 = v134 - v141;
  v125 = atan2f(v47, v48);
  v127 = v43;
  objc_msgSend(v16, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v141, v136, v137);
  v49 = v138 * 0.600000024;
  v139 = v45;
  v50 = v45 + v49 * v26.__cosval;
  v135 = v46;
  v51 = v46 + v49 * v26.__sinval;
  v52 = v33;
  objc_msgSend(v16, "addLineToPoint:", v50, v51);
  v53 = v34 + v49 * v26.__cosval;
  v54 = v33 + v49 * v26.__sinval;
  objc_msgSend(v16, "addLineToPoint:", v53, v54);
  objc_msgSend(v16, "addLineToPoint:", v34, v33);
  v122 = v51;
  v123 = v50;
  if (v34 == v141)
  {
    v57 = v34;
    v55 = v136;
    v59 = v137;
    v56 = v121;
    v58 = 0.0;
  }
  else
  {
    v55 = v136;
    v56 = (v33 - v136) / (v34 - v141);
    v57 = v33 - v56 * v34;
    if (v56 == 0.0)
    {
      v58 = INFINITY;
    }
    else if (v56 == INFINITY)
    {
      v56 = INFINITY;
      v58 = 0.0;
    }
    else
    {
      v58 = -1.0 / v56;
    }
    v59 = v137;
  }
  v60 = v59 - v124;
  v61 = fabs(v58);
  v62 = v61 == INFINITY;
  if (v61 == INFINITY)
    v63 = v141;
  else
    v63 = v55 - v58 * v141;
  if (v62)
    v64 = INFINITY;
  else
    v64 = v58;
  v130 = v54;
  v131 = v53;
  if (v56 == v64)
  {
    v65 = NAN;
    v66 = NAN;
    goto LABEL_52;
  }
  if (v56 == INFINITY)
  {
    v66 = v57;
LABEL_51:
    v65 = v63 + v64 * v66;
    goto LABEL_52;
  }
  if (v64 == INFINITY)
  {
    v66 = v63;
    v64 = v56;
    v63 = v57;
    goto LABEL_51;
  }
  v66 = (v63 - v57) / (v56 - v64);
  v65 = v57 + v56 * v66;
LABEL_52:
  v67 = sqrt((v55 - v65) * (v55 - v65) + (v141 - v66) * (v141 - v66));
  v68 = v60 * v60;
  v69 = sqrt(v60 * v60 - v67 * v67);
  v70 = atan(v56);
  v71 = __sincos_stret(v70);
  v72 = sqrt((v66 + v69 * v71.__cosval - v34) * (v66 + v69 * v71.__cosval - v34)+ (v65 + v69 * v71.__sinval - v52) * (v65 + v69 * v71.__sinval - v52));
  v73 = sqrt((v66 - v69 * v71.__cosval - v34) * (v66 - v69 * v71.__cosval - v34)+ (v65 - v69 * v71.__sinval - v52) * (v65 - v69 * v71.__sinval - v52));
  if (v72 >= v73)
    v74 = v65 - v69 * v71.__sinval;
  else
    v74 = v65 + v69 * v71.__sinval;
  if (v72 >= v73)
    v75 = v66 - v69 * v71.__cosval;
  else
    v75 = v66 + v69 * v71.__cosval;
  v76 = 0.0;
  if (v139 == v141)
  {
    v77 = INFINITY;
    v78 = v139;
  }
  else
  {
    v77 = (v135 - v55) / (v139 - v141);
    v78 = v135 - v77 * v139;
    if (v77 == 0.0)
    {
      v76 = INFINITY;
    }
    else if (v77 == INFINITY)
    {
      v77 = INFINITY;
    }
    else
    {
      v76 = -1.0 / v77;
    }
  }
  v79 = fabs(v76);
  v80 = v79 == INFINITY;
  if (v79 == INFINITY)
    v81 = v141;
  else
    v81 = v55 - v76 * v141;
  if (v80)
    v76 = INFINITY;
  if (v77 == v76)
  {
    v82 = NAN;
    v83 = NAN;
    goto LABEL_77;
  }
  if (v77 == INFINITY)
  {
    v83 = v78;
LABEL_76:
    v82 = v81 + v76 * v83;
    goto LABEL_77;
  }
  if (v76 == INFINITY)
  {
    v83 = v81;
    v76 = v77;
    v81 = v78;
    goto LABEL_76;
  }
  v83 = (v81 - v78) / (v77 - v76);
  v82 = v78 + v77 * v83;
LABEL_77:
  v84 = sqrt((v55 - v82) * (v55 - v82) + (v141 - v83) * (v141 - v83));
  v85 = sqrt(v68 - v84 * v84);
  v86 = atan(v77);
  v87 = __sincos_stret(v86);
  v88 = sqrt((v83 + v85 * v87.__cosval - v139) * (v83 + v85 * v87.__cosval - v139)+ (v82 + v85 * v87.__sinval - v135) * (v82 + v85 * v87.__sinval - v135));
  v89 = sqrt((v83 - v85 * v87.__cosval - v139) * (v83 - v85 * v87.__cosval - v139)+ (v82 - v85 * v87.__sinval - v135) * (v82 - v85 * v87.__sinval - v135));
  v90 = v88 < v89;
  if (v88 >= v89)
    v91 = v82 - v85 * v87.__sinval;
  else
    v91 = v82 + v85 * v87.__sinval;
  if (v90)
    v92 = v83 + v85 * v87.__cosval;
  else
    v92 = v83 - v85 * v87.__cosval;
  objc_msgSend(v16, "addCurveToPoint:controlPoint1:controlPoint2:", v92, v91, v75, v74, v75, v74);
  objc_msgSend(v16, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v141, v55, v60, v127, v125);
  v93 = 0.0;
  v94 = v129 + v140 * 0.0;
  v95 = sqrt((v141 - v140) * (v141 - v140) + (v55 - v94) * (v55 - v94));
  v96 = sqrt(v128 - v95 * v95);
  v97 = v94 + v96 * v21.__sinval;
  v98 = v94 - v96 * v21.__sinval;
  v99 = sqrt((v140 + v96 * v21.__cosval - v132) * (v140 + v96 * v21.__cosval - v132) + (v97 - v133) * (v97 - v133)) < sqrt((v140 - v96 * v21.__cosval - v132) * (v140 - v96 * v21.__cosval - v132) + (v98 - v133) * (v98 - v133));
  if (v99)
    v100 = v97;
  else
    v100 = v98;
  if (v99)
    v101 = v140 + v96 * v21.__cosval;
  else
    v101 = v140 - v96 * v21.__cosval;
  if (v101 == v141)
  {
    v102 = INFINITY;
    v103 = v101;
  }
  else
  {
    v102 = (v100 - v55) / (v101 - v141);
    v103 = v100 - v102 * v101;
    if (v102 == 0.0)
    {
      v93 = INFINITY;
    }
    else if (v102 == INFINITY)
    {
      v102 = INFINITY;
    }
    else
    {
      v93 = -1.0 / v102;
    }
  }
  v104 = fabs(v93);
  v105 = v104 == INFINITY;
  if (v104 == INFINITY)
    v106 = v141;
  else
    v106 = v55 - v93 * v141;
  if (v105)
    v93 = INFINITY;
  if (v102 == v93)
  {
    v107 = NAN;
    v108 = NAN;
    goto LABEL_108;
  }
  if (v102 == INFINITY)
  {
    v108 = v103;
LABEL_107:
    v107 = v106 + v93 * v108;
    goto LABEL_108;
  }
  if (v93 == INFINITY)
  {
    v108 = v106;
    v93 = v102;
    v106 = v103;
    goto LABEL_107;
  }
  v108 = (v106 - v103) / (v102 - v93);
  v107 = v103 + v102 * v108;
LABEL_108:
  v109 = sqrt((v55 - v107) * (v55 - v107) + (v141 - v108) * (v141 - v108));
  v110 = sqrt(v68 - v109 * v109);
  v111 = atan(v102);
  v112 = __sincos_stret(v111);
  v113 = v108 + v110 * v112.__cosval;
  v114 = v107 + v110 * v112.__sinval;
  if (sqrt((v113 - v101) * (v113 - v101) + (v114 - v100) * (v114 - v100)) >= sqrt((v108 - v110 * v112.__cosval - v101)* (v108 - v110 * v112.__cosval - v101)+ (v107 - v110 * v112.__sinval - v100)* (v107 - v110 * v112.__sinval - v100)))
  {
    v114 = v107 - v110 * v112.__sinval;
    v113 = v108 - v110 * v112.__cosval;
  }
  objc_msgSend(v16, "addCurveToPoint:controlPoint1:controlPoint2:", v101, v100, v113, v114, v113, v114);
  objc_msgSend(v16, "addLineToPoint:", v140, v133);
  v115 = (v132 - v140) * 0.5;
  if (a4->var43)
    v116 = sqrt((v132 - v140) * (v132 - v140) + v115 * v115) * 0.5;
  else
    v116 = 0.0;
  objc_msgSend(v16, "addQuadCurveToPoint:controlPoint:", v132, v133, v140 + v115, v133 + v116);
  objc_msgSend(v16, "closePath");
  memset(&v143, 0, sizeof(v143));
  CGAffineTransformMakeTranslation(&v143, v131, v130);
  v117 = v122 - v130;
  v118 = v123 - v131;
  v119 = atan2f(v117, v118);
  v142 = v143;
  CGAffineTransformRotate((CGAffineTransform *)__dst, &v142, v119);
  v143 = *(CGAffineTransform *)__dst;
  memcpy(__dst, a4, sizeof(__dst));
  MKArrowAppendArrowheadToPathAndReturnMetricsWithStemAdjustment(v16, (uint64_t)__dst, 0, (__int128 *)&v143, 0.0);
  return v16;
}

- (void)getRoundaboutArrowPath:(id *)a3 intersectionBackgroundPath:(id *)a4 strokePath:(id *)a5 withSize:(CGSize)a6 metrics:(id *)a7 drivingSide:(int)a8 visualCenter:(CGPoint *)a9
{
  double height;
  uint64_t v15;
  double var19;
  double v17;
  double v18;
  GEOJunctionElement *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double var6;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  uint64_t v31;
  int v32;
  GEOJunctionElement *v33;
  void *v34;
  double v35;
  void *v36;
  double v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  double v43;
  double v44;
  double v45;
  double v46;
  uint64_t v47;
  double v48;
  double v49;
  double v50;
  double v51;
  float v52;
  long double v53;
  double x;
  __double2 v55;
  double v56;
  double y;
  double v58;
  double v59;
  double v60;
  __double2 v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  BOOL v69;
  double v70;
  double v71;
  double v72;
  double sinval;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  __double2 v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  BOOL v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  float v107;
  float v108;
  double v109;
  float v110;
  float v111;
  double v112;
  double v113;
  double v114;
  double v115;
  uint64_t v116;
  double v117;
  double v118;
  float v119;
  float v120;
  double v121;
  float v122;
  float v123;
  id *v124;
  id v125;
  id *v126;
  double width;
  double v129;
  void *v131;
  double v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double var2;
  double v141;
  double v142;
  double v143;
  double v144;
  double v145;
  double v146;
  double v147;
  double v148;
  double v149;
  double v150;
  double v151;
  double v152;
  double v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  CGAffineTransform v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  _BYTE __dst[496];
  CGPoint v163;
  _BYTE v164[128];
  uint64_t v165;

  height = a6.height;
  v15 = 0;
  v165 = *MEMORY[0x1E0C80C00];
  var2 = a7->var2;
  var19 = a7->var19;
  width = a6.width;
  if (a6.width >= height)
    v17 = height;
  else
    v17 = a6.width;
  v163 = (CGPoint)0;
  v18 = 0.0;
  do
  {
    v19 = self->_snapped[v15];
    if (v19 && v19->var2 == 2)
      v18 = (double)v15 * 0.785398163 + -1.57079633;
    ++v15;
  }
  while (v15 != 8);
  v137 = v17 * (var19 / 55.0);
  v129 = v137 - var2;
  v20 = fmod(v18, 6.28318531);
  v21 = v20;
  if (a8 == 1)
  {
    v22 = v20 + 6.28318531;
    if (v21 >= 0.0)
      v22 = v21;
    v23 = 3.14159265;
    if (v22 > 3.14159265)
      v23 = 9.42477796;
    v21 = v23 - v22;
  }
  v126 = a3;
  memcpy(__dst, a7, sizeof(__dst));
  -[MKJunction roundaboutArrowWithSize:metrics:outerRadius:endAngle:pivot:](self, "roundaboutArrowWithSize:metrics:outerRadius:endAngle:pivot:", __dst, &v163, width, height, v137, v21);
  v125 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPath");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v163, v137, 0.0, 6.28318531);
  objc_msgSend(v24, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v163, v129, 6.28318531, 0.0);
  objc_msgSend(v24, "closePath");
  var6 = a7->var6;
  if (v163.x - v137 >= v163.y - v137)
    v26 = v163.y - v137;
  else
    v26 = v163.x - v137;
  if (v26 >= width - (v163.x - v137))
    v27 = width - (v163.x - v137);
  else
    v27 = v26;
  v28 = height - (v163.y - v137);
  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPath");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v150 = *MEMORY[0x1E0C9D538];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  v32 = a8;
  do
  {
    v33 = self->_snapped[v31];
    if (v33 && !v33->var2)
    {
      v34 = (void *)MEMORY[0x1E0CB37E8];
      v35 = fmod((double)v31 * 0.785398163 + -1.57079633, 6.28318531);
      if (a8 == 1)
      {
        if (v35 < 0.0)
          v35 = v35 + 6.28318531;
        if (v35 <= 3.14159265)
          v35 = 3.14159265 - v35;
        else
          v35 = 9.42477796 - v35;
      }
      objc_msgSend(v34, "numberWithDouble:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v131, "addObject:", v36);

    }
    ++v31;
  }
  while (v31 != 8);
  if (v27 < v28)
    v28 = v27;
  if (var6 >= var2 * 0.5)
    v37 = var2 * 0.5;
  else
    v37 = var6;
  v136 = v37;
  if (a7->var42 || !objc_msgSend(v131, "count"))
  {
    objc_msgSend(v29, "moveToPoint:", v137 + v163.x, v163.y);
    objc_msgSend(v29, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v163, v137, 0.0, 6.28318531);
    goto LABEL_39;
  }
  objc_msgSend(v131, "sortUsingSelector:", sel_compare_);
  v160 = 0u;
  v161 = 0u;
  v158 = 0u;
  v159 = 0u;
  v38 = v131;
  v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v158, v164, 16);
  if (v39)
  {
    v40 = v39;
    v124 = a5;
    v41 = 0;
    v42 = *(_QWORD *)v159;
    v149 = v137 * v137;
    v138 = fabs(v136);
    v139 = v137 + v28 - v136;
    v43 = v30;
    v44 = v30;
    v45 = v150;
    v134 = v30;
    v135 = v150;
    v132 = v30;
    v133 = v150;
    v46 = v150;
    while (1)
    {
      v47 = 0;
      v48 = v43;
      v49 = v45;
      v50 = v44;
      v51 = v46;
      do
      {
        v142 = v51;
        v143 = v48;
        v145 = v50;
        v146 = v49;
        if (*(_QWORD *)v159 != v42)
          objc_enumerationMutation(v38);
        objc_msgSend(*(id *)(*((_QWORD *)&v158 + 1) + 8 * v47), "floatValue");
        v53 = v52;
        x = v163.x;
        v55 = __sincos_stret(v52 + -1.57079633);
        v56 = var2 * v55.__cosval * 0.5;
        y = v163.y;
        v58 = var2 * v55.__sinval * 0.5;
        v59 = v163.y + v58;
        v60 = v163.y - v58;
        v61 = __sincos_stret(v53);
        v62 = tan(v53);
        v63 = -v62;
        if (v62 >= 0.0)
          v63 = v62;
        if (v63 <= 10000000.0)
          v64 = v59 - v62 * (x + v56);
        else
          v64 = x + v56;
        v65 = INFINITY;
        if (v63 <= 10000000.0)
          v66 = v62;
        else
          v66 = INFINITY;
        v67 = v60 - v62 * (x - v56);
        if (v63 > 10000000.0)
          v67 = x - v56;
        if (v66 != 0.0)
        {
          v65 = 0.0;
          if (v66 != INFINITY)
            v65 = -1.0 / v66;
        }
        v68 = fabs(v65);
        v69 = v68 == INFINITY;
        if (v68 == INFINITY)
          v70 = x;
        else
          v70 = y - v65 * x;
        if (v69)
          v65 = INFINITY;
        v152 = var2 * v55.__cosval * 0.5;
        v141 = v64;
        if (v66 == v65)
        {
          v71 = NAN;
          v72 = NAN;
LABEL_76:
          sinval = v61.__sinval;
          goto LABEL_82;
        }
        if (v66 == INFINITY)
        {
          v72 = v67;
        }
        else
        {
          if (v65 != INFINITY)
          {
            v72 = (v70 - v67) / (v66 - v65);
            v71 = v67 + v66 * v72;
            goto LABEL_76;
          }
          v72 = v70;
          v65 = v66;
          v70 = v67;
        }
        sinval = v61.__sinval;
        v71 = v70 + v65 * v72;
LABEL_82:
        v74 = x + v61.__cosval * v139;
        v75 = y + sinval * v139;
        v76 = sqrt((y - v71) * (y - v71) + (x - v72) * (x - v72));
        v77 = sqrt(v149 - v76 * v76);
        v78 = atan(v66);
        v79 = __sincos_stret(v78);
        v80 = v72 + v77 * v79.__cosval;
        v81 = v72 - v77 * v79.__cosval;
        v82 = sqrt((v80 - v74) * (v80 - v74) + (v71 + v77 * v79.__sinval - v75) * (v71 + v77 * v79.__sinval - v75));
        v83 = sqrt((v81 - v74) * (v81 - v74) + (v71 - v77 * v79.__sinval - v75) * (v71 - v77 * v79.__sinval - v75));
        if (v82 >= v83)
          v44 = v71 - v77 * v79.__sinval;
        else
          v44 = v71 + v77 * v79.__sinval;
        if (v82 >= v83)
          v80 = v81;
        v151 = v80;
        if (v66 == 0.0)
        {
          v84 = INFINITY;
        }
        else
        {
          v84 = 0.0;
          if (v66 != INFINITY)
            v84 = -1.0 / v66;
        }
        v85 = fabs(v84);
        v86 = v85 == INFINITY;
        if (v85 == INFINITY)
          v87 = x;
        else
          v87 = y - v84 * x;
        if (v86)
          v88 = INFINITY;
        else
          v88 = v84;
        if (v66 == v88)
        {
          v89 = NAN;
          v90 = NAN;
          v91 = var2 * v55.__sinval * 0.5;
          goto LABEL_104;
        }
        v91 = var2 * v55.__sinval * 0.5;
        if (v66 == INFINITY)
        {
          v90 = v141;
LABEL_103:
          v89 = v87 + v88 * v90;
          goto LABEL_104;
        }
        if (v88 == INFINITY)
        {
          v90 = v87;
          v88 = v66;
          v87 = v141;
          goto LABEL_103;
        }
        v90 = (v87 - v141) / (v66 - v88);
        v89 = v141 + v66 * v90;
LABEL_104:
        v92 = v74 + v152;
        v93 = v75 + v91;
        v43 = v75 - v91;
        v94 = y - v89;
        v46 = v74 - v152;
        v95 = sqrt(v94 * v94 + (x - v90) * (x - v90));
        v96 = sqrt(v149 - v95 * v95);
        v97 = v90 + v96 * v79.__cosval;
        v98 = v89 + v96 * v79.__sinval;
        v99 = v90 - v96 * v79.__cosval;
        v100 = v89 - v96 * v79.__sinval;
        v101 = sqrt((v97 - v74) * (v97 - v74) + (v98 - v75) * (v98 - v75));
        v102 = sqrt((v99 - v74) * (v99 - v74) + (v100 - v75) * (v100 - v75));
        if (v101 >= v102)
          v103 = v100;
        else
          v103 = v98;
        if (v101 >= v102)
          v104 = v99;
        else
          v104 = v97;
        objc_msgSend(v24, "moveToPoint:", v104, v103);
        v153 = v93;
        objc_msgSend(v24, "addLineToPoint:", v92, v93);
        if (v138 > 2.22044605e-16)
          -[MKJunction _addJunctionStemCapToPath:fromStartPoint:topEndPoint:cornerRadius:](self, "_addJunctionStemCapToPath:fromStartPoint:topEndPoint:cornerRadius:", v24, v92, v93, v46, v43, v136);
        objc_msgSend(v24, "addLineToPoint:", v46, v43);
        v45 = v151;
        objc_msgSend(v24, "addLineToPoint:", v151, v44);
        objc_msgSend(v24, "addLineToPoint:", v104, v103);
        objc_msgSend(v24, "closePath");
        if ((v41 & 1) != 0)
        {
          objc_msgSend(v29, "moveToPoint:", v142, v143);
          v147 = v44;
          objc_msgSend(v29, "addLineToPoint:", v146, v145);
          v148 = v43;
          v105 = v163.y;
          v144 = v46;
          v106 = v163.x;
          v107 = v145 - v163.y;
          v108 = v146 - v163.x;
          v109 = atan2f(v107, v108);
          v110 = v103 - v105;
          v111 = v104 - v106;
          v112 = atan2f(v110, v111);
          v113 = v106;
          v46 = v144;
          v114 = v105;
          v115 = v109;
          v44 = v147;
          v43 = v148;
          objc_msgSend(v29, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v113, v114, v137, v115, v112);
          objc_msgSend(v29, "addLineToPoint:", v92, v153);
        }
        else
        {
          v134 = v153;
          v135 = v92;
          v132 = v103;
          v133 = v104;
        }
        ++v47;
        v41 = 1;
        v48 = v43;
        v49 = v151;
        v50 = v44;
        v51 = v46;
      }
      while (v40 != v47);
      v116 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v158, v164, 16, v151, v44, v43, v46);
      v40 = v116;
      if (!v116)
      {

        objc_msgSend(v29, "moveToPoint:", v46, v43);
        objc_msgSend(v29, "addLineToPoint:", v151, v44);
        v117 = v163.y;
        v118 = v163.x;
        v119 = v44 - v163.y;
        v120 = v151 - v163.x;
        v121 = atan2f(v119, v120);
        v122 = v132 - v117;
        v123 = v133 - v118;
        objc_msgSend(v29, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v118, v117, v137, v121, atan2f(v122, v123));
        objc_msgSend(v29, "addLineToPoint:", v135, v134);
        a5 = v124;
        v32 = a8;
        goto LABEL_39;
      }
    }
  }

LABEL_39:
  objc_msgSend(v29, "moveToPoint:", v129 + v163.x, v163.y);
  objc_msgSend(v29, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v163, v129, 0.0, 6.28318531);
  if (v32 == 1)
  {
    memset(__dst, 0, 48);
    CGAffineTransformMakeScale(&v157, -1.0, 1.0);
    CGAffineTransformTranslate((CGAffineTransform *)__dst, &v157, -width, 0.0);
    v154 = *(_OWORD *)__dst;
    v155 = *(_OWORD *)&__dst[16];
    v156 = *(_OWORD *)&__dst[32];
    objc_msgSend(v24, "applyTransform:", &v154);
    v154 = *(_OWORD *)__dst;
    v155 = *(_OWORD *)&__dst[16];
    v156 = *(_OWORD *)&__dst[32];
    objc_msgSend(v29, "applyTransform:", &v154);
    v154 = *(_OWORD *)__dst;
    v155 = *(_OWORD *)&__dst[16];
    v156 = *(_OWORD *)&__dst[32];
    objc_msgSend(v125, "applyTransform:", &v154);
  }
  if (v126)
    *v126 = objc_retainAutorelease(v125);
  if (a4)
    *a4 = objc_retainAutorelease(v24);
  if (a5)
    *a5 = objc_retainAutorelease(v29);
  if (a9)
    *a9 = v163;

}

- (void)encodeWithCoder:(id)a3
{
  uint64_t type;
  void *v5;
  id v6;

  type = self->_type;
  v6 = a3;
  objc_msgSend(v6, "encodeInteger:forKey:", type, CFSTR("kJuctionTypeEncodingKey"));
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", self->_elements, 16 * self->_count);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("kJunctionElementsEncodingKey"));

  objc_msgSend(v6, "encodeInt:forKey:", LODWORD(self->_count), CFSTR("kJunctionElementsCountEncodingKey"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_maneuver, CFSTR("kJunctionManeuverEncodingKey"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_drivingSide, CFSTR("kJunctionDrivingSideEncodingKey"));

}

- (MKJunction)initWithCoder:(id)a3
{
  id v4;
  int v5;
  size_t v6;
  void *v7;
  MKJunction *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("kJunctionElementsCountEncodingKey"));
  if (v5 < 0)
  {
    v8 = 0;
  }
  else
  {
    v6 = v5;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kJunctionElementsEncodingKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length") >= 16 * v6)
    {
      v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kJunctionManeuverEncodingKey"));
      v10 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kJuctionTypeEncodingKey"));
      v11 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kJunctionDrivingSideEncodingKey"));
      v12 = malloc_type_calloc(0x10uLL, v6, 0x5FAC28F0uLL);
      memcpy(v12, (const void *)objc_msgSend(objc_retainAutorelease(v7), "bytes"), 16 * v6);
      self = -[MKJunction initWithType:maneuver:drivingSide:elements:count:](self, "initWithType:maneuver:drivingSide:elements:count:", v10, v9, v11, v12, v6);
      free(v12);
      v8 = self;
    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int)type
{
  return self->_type;
}

@end
